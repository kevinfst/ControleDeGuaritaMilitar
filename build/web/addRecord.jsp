<%@ page import="java.sql.*, java.math.BigDecimal, java.util.Random" %>

<%
// Recupera os dados do formulário a partir da requisição

String escala = request.getParameter("tipo_escala");
int cabelo_conformidade = Integer.parseInt(request.getParameter("corte_cabelo_conformidade"));
int identificacao_conformidade = Integer.parseInt(request.getParameter("identificacao_militar_conformidade"));
int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

// Parâmetros de conexão com o banco de dados
String dbUrl = "jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String dbUser = "root";
String dbPassword = "";

Connection conn = null;
PreparedStatement stmt = null;

try {
    // Conecta-se ao banco de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // Verifica se o ID já existe no banco de dados
    String checkIdQuery = "SELECT 1 FROM escala_guarda WHERE id_usuario = ?";
    PreparedStatement checkIdStmt = conn.prepareStatement(checkIdQuery);
    checkIdStmt.setInt(1, id_usuario);
    ResultSet resultSet = checkIdStmt.executeQuery();

    if (resultSet.next()) {
        // O ID já existe no banco, emite um alerta
%>
        <script>
            alert("Soldado já inserido.");
            window.location.href = "painel.jsp";
        </script>
<%
    } else {
        // O ID não existe no banco, procede com a inserção
        String escalaDef = "INSERT INTO escala_guarda (id_usuario, corte_cabelo_conformidade, identificacao_militar_conformidade, tipo_escala) VALUES (?,?,?,?)";
        stmt = conn.prepareStatement(escalaDef);
        stmt.setInt(1, id_usuario);
        stmt.setInt(2, cabelo_conformidade);
        stmt.setInt(3, identificacao_conformidade);
        stmt.setString(4, escala);

        // Executa a consulta SQL para inserir o novo registro
        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            // O registro foi adicionado com sucesso
            response.sendRedirect("painel.jsp");
        } else {
            // Falha na inserção do registro
            response.sendRedirect("your_failure_page.jsp");
        }
    }

} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("your_error_page.jsp");
} finally {
    // Fecha os recursos
    try {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
