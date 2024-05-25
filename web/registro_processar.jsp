<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processar Registro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
</head>
<body>
<%
    // Obter parâmetros do formulário
    String nome = request.getParameter("nome");
    int idade = Integer.parseInt(request.getParameter("cd_idade"));
    String dataNascimento = request.getParameter("dt_dataNascimento");
    String nomeGuerra = request.getParameter("nm_guerra");
    String nomePatente = request.getParameter("nm_patente");
    String nomeUsuario = request.getParameter("nm_usuarioLogin");
    String senha = request.getParameter("senha");

    try {
        // Carregar o driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Estabelecer a conexão com o banco de dados
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        
        // Verificar se o nome de usuário já está em uso
        String verificaUsuario = "SELECT * FROM usuario WHERE nm_usuarioLogin=?";
        PreparedStatement ps = conn.prepareStatement(verificaUsuario);
        ps.setString(1, nomeUsuario);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
%>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Erro',
                    text: 'Nome de usuário já está em uso.',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "registro.jsp"; // Redirecionar de volta para registro.jsp
                });
            </script>
<%
        } else {
            // Inserir novo usuário no banco de dados
            String inserirUsuario = "INSERT INTO usuario (nm_usuario,cd_idade,dt_dataNascimento,nm_guerra,nm_patente,nm_usuarioLogin,cd_senha) VALUES (?, ?, ?, ?, ?, ?,md5(?))";
            ps = conn.prepareStatement(inserirUsuario);
            ps.setString(1, nome);
            ps.setInt(2, idade);
            ps.setString(3, dataNascimento);
            ps.setString(4, nomeGuerra);
            ps.setString(5, nomePatente);
            ps.setString(6, nomeUsuario);
            ps.setString(7, senha);

            ps.executeUpdate();
%>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Registro bem-sucedido',
                    text: 'Você será redirecionado para a página de login.',
                    showConfirmButton: false,
                    timer: 1500
                }).then(function() {
                    window.location.href = "index.jsp"; // Redirecionar para a página de login
                });
            </script>
<%
        }
        
        // Fechar recursos
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        // Tratar exceções, se ocorrerem
%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Erro',
            text: '<%= e.getMessage() %>',
            confirmButtonText: 'OK'
        }).then(function() {
            window.location.href = "registro.jsp"; // Redirecionar de volta para registro.jsp em caso de erro
        });
    </script>
<%
    }
%>
</body>
</html>
