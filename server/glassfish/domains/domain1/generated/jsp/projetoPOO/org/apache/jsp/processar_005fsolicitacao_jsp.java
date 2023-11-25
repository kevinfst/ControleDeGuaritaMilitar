package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;

public final class processar_005fsolicitacao_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        Statement stmt = conn.createStatement();
        
        String idSolicitacao = request.getParameter("id_solicitacao");
        String acao = request.getParameter("acao");
        
        if (acao.equals("aceitar")) {
            // Lógica para aceitar a solicitação
            
            // Atualize o status_solicitacao para "Aceita" na tabela troca_horario
            String updateQuery = "UPDATE troca_horario SET status_solicitacao = 'Aceita' WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(updateQuery);
            
            // Obtenha os detalhes da solicitação
            String selectQuery = "SELECT * FROM troca_horario WHERE id_usuario_solicitante = " + idSolicitacao;
            ResultSet rs = stmt.executeQuery(selectQuery);
            
            if (rs.next()) {
                String idUsuarioSolicitante = rs.getString("id_usuario_solicitante");
                String idUsuarioDestinatario = rs.getString("id_usuario_destinatario");
                
                // Obtenha e troque as datas na tabela escala_guarda
                String updateEscalaQuery = "UPDATE escala_guarda SET id_usuario = CASE WHEN id_usuario = " + idUsuarioSolicitante + " THEN " + idUsuarioDestinatario + " ELSE " + idUsuarioSolicitante + " END WHERE id_usuario IN (" + idUsuarioSolicitante + ", " + idUsuarioDestinatario + ")";
                stmt.executeUpdate(updateEscalaQuery);
                
                // Exclua a entrada da tabela troca_horario após aceitar
                String deleteQuery = "DELETE FROM troca_horario WHERE id_usuario_solicitante = " + idUsuarioSolicitante;
                stmt.executeUpdate(deleteQuery);
            }
            
            rs.close();
        } else if (acao.equals("recusar")) {
            // Lógica para recusar a solicitação
            // Atualize o status_solicitacao para "Recusada" na tabela troca_horario
            String updateQuery = "UPDATE troca_horario SET status_solicitacao = 'Recusada' WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(updateQuery);
            
            // Exclua a entrada da tabela troca_horario após recusar
            String deleteQuery = "DELETE FROM troca_horario WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(deleteQuery);
        }
        
        stmt.close();
        conn.close();
        
        // Redirecione de volta para a página anterior ou outra página desejada após o processamento
        response.sendRedirect("painel.jsp");
    } catch (Exception e) {
        e.printStackTrace();
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
