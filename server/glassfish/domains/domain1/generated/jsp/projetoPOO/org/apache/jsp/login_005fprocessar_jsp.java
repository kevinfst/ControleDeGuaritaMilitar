package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class login_005fprocessar_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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
        
        
        // Adicione as informações adicionais à sessão
        
    int idadeUsuario = rs.getInt("cd_idade");
    session.setAttribute("cd_idade", idadeUsuario);
    
    String dataNas = rs.getString("dt_dataNascimento");
    session.setAttribute("dt_dataNascimento", dataNas);
    
    String nomeGuerra = rs.getString("nm_guerra");
    session.setAttribute("nm_guerra", nomeGuerra);
    
    String usLogin = rs.getString("nm_usuarioLogin");
    session.setAttribute("nm_usuarioLogin", usLogin);
    
    String usSenha = rs.getString("cd_senha");
    session.setAttribute("cd_senha", usSenha);
    
    
    
    String nm_patente = rs.getString("nm_patente");
    session.setAttribute("nm_patente", nm_patente);
    
    
    

       

         
        
        
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
