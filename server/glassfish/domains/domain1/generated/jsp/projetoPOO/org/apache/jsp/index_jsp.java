package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class index_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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

      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("<section class=\"vh-100\" style=\"background-color: #508bfc;\">\n");
      out.write("    <div class=\"container py-5 h-100\">\n");
      out.write("        <div class=\"row d-flex justify-content-center align-items-center h-100\">\n");
      out.write("            <div class=\"col-12 col-md-8 col-lg-6 col-xl-5\">\n");
      out.write("                <div class=\"card shadow-2-strong\" style=\"border-radius: 1rem;\">\n");
      out.write("                    <div class=\"card-body p-5 text-center\">\n");
      out.write("\n");
      out.write("                        <h3 class=\"mb-5\">Entrar</h3>\n");
      out.write("                        <form action=\"login_processar.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"form-outline mb-4\">\n");
      out.write("                                <input type=\"text\" id=\"typeEmailX-2\" placeholder=\"Nome de Usuario\" name=\"email\" class=\"form-control form-control-lg\" />\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-outline mb-4\">\n");
      out.write("                                <input type=\"password\" placeholder=\"Senha\" id=\"typePasswordX-2\"  name=\"senha\" class=\"form-control form-control-lg\" />\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\">Login</button>\n");
      out.write("\n");
      out.write("                        </form>\n");
      out.write("\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <p>Não tem conta? <a href=\"registro.jsp\">Cadastre-se</a></p>\n");
      out.write("                           \n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div><script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\" crossorigin=\"anonymous\"></script>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>");
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
