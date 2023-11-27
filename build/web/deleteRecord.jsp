<%@ page import="java.sql.*" %>

<%
// Tentativa de conexão com o banco de dados
try {
    // Carregando o driver JDBC e estabelecendo a conexão com o banco de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
   
    // Verifica se a requisição contém um ID de registro
    int idEscala = Integer.parseInt(request.getParameter("idEscala"));
    if (idEscala != 0) {
        // Executa a exclusão do registro
        String deleteQuery = "DELETE FROM escala_guarda WHERE id_usuario = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(deleteQuery);
        
        preparedStatement.setInt(1, idEscala);
        
        int rowsDeleted = preparedStatement.executeUpdate();
        preparedStatement.close();

        // Verifica se o registro foi excluído com sucesso
        if (rowsDeleted > 0) {
%>
<script>
    // Alerta de sucesso ao excluir o soldado
    alert("Soldado excluído com sucesso!");
    window.location.href = "painel.jsp";
</script>
<%
        } else {
%>
<div class="alert alert-danger" role="alert">
    Falha ao excluir o registro.
</div>
<%
        }
    }
    // Fecha a conexão com o banco de dados
    conn.close();
} catch (Exception e) {
    // Exibe informações de erro em caso de exceção
    e.printStackTrace();
}
%>

<a href="painel.jsp">Voltar para a lista</a>
