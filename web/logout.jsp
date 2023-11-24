<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Encerrar a sessão atual (fazer logout)
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <p>Você foi desconectado com sucesso. <a href="index.jsp">Clique aqui</a> para fazer login novamente.</p>
</body>
</html>
