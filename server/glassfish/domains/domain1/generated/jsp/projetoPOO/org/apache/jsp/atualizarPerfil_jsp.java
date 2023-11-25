package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.Date;

public final class atualizarPerfil_jsp extends org.glassfish.wasp.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("\n");

    // Importando a classe de conexão com o banco de dados
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Recuperando os parâmetros do formulário
    String nomeUsuario = request.getParameter("nomeInput");
    String idadeUsuarioStr = request.getParameter("idadeInput");
    String dataNascimentoStr = request.getParameter("nascimentoInput");
    String nomeGuerra = request.getParameter("nomeGuerraInput");
    String nomePatente = request.getParameter("nm_patente");
    String loginUsuario = request.getParameter("loginInput");
    String senhaUsuario = request.getParameter("senhaInput");

    // Verificando se os valores não são nulos antes de converter
    int idadeUsuario = 0;
    if (idadeUsuarioStr != null && !idadeUsuarioStr.isEmpty()) {
        idadeUsuario = Integer.parseInt(idadeUsuarioStr);
    }

    Date dataNascimento = null;
    if (dataNascimentoStr != null && !dataNascimentoStr.isEmpty()) {
        dataNascimento = Date.valueOf(dataNascimentoStr);
    }

    // Atualizando os dados no banco de dados
    try {
        String updateQuery = "UPDATE usuario SET nm_usuario=?, cd_idade=?, dt_dataNascimento=?, nm_guerra=?, nm_patente=?, nm_usuarioLogin=?, cd_senha=? WHERE id_usuario=?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, nomeUsuario);
        pstmt.setInt(2, idadeUsuario);
        pstmt.setDate(3, dataNascimento);
        pstmt.setString(4, nomeGuerra);
        pstmt.setString(5, nomePatente);
        pstmt.setString(6, loginUsuario);
        pstmt.setString(7, senhaUsuario);
        pstmt.setInt(8, Integer.parseInt(request.getParameter("usuarioID"))); // Certifique-se de ter um campo oculto no formulário para armazenar o id_usuario

        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        
        session.invalidate();


        // Redirecionar para a página de perfil após a atualização
        response.sendRedirect("index.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Atualização de Perfil</title>\n");
      out.write("    <!-- Inclua aqui os seus estilos CSS, se necessário -->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h2>Perfil Atualizado com Sucesso!</h2>\n");
      out.write("    <!-- Inclua aqui qualquer conteúdo adicional que você deseja exibir após a atualização do perfil -->\n");
      out.write("</body>\n");
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
