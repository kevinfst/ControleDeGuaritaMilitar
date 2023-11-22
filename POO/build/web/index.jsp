<%-- 
    Document   : Projeto Poo
    Author     : SOLDEIRS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Pagina incial</title>
        <%@include file = "WEB-INF/jspf/html-head-libs.jspf" %>
    </head>
    <body>
         <%@include file = "WEB-INF/jspf/navbar.jspf" %>
         
         
         <%if(userName!=null){%>
         <div class="m-2">
          <h2>Página Inicial</h2>
          
          <!-- 
          PARTE ONDE O CONTEUDO DA PAGINA PRINCIPAL É ESCRITO 
          APÓS O "LOGIN" SER FEITO      
          -->
          <div>Conteúdo da Página</div>
         </div>
         <%}%>
         <%@include file = "WEB-INF/jspf/html-body-libs.jspf" %>
    </body>
</html>
