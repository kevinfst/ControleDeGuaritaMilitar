<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Recupere o ID da escala da solicitação
int idEscala = Integer.parseInt(request.getParameter("idEscala"));
Integer idUsuarioLogado = (Integer) session.getAttribute("idUsuario");

try {
    if (idUsuarioLogado != null) {
        int idUsuario = idUsuarioLogado.intValue();

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Verifique se a solicitação já existe
        String verificaQuery = "SELECT * FROM troca_horario WHERE id_usuario_solicitante = ? AND id_usuario_destinatario = ? AND status_solicitacao IS NULL";
        try (PreparedStatement verificaStmt = conn.prepareStatement(verificaQuery)) {
            verificaStmt.setInt(1, idUsuario);
            verificaStmt.setInt(2, idEscala);
            ResultSet verificaRs = verificaStmt.executeQuery();

            if (verificaRs.next()) {
                // A solicitação já existe
                out.println("Você já solicitou a troca para esta escala.");
            } else {
                // Insira a solicitação de troca com status 'pendente'
                String insertQuery = "INSERT INTO troca_horario (id_usuario_solicitante, id_usuario_destinatario, data_solicitacao, status_solicitacao) VALUES (?, ?, NOW(), 'pendente')";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, idUsuario);
                    insertStmt.setInt(2, idEscala);
                    insertStmt.executeUpdate();
                    out.println("Solicitação de troca enviada com sucesso.");

                    // Redirecione para a página anterior
                    response.sendRedirect(request.getHeader("referer"));
                }
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
