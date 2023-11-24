<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String email = request.getParameter("email");
String senha = request.getParameter("senha");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
    Statement stmt = conn.createStatement();
    
    String verificarUsuario = "SELECT * FROM usuario WHERE nm_usuarioLogin=? AND cd_senha=?";
    PreparedStatement ps = conn.prepareStatement(verificarUsuario);
    ps.setString(1, email);
    ps.setString(2, senha);
    ResultSet rs = ps.executeQuery();
    
    if (rs.next()) {
 
         // Login bem-sucedido, defina a variável de sessão e redirecione para o painel
        String nomeUsuario = rs.getString("nm_usuario");
        int idUsuario = rs.getInt("id_usuario"); // Supondo que o ID do usuário seja um inteiro
        String nomePatente = rs.getString("nm_patente"); 
        session.setAttribute("nm_patente", nomePatente);
        session.setAttribute("nomeUsuario", nomeUsuario);
        session.setAttribute("idUsuario", idUsuario);
        response.sendRedirect("painel.jsp");
    } else {
        out.println("Login falhou. Verifique suas credenciais. <a href='login.jsp'>Tentar novamente</a>");
    }
    
    ps.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("Erro: " + e.getMessage());
}
%>
