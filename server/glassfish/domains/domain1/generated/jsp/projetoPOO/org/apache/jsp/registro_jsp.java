package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class registro_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css\" integrity=\"sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN5P1+2N4qI1i1tI6Ar2RT5I07f6JvRM\" crossorigin=\"anonymous\">\n");
      out.write("        <style>\n");
      out.write("            .form-outline i {\n");
      out.write("                position: absolute;\n");
      out.write("                top: 50%;\n");
      out.write("                transform: translateY(-50%);\n");
      out.write("                left: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn i {\n");
      out.write("                margin-right: 8px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body style=\"background-color: #508bfc;\">\n");
      out.write("        <section class=\"vh-100\" >\n");
      out.write("            <div class=\"container py-5 h-100\">\n");
      out.write("                <div class=\"row d-flex justify-content-center align-items-center h-100\">\n");
      out.write("                    <div class=\"col-12 col-md-8 col-lg-6 col-xl-5\">\n");
      out.write("                        <div class=\"card shadow-2-strong\" style=\"border-radius: 1rem;\">\n");
      out.write("                            <div class=\"card-body p-5 text-center\">\n");
      out.write("                                <h3 class=\"mb-5\">Registrar</h3>\n");
      out.write("                                <form action=\"registro_processar.jsp\" method=\"post\" class=\"row g-3 needs-validation\" novalidate>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"name\" class=\"form-label\">Nome Completo</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-user\"></i> <!-- Ícone do usuário -->\n");
      out.write("                                            <input type=\"text\" id=\"name\" placeholder=\"Nome Completo\" name=\"nome\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, insira seu nome.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"nm_usuarioLogin\" class=\"form-label\">Nome de Usuário</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-user-circle\"></i> <!-- Ícone do círculo de usuário -->\n");
      out.write("                                            <input type=\"text\" placeholder=\"Nome de Usuário\" name=\"nm_usuarioLogin\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, escolha um nome de usuário.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"nm_guerra\" class=\"form-label\">Nome de Guerra</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-shield-alt\"></i> <!-- Ícone de escudo alternativo -->\n");
      out.write("                                            <input type=\"text\" id=\"nm_guerra\" placeholder=\"Nome de Guerra\" name=\"nm_guerra\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, insira seu nome de guerra.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"typePasswordX-2\" class=\"form-label\">Senha</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-lock\"></i> <!-- Ícone de cadeado -->\n");
      out.write("                                            <input type=\"password\" placeholder=\"Senha\" id=\"typePasswordX-2\" name=\"senha\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, insira uma senha.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"cd_idade\" class=\"form-label\">Sua Idade</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-birthday-cake\"></i> <!-- Ícone de bolo de aniversário -->\n");
      out.write("                                            <input type=\"number\" id=\"cd_idade\" placeholder=\"Sua Idade\" name=\"cd_idade\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, insira sua idade.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <label for=\"dt_dataNascimento\" class=\"form-label\">Data de Nascimento</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-calendar-alt\"></i> <!-- Ícone de calendário alternativo -->\n");
      out.write("                                            <input type=\"date\" id=\"dt_dataNascimento\" placeholder=\"Data de Nascimento\" name=\"dt_dataNascimento\" class=\"form-control form-control-lg\" required>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, insira sua data de nascimento.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-12\">\n");
      out.write("                                        <label for=\"nm_patente\" class=\"form-label\">Escolha a Patente</label>\n");
      out.write("                                        <div class=\"form-outline mb-4\">\n");
      out.write("                                            <i class=\"fas fa-medal\"></i> <!-- Ícone de medalha -->\n");
      out.write("                                            <select id=\"nm_patente\" aria-label=\"Escolha a Patente\" name=\"nm_patente\" class=\"form-control form-control-lg form-select\" required>\n");
      out.write("                                                <option selected disabled value=\"\">Escolha a patente</option>\n");
      out.write("                                                <option value=\"sentinela\">Sentinela</option>\n");
      out.write("                                                <option value=\"comandante\">Comandante</option>\n");
      out.write("                                            </select>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Por favor, selecione uma patente.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <div class=\"col-12\">\n");
      out.write("                                        <div class=\"form-check\">\n");
      out.write("                                            <input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"invalidCheck\" required>\n");
      out.write("                                            <label class=\"form-check-label\" for=\"invalidCheck\">\n");
      out.write("                                                Concordo com os termos e condições\n");
      out.write("                                            </label>\n");
      out.write("                                            <div class=\"invalid-feedback\">\n");
      out.write("                                                Você deve concordar antes de enviar.\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-12\">\n");
      out.write("                                        <button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\">Registrar</button>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"text-center\">\n");
      out.write("                                        <p>Possui conta? <a href=\"index.jsp\">Logar-se</a></p>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            (() => {\n");
      out.write("                'use strict'\n");
      out.write("\n");
      out.write("                const forms = document.querySelectorAll('.needs-validation')\n");
      out.write("\n");
      out.write("                Array.from(forms).forEach(form => {\n");
      out.write("                    form.addEventListener('submit', event => {\n");
      out.write("                        if (!form.checkValidity()) {\n");
      out.write("                            event.preventDefault()\n");
      out.write("                            event.stopPropagation()\n");
      out.write("                        }\n");
      out.write("\n");
      out.write("                        form.classList.add('was-validated')\n");
      out.write("                    }, false)\n");
      out.write("                })\n");
      out.write("            })()\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
