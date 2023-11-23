<%@ page import="java.sql.*, java.math.BigDecimal, java.util.Random" %>

<%
// Retrieve form data from request
String nome = request.getParameter("nome");
String descricao = request.getParameter("descricao");
String preco = request.getParameter("preco");
String categoria = request.getParameter("categoria");
String origem = request.getParameter("origem");
String dataValidade = request.getParameter("data_validade");
String calorias = request.getParameter("calorias");
String pesoGramas = request.getParameter("peso_gramas");
String fabricante = request.getParameter("fabricante");

// Generate a random 12-digit barcode
Random random = new Random();
StringBuilder barcodeBuilder = new StringBuilder();
for (int i = 0; i < 12; i++) {
    barcodeBuilder.append(random.nextInt(10));
}
String codigoDeBarras = barcodeBuilder.toString();

// Database connection parameters
String dbUrl = "jdbc:mysql://localhost/alimentos?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String dbUser = "root";
String dbPassword = "";

Connection conn = null;
PreparedStatement stmt = null;

try {
    // Connect to the database
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // SQL query to insert a new record
    String sql = "INSERT INTO alimentos (nome, descricao, preco, categoria, origem, data_validade, calorias, peso_gramas, fabricante, codigo_de_barras) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    stmt = conn.prepareStatement(sql);
    stmt.setString(1, nome);
    stmt.setString(2, descricao);
    stmt.setBigDecimal(3, new BigDecimal(preco));
    stmt.setString(4, categoria);
    stmt.setString(5, origem);
    stmt.setDate(6, Date.valueOf(dataValidade));
    stmt.setInt(7, Integer.parseInt(calorias));
    stmt.setBigDecimal(8, new BigDecimal(pesoGramas));
    stmt.setString(9, fabricante);
    stmt.setString(10, codigoDeBarras);

    // Execute the SQL query to insert the new record
    int rowsAffected = stmt.executeUpdate();

    if (rowsAffected > 0) {
        // Record was successfully added
        response.sendRedirect("painel.jsp");
    } else {
        // Record insertion failed
        response.sendRedirect("your_failure_page.jsp");
    }

} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("your_error_page.jsp");
} finally {
    // Close resources
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
