<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Encerrar a sessão atual (fazer logout)
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <!-- Inclua a biblioteca do SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        // Exibir a mensagem de logout com SweetAlert2
        Swal.fire({
            icon: 'success',
            title: 'Logout realizado com sucesso!',
            showConfirmButton: false,
            timer: 2000
        }).then(function() {
            // Redirecionar para a página de login após a mensagem
            window.location.href = 'index.jsp';
        });
    </script>
</body>
</html>
