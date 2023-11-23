<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String nome = request.getParameter("nome");
int idade = Integer.parseInt(request.getParameter("cd_idade"));
String dataNascimento = request.getParameter("dt_dataNascimento");
String nomeGuerra = request.getParameter("nm_guerra");
String nomePatente = request.getParameter("nm_patente");
String nomeUsuario = request.getParameter("nm_usuarioLogin");
String senha = request.getParameter("senha");






try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
    Statement stmt = conn.createStatement();
    
    // Verificar se o email já está em uso
    String verificaEmail = "SELECT * FROM usuario WHERE nm_usuarioLogin=?";
    PreparedStatement ps = conn.prepareStatement(verificaEmail);
    ps.setString(1, nomeUsuario);
    ResultSet rs = ps.executeQuery();
    
    if (rs.next()) {
        out.println("Email já está em uso. Escolha outro.");
    } else {
        String inserirUsuario = "INSERT INTO usuario (nm_usuario,cd_idade,dt_dataNascimento,nm_guerra,nm_patente,nm_usuarioLogin,cd_senha) VALUES (?, ?, ?,?,?,?,?)";
        ps = conn.prepareStatement(inserirUsuario);
        ps.setString(1, nome);
        ps.setInt(2, idade);       
        ps.setString(3, dataNascimento);
        ps.setString(4, nomeGuerra);
        ps.setString(5, nomePatente); 
        ps.setString(6, nomeUsuario); 
        ps.setString(7, senha);

        ps.executeUpdate();
        out.println("Registro bem-sucedido. <a href='index.jsp'>Faça o login</a>");
    }
    
    ps.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("Erro: " + e.getMessage());
}
%>
