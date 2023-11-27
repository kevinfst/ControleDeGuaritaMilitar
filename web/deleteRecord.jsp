<%@ page import="java.sql.*" %>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
   
    // Check if the request contains a record ID
    int idEscala = Integer.parseInt(request.getParameter("idEscala"));
    if (idEscala != 0) {
        // Perform the record deletion
        String deleteQuery = "DELETE FROM escala_guarda WHERE id_usuario = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(deleteQuery);
        
        preparedStatement.setInt(1, idEscala);
        
        int rowsDeleted = preparedStatement.executeUpdate();
        preparedStatement.close();

        // Check if the record was deleted successfully
        if (rowsDeleted > 0) {
%>
<script>
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
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<a href="painel.jsp">Voltar para a lista</a>
