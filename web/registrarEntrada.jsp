<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Entrada</title>
    <!-- Incluindo o SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>

<%
// Recupere o ID da escala para a qual deseja registrar a entrada
int idEscala = Integer.parseInt(request.getParameter("idEscala"));
Integer idUsuarioLogado = (Integer) session.getAttribute("idUsuario");

try {
    if (idUsuarioLogado != null) {
        int idUsuario = idUsuarioLogado.intValue();

        // Carregar o driver JDBC e estabelecer a conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Verificar se já existe um registro de entrada para esta escala
        String verificaQuery = "SELECT * FROM registro_entrada_saida WHERE id_usuario = ? AND id_registro = ? AND data_hora_entrada IS NOT NULL AND data_hora_saida IS NULL";
        PreparedStatement verificaStmt = conn.prepareStatement(verificaQuery);
        verificaStmt.setInt(1, idUsuario);
        verificaStmt.setInt(2, idEscala);
        ResultSet verificaRs = verificaStmt.executeQuery();

        if (verificaRs.next()) {
            %>
            <!-- Já existe um registro de entrada para esta escala -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                Swal.fire({
                    title: 'Atenção!',
                    text: 'Você já registrou a entrada para esta escala.',
                    icon: 'warning',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = document.referrer;
                    }
                });
            </script>
            <%
        } else {
            // Verificar se já existe um registro de saída para esta escala
            String verificaSaidaQuery = "SELECT * FROM registro_entrada_saida WHERE id_usuario = ? AND id_registro = ? AND data_hora_saida IS NOT NULL";
            PreparedStatement verificaSaidaStmt = conn.prepareStatement(verificaSaidaQuery);
            verificaSaidaStmt.setInt(1, idUsuario);
            verificaSaidaStmt.setInt(2, idEscala);
            ResultSet verificaSaidaRs = verificaSaidaStmt.executeQuery();

            if (verificaSaidaRs.next()) {
                %>
                <!-- Já existe um registro de saída para esta escala -->
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script>
                    Swal.fire({
                        title: 'Atenção!',
                        text: 'Não é possível registrar uma entrada. Pois já existe um registro de entrada para esta escala.',
                        icon: 'warning',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = document.referrer;
                        }
                    });
                </script>
                <%
            } else {
                // Inserir o registro de entrada
                String insertQuery = "INSERT INTO registro_entrada_saida (id_usuario, id_registro, data_hora_entrada) VALUES (?, ?, NOW())";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setInt(1, idUsuario);
                insertStmt.setInt(2, idEscala);
                insertStmt.executeUpdate();
                %>
                <!-- Entrada registrada com sucesso -->
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script>
                    Swal.fire({
                        title: 'Sucesso!',
                        text: 'Entrada registrada com sucesso.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = document.referrer;
                        }
                    });
                </script>
                <%
            }

            verificaSaidaRs.close();
            verificaSaidaStmt.close();
        }

        verificaRs.close();
        verificaStmt.close();
        conn.close();
    } else {
        // O atributo idUsuario não está definido na sessão
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            Swal.fire({
                title: 'Erro!',
                text: 'Erro: Usuário não autenticado.',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = document.referrer;
                }
            });
        </script>
        <%
    }
} catch (Exception e) {
    // Imprimir rastreamento de pilha em caso de exceção
    e.printStackTrace();
    %>
    <!-- Exibir mensagem de erro -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            title: 'Erro!',
            text: 'Ocorreu um erro: <%= e.getMessage() %>',
            icon: 'error',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.referrer;
            }
        });
    </script>
    <%
}
%>

</body>
</html>
