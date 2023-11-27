<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
// Obter parâmetros do formulário
String nome = request.getParameter("nome");
int idade = Integer.parseInt(request.getParameter("cd_idade"));
String dataNascimento = request.getParameter("dt_dataNascimento");
String nomeGuerra = request.getParameter("nm_guerra");
String nomePatente = request.getParameter("nm_patente");
String nomeUsuario = request.getParameter("nm_usuarioLogin");
String senha = request.getParameter("senha");

try {
    // Carregar o driver JDBC
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Estabelecer a conexão com o banco de dados
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
    
    // Criar uma instrução SQL
    Statement stmt = conn.createStatement();
    
    // Verificar se o nome de usuário já está em uso
    String verificaUsuario = "SELECT * FROM usuario WHERE nm_usuarioLogin=?";
    PreparedStatement ps = conn.prepareStatement(verificaUsuario);
    ps.setString(1, nomeUsuario);
    ResultSet rs = ps.executeQuery();
    
    if (rs.next()) {
        out.println("Nome de usuário já está em uso. Escolha outro.");
    } else {
        // Inserir novo usuário no banco de dados
        String inserirUsuario = "INSERT INTO usuario (nm_usuario,cd_idade,dt_dataNascimento,nm_guerra,nm_patente,nm_usuarioLogin,cd_senha) VALUES (?, ?, ?, ?, ?, ?, ?)";
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
    
    // Fechar recursos
    rs.close();
    ps.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    // Tratar exceções, se ocorrerem
    out.println("Erro: " + e.getMessage());
}
%>
