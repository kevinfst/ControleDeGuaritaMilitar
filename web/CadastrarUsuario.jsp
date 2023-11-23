<%-- 
    Document   : CadastrarUsuario
    Created on : 23 de nov. de 2023, 02:19:42
    Author     : zCodexs
--%>

<%@page import="br.com.DAO.usuarioDAO"%>
<%@page import="br.com.DTO.usuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>teste</h1>
        <%
            try {
                usuarioDTO objUsuarioDTO = new usuarioDTO();
                objUsuarioDTO.setNm_usuario(request.getParameter("nm_usuario"));
                objUsuarioDTO.setCd_idade(Integer.valueOf(request.getParameter("cd_idade")));
                objUsuarioDTO.setDt_dataNascimento(request.getParameter("dt_dataNascimento"));
                objUsuarioDTO.setNm_guerra(request.getParameter("nm_guerra"));
                objUsuarioDTO.setNm_patente(request.getParameter("nm_patente"));
                objUsuarioDTO.setNm_usuarioLogin(request.getParameter("nm_usuarioLogin"));
                objUsuarioDTO.setCd_senha(request.getParameter("cd_senha"));

                usuarioDAO objUsuarioDAO = new usuarioDAO();
                objUsuarioDAO.CadastrarUsuario(objUsuarioDTO);
                out.print(request.getParameter("nm_usuario"));
            } catch (Exception e) {
            
            }

        %>
    </body>
</html>
