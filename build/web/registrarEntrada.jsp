<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Recupere o ID da escala para o qual deseja registrar a entrada
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
                // Já existe um registro de entrada para esta escala
                out.println("Você já registrou a entrada para esta escala.");
            } else {
                // Insira o registro de entrada
                String insertQuery = "INSERT INTO registro_entrada_saida (id_usuario, id_registro, data_hora_entrada) VALUES (?, ?, NOW())";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, idUsuario);
                    insertStmt.setInt(2, idEscala);
                    insertStmt.executeUpdate();
                    out.println("Entrada registrada com sucesso.");

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
