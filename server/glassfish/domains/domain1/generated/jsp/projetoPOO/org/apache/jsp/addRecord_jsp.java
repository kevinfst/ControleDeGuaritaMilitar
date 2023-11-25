package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.math.BigDecimal;
import java.util.Random;

public final class addRecord_jsp extends org.glassfish.wasp.runtime.HttpJspBase
    implements org.glassfish.wasp.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      response.setHeader("X-Powered-By", "JSP/3.0");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

// Retrieve form data from request
String hora_guarda = request.getParameter("dia_hora_guarda");
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
   String escalaDef = "INSERT INTO escala_guarda (id_usuario, dia_hora_guarda, corte_cabelo_conformidade, identificacao_militar_conformidade, tipo_escala) VALUES (?,?,?,?,?)";    
stmt = conn.prepareStatement(escalaDef); //executar
stmt.setInt(1, id_usuario);
stmt.setTimestamp(2, Timestamp.valueOf(hora_guarda + " 00:00:00")); // Converte a string para java.sql.Timestamp
stmt.setInt(3, cabelo_conformidade);
stmt.setInt(4, identificacao_conformidade);
stmt.setString(5, escala);


   
    

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

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
