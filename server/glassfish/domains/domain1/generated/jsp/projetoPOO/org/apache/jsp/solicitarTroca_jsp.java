package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class solicitarTroca_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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

// Recupere o ID da escala da solicitação
int idEscala = Integer.parseInt(request.getParameter("idEscala"));
Integer idUsuarioLogado = (Integer) session.getAttribute("idUsuario");

try {
    if (idUsuarioLogado != null) {
        int idUsuario = idUsuarioLogado.intValue();

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Verifique se a solicitação já existe
        String verificaQuery = "SELECT * FROM troca_horario WHERE id_usuario_solicitante = ? AND id_usuario_destinatario = ? AND status_solicitacao IS NULL";
        try (PreparedStatement verificaStmt = conn.prepareStatement(verificaQuery)) {
            verificaStmt.setInt(1, idUsuario);
            verificaStmt.setInt(2, idEscala);
            ResultSet verificaRs = verificaStmt.executeQuery();

            if (verificaRs.next()) {
                // A solicitação já existe
                out.println("Você já solicitou a troca para esta escala.");
            } else {
                // Insira a solicitação de troca com status 'pendente'
                String insertQuery = "INSERT INTO troca_horario (id_usuario_solicitante, id_usuario_destinatario, data_solicitacao, status_solicitacao) VALUES (?, ?, NOW(), 'pendente')";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, idUsuario);
                    insertStmt.setInt(2, idEscala);
                    insertStmt.executeUpdate();
                    out.println("Solicitação de troca enviada com sucesso.");

                    // Redirecione para a página anterior
                    response.sendRedirect(request.getHeader("referer"));
                }
            }

            verificaRs.close();
        }

        conn.close();
    } else {
        // O atributo idUsuario não está definido na sessão
        out.println("Erro: Usuário não autenticado.");
    }
} catch (Exception e) {
    e.printStackTrace();
}

      out.write('\n');
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
