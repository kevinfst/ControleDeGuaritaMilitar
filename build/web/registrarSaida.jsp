<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Recupere o ID da escala para o qual deseja registrar a saída
int idEscala = Integer.parseInt(request.getParameter("idEscala"));
Integer idUsuarioLogado = (Integer) session.getAttribute("idUsuario");

try {
    if (idUsuarioLogado != null) {
        int idUsuario = idUsuarioLogado.intValue();

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Verifique se já existe um registro de entrada para esta escala
        String verificaQuery = "SELECT * FROM registro_entrada_saida WHERE id_usuario = ? AND id_registro = ? AND data_hora_entrada IS NOT NULL AND data_hora_saida IS NULL";
        try (PreparedStatement verificaStmt = conn.prepareStatement(verificaQuery)) {
            verificaStmt.setInt(1, idUsuario);
            verificaStmt.setInt(2, idEscala);
            ResultSet verificaRs = verificaStmt.executeQuery();

            if (verificaRs.next()) {
                // Atualize o registro de entrada existente com a data e hora de saída
                String updateQuery = "UPDATE registro_entrada_saida SET data_hora_saida = NOW() WHERE id_usuario = ? AND id_registro = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                    updateStmt.setInt(1, idUsuario);
                    updateStmt.setInt(2, idEscala);
                    updateStmt.executeUpdate();
                    out.println("Saída registrada com sucesso.");

                    // Redirecione para a página anterior
                    response.sendRedirect(request.getHeader("referer"));
                }
            } else {
                // Nenhum registro de entrada encontrado para esta escala
                out.println("Erro: Nenhum registro de entrada encontrado para esta escala.");
            }

            verificaRs.close();
        }

        conn.close();
    } else {
        // O atributo idUsuario não está definido na sessão
        out.println("Erro: Usuário não autenticado.");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
