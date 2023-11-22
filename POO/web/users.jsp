<%-- 
    Document   : Projeto Poo
    Author     : SOLDEIRS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users - Session</title>
        <%@include file="WEB-INF/jspf/html-head-libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%if(userName!=null){%>
        
        <!-- 
        PAGINA INICIAL DE CADASTRO DE USUARIO
        -->
        <div class="m-2">
                <h1>Usuários</h1>
                    <%for(String user: users){%>
                    <div><%= user %></div>
                    <%}%>
                 </div>
        <%}%>
        <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
    </body>
</html>