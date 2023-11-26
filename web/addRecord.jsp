<%@ page import="java.sql.*, java.math.BigDecimal, java.util.Random" %>

<%
// Retrieve form data from request

String escala = request.getParameter("tipo_escala");
int cabelo_conformidade = Integer.parseInt(request.getParameter("corte_cabelo_conformidade"));
int identificacao_conformidade = Integer.parseInt(request.getParameter("identificacao_militar_conformidade"));
int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));


// Generate a random 12-digit barcode
Random random = new Random();
StringBuilder barcodeBuilder = new StringBuilder();
for (int i = 0; i < 12; i++) {
    barcodeBuilder.append(random.nextInt(10));
}
String codigoDeBarras = barcodeBuilder.toString();

// Database connection parameters
String dbUrl = "jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String dbUser = "root";
String dbPassword = "";

Connection conn = null;
PreparedStatement stmt = null;

try {
    // Connect to the database
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // SQL query to insert a new record
   String escalaDef = "INSERT INTO escala_guarda (id_usuario, corte_cabelo_conformidade, identificacao_militar_conformidade, tipo_escala) VALUES (?,?,?,?)";    
stmt = conn.prepareStatement(escalaDef); //executar
stmt.setInt(1, id_usuario);
stmt.setInt(2, cabelo_conformidade);
stmt.setInt(3, identificacao_conformidade);
stmt.setString(4, escala);


   
    

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
