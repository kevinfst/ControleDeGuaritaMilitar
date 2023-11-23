<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Food Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Edit Food Item</h1>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/alimentos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            // Check if the form was submitted
            if (request.getMethod().equalsIgnoreCase("POST")) {
                int recordId = Integer.parseInt(request.getParameter("recordId"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String priceStr = request.getParameter("price");
                String category = request.getParameter("category");
                String origin = request.getParameter("origin");
                Date validityDate = Date.valueOf(request.getParameter("validityDate"));
                int calories = Integer.parseInt(request.getParameter("calories"));
                int weight = Integer.parseInt(request.getParameter("weight"));
                String manufacturer = request.getParameter("manufacturer");
                
                // Convert the price from String to Double
                Double price = Double.parseDouble(priceStr);
                
                String updateQuery = "UPDATE alimentos SET nome=?, descricao=?, preco=?, categoria=?, origem=?, data_validade=?, calorias=?, peso_gramas=?, fabricante=? WHERE id=?";
                
                PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, description);
                preparedStatement.setDouble(3, price);
                preparedStatement.setString(4, category);
                preparedStatement.setString(5, origin);
                preparedStatement.setDate(6, validityDate);
                preparedStatement.setInt(7, calories);
                preparedStatement.setInt(8, weight);
                preparedStatement.setString(9, manufacturer);
                preparedStatement.setInt(10, recordId);
                
                int rowsUpdated = preparedStatement.executeUpdate();
                preparedStatement.close();
                
                if (rowsUpdated > 0) {
        %>
        <div class="alert alert-success" role="alert">
            Record updated successfully!
        </div>
        <%
                } else {
        %>
        <div class="alert alert-danger" role="alert">
            Failed to update the record.
        </div>
        <%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>

        <a href="painel.jsp">Back to the List</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
