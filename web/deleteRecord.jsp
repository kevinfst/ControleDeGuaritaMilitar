<%@ page import="java.sql.*" %>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/alimentos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

    // Check if the request contains a record ID
    String recordIdStr = request.getParameter("recordId");
    if (recordIdStr != null) {
        int recordId = Integer.parseInt(recordIdStr);
        
        // Perform the record deletion
        String deleteQuery = "DELETE FROM alimentos WHERE id=?";
        PreparedStatement preparedStatement = conn.prepareStatement(deleteQuery);
        preparedStatement.setInt(1, recordId);
        
        int rowsDeleted = preparedStatement.executeUpdate();
        preparedStatement.close();

        // Check if the record was deleted successfully
        if (rowsDeleted > 0) {
%>
<div class="alert alert-success" role="alert">
    Record deleted successfully!
</div>
<%
        } else {
%>
<div class="alert alert-danger" role="alert">
    Failed to delete the record.
</div>
<%
        }
    }
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<a href="painel.jsp">Back to the List</a>
