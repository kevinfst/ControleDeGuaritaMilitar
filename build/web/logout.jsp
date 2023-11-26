<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Encerrar a sessão atual (fazer logout)
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <meta http-equiv="refresh" content="0;url=index.jsp">
</head>
<body>
    <p>Você foi desconectado com sucesso. Aguarde enquanto você é redirecionado para a página de login.</p>
</body>
</html>
