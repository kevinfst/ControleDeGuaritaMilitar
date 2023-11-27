<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Recupere o ID da escala para a qual deseja registrar a saída
int idEscala = Integer.parseInt(request.getParameter("idEscala"));
Integer idUsuarioLogado = (Integer) session.getAttribute("idUsuario");

try {
    if (idUsuarioLogado != null) {
        int idUsuario = idUsuarioLogado.intValue();

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Verifique se já existe um registro de entrada para esta escala
        String verificaQuery = "SELECT * FROM registro_entrada_saida WHERE id_usuario = ? AND id_registro = ? AND data_hora_entrada IS NOT NULL";
        try (PreparedStatement verificaStmt = conn.prepareStatement(verificaQuery)) {
            verificaStmt.setInt(1, idUsuario);
            verificaStmt.setInt(2, idEscala);
            ResultSet verificaRs = verificaStmt.executeQuery();

            if (verificaRs.next()) {
                // Verifique se a saída já foi registrada
                Timestamp dataHoraSaida = verificaRs.getTimestamp("data_hora_saida");
                if (dataHoraSaida == null) {
                    // Saída ainda não registrada, prossiga com o registro
                    String updateQuery = "UPDATE registro_entrada_saida SET data_hora_saida = NOW() WHERE id_usuario = ? AND id_registro = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                        updateStmt.setInt(1, idUsuario);
                        updateStmt.setInt(2, idEscala);
                        updateStmt.executeUpdate();
                        %>
                        <script>
                            alert("Saída registrada com sucesso.");
                            window.location.href = document.referrer; // Volta para a página anterior
                        </script>
                        <%
                    }
                } else {
                    // Saída já registrada, mostre um alerta informando
                    %>
                    <script>
                        alert("Erro: Já há uma saída registrada para esta escala.");
                        window.location.href = document.referrer; // Volta para a página anterior
                    </script>
                    <%
                }
            } else {
                // Nenhum registro de entrada encontrado para esta escala
                %>
                <script>
                    alert("Erro: Nenhum registro de entrada encontrado para esta escala.");
                    window.location.href = document.referrer; // Volta para a página anterior
                </script>
                <%
            }

            verificaRs.close();
        }

        conn.close();
    } else {
        %>
        <script>
            alert("Erro: Usuário não autenticado.");
            window.location.href = document.referrer; // Volta para a página anterior
        </script>
        <%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
