package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class painel_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Painel do Usuário</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>.edit-icon {\n");
      out.write("                color: blue;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .delete-icon {\n");
      out.write("                color: red;\n");
      out.write("            }\n");
      out.write("            .icon-button {\n");
      out.write("                cursor: pointer;\n");
      out.write("                transition: color 0.2s;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    ");

         String nomeUsuario = (String) session.getAttribute("nomeUsuario");
         if (nomeUsuario != null) {
    
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Navbar -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("        <!-- Container wrapper -->\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <!-- Toggle button -->\n");
      out.write("            <button\n");
      out.write("                class=\"navbar-toggler\"\n");
      out.write("                type=\"button\"\n");
      out.write("                data-mdb-toggle=\"collapse\"\n");
      out.write("                data-mdb-target=\"#navbarSupportedContent\"\n");
      out.write("                aria-controls=\"navbarSupportedContent\"\n");
      out.write("                aria-expanded=\"false\"\n");
      out.write("                aria-label=\"Toggle navigation\"\n");
      out.write("                >\n");
      out.write("                <i class=\"fas fa-bars\"></i>\n");
      out.write("            </button>\n");
      out.write("\n");
      out.write("            <!-- Collapsible wrapper -->\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                <!-- Navbar brand -->\n");
      out.write("                <a class=\"navbar-brand mt-2 mt-lg-0\" href=\"#\">\n");
      out.write("                    <img\n");
      out.write("                        src=\"https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp\"\n");
      out.write("                        height=\"15\"\n");
      out.write("                        alt=\"MDB Logo\"\n");
      out.write("                        loading=\"lazy\"\n");
      out.write("                        />\n");
      out.write("                </a>\n");
      out.write("                <!-- Left links -->\n");
      out.write("\n");
      out.write("                <!-- Left links -->\n");
      out.write("            </div>\n");
      out.write("            <!-- Collapsible wrapper -->\n");
      out.write("\n");
      out.write("            <!-- Right elements -->\n");
      out.write("            <div class=\"d-flex align-items-center\">\n");
      out.write("                <!-- Icon -->\n");
      out.write("                <a class=\"text-reset me-3\" href=\"#\">\n");
      out.write("                    <i class=\"fas fa-shopping-cart\"></i>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"dropdown\">\n");
      out.write("                    <a>\n");
      out.write("                        <h5 class=\"mt-3\" style=\"color: white;\">Bem-vindo, ");
      out.print( nomeUsuario );
      out.write("!</h5>\n");
      out.write("\n");
      out.write("                    </a>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <br>???<br>\n");
      out.write("                <a href=\"logout.jsp\">Logout</a>\n");
      out.write("            </div>\n");
      out.write("            <!-- Right elements -->\n");
      out.write("        </div>\n");
      out.write("        <!-- Container wrapper -->\n");
      out.write("    </nav>\n");
      out.write("    <!-- Navbar -->\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <h2 class=\"mt-5\">Listagem de Alimentos</h2>\n");
      out.write("            <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#addModal\">\n");
      out.write("                Adicionar novo\n");
      out.write("            </button>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("\n");
      out.write("            <!-- Add Modal -->\n");
      out.write("            <div class=\"modal fade\" id=\"addModal\" tabindex=\"-1\" aria-labelledby=\"addModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h5 class=\"modal-title\" id=\"addModalLabel\">Adicionar Novo Alimento</h5>\n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <!-- Add form fields here to input a new food item -->\n");
      out.write("                            <form method=\"post\" action=\"addRecord.jsp\">\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"nome\" class=\"form-label\">Nome:</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"nome\" name=\"nome\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"descricao\" class=\"form-label\">Descrição:</label>\n");
      out.write("                                    <textarea class=\"form-control\" id=\"descricao\" name=\"descricao\" rows=\"3\"></textarea>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"preco\" class=\"form-label\">Preço:</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"preco\" name=\"preco\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"categoria\" class=\"form-label\">Categoria:</label>\n");
      out.write("                                    <select class=\"form-select\" id=\"categoria\" name=\"categoria\">\n");
      out.write("                                        <option value=\"Frutas\">Frutas</option>\n");
      out.write("                                        <option value=\"Verduras\">Verduras</option>\n");
      out.write("                                        <option value=\"Carnes\">Carnes</option>\n");
      out.write("                                        <option value=\"Pescados e mariscos\">Pescados e mariscos</option>\n");
      out.write("                                        <option value=\"Lácteos\">Lácteos</option>\n");
      out.write("                                        <option value=\"Grãos\">Grãos</option>\n");
      out.write("                                        <option value=\"Legumes\">Legumes</option>\n");
      out.write("                                        <option value=\"Produtos processados\">Produtos processados</option>\n");
      out.write("                                        <option value=\"Doces e sobremesas\">Doces e sobremesas</option>\n");
      out.write("                                        <option value=\"Bebidas\">Bebidas</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"origem\" class=\"form-label\">Origem:</label>\n");
      out.write("                                    <select class=\"form-select\" id=\"origem\" name=\"origem\">\n");
      out.write("                                        <option value=\"Local\">Local</option>\n");
      out.write("                                        <option value=\"Nacional\">Nacional</option>\n");
      out.write("                                        <option value=\"Importado\">Importado</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"data_validade\" class=\"form-label\">Data de Validade:</label>\n");
      out.write("                                    <input type=\"date\" class=\"form-control\" id=\"data_validade\" name=\"data_validade\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"calorias\" class=\"form-label\">Calorias:</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"calorias\" name=\"calorias\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"peso_gramas\" class=\"form-label\">Peso (gramas):</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"peso_gramas\" name=\"peso_gramas\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"fabricante\" class=\"form-label\">Fabricante:</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"fabricante\" name=\"fabricante\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"mb-3\">\n");
      out.write("                                    <label for=\"codigo_de_barras\" class=\"form-label\"  >Código de Barras:</label>\n");
      out.write("                                    <input type=\"text\" placeholder=\"Gerado automaticamente\" class=\"form-control\" disabled=\"\" id=\"codigo_de_barras\" name=\"codigo_de_barras\">\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\">Adicionar</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- Tabela para Escala de Guarda -->\n");
      out.write("            <table id=\"alimentosTable\" class=\"table table-striped\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>ID</th>\n");
      out.write("                        <th>Nome do Soldado</th>\n");
      out.write("                        <th>Patente</th>\n");
      out.write("                        <th>Dia/Hora de Guarda</th>\n");
      out.write("                        <th>Tipo de Escala</th>\n");
      out.write("                        <th>Corte de Cabelo</th>\n");
      out.write("                        <th>Identificação Militar</th>\n");
      out.write("                        <th>Ações</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    ");

                    try {
                        // Código JDBC para obter dados da escala de guarda
                        // Substitua o SQL e a conexão do banco de dados conforme necessário
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                        Statement stmt = conn.createStatement();
                        String query = "SELECT * FROM escala_guarda INNER JOIN usuario ON escala_guarda.id_usuario = usuario.id_usuario";
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( rs.getInt("id") );
      out.write("</td>  \n");
      out.write("                        <td>");
      out.print( rs.getString("nome_soldado") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("patente") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("dia_hora_guarda") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("tipo_escala") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getBoolean("corte_cabelo_conformidade") ? "Conforme" : "Não Conforme" );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getBoolean("identificacao_militar_conformidade") ? "Conforme" : "Não Conforme" );
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <!-- Adicione botões de ação de acordo com os requisitos -->\n");
      out.write("                            <button class=\"btn btn-primary\" onclick=\"requestScheduleChange(");
      out.print( rs.getInt("id") );
      out.write(")\">Solicitar Troca</button>\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            <button class=\"btn btn-success\" onclick=\"registerEntryExit(");
      out.print( rs.getInt("id_usuario") );
      out.write(")\">Registrar Entrada</button>\n");
      out.write("                            ");
      out.write("\n");
      out.write("                            <button class=\"btn btn-danger\" onclick=\"registerEntryExit(");
      out.print( rs.getInt("id_usuario") );
      out.write(")\">Registrar Saída</button>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                        // Feche as conexões e os recursos JDBC
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");

            } else {
            
      out.write("\n");
      out.write("            <p class=\"mt-3\">Você não está autenticado. Por favor, faça login <a href='login.jsp'>aqui</a>.</p>\n");
      out.write("            ");

            }
            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            function deleteRecord(recordId) {\n");
      out.write("                if (confirm(\"Are you sure you want to delete this record?\")) {\n");
      out.write("                    $.ajax({\n");
      out.write("                        type: \"POST\",\n");
      out.write("                        url: \"deleteRecord.jsp\",\n");
      out.write("                        data: {recordId: recordId},\n");
      out.write("                        success: function (data) {\n");
      out.write("                            // Handle the response (e.g., show a success message or refresh the page)\n");
      out.write("                            // You can also use JavaScript to hide the modal after a successful delete.\n");
      out.write("\n");
      out.write("                            location.reload(); // Refresh the page\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\n");
      out.write("        <script src=\"https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('#alimentosTable').DataTable({\n");
      out.write("                    \"language\": {\n");
      out.write("                        \"url\": \"//cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json\"\n");
      out.write("                    },\n");
      out.write("                    \"responsive\": true\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
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
