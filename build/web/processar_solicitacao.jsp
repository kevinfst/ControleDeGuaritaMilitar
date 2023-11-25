<%@ page import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        Statement stmt = conn.createStatement();
        
        String idSolicitacao = request.getParameter("id_solicitacao");
        String acao = request.getParameter("acao");
        
        if (acao.equals("aceitar")) {
            // Lógica para aceitar a solicitação
            
            // Atualize o status_solicitacao para "Aceita" na tabela troca_horario
            String updateQuery = "UPDATE troca_horario SET status_solicitacao = 'Aceita' WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(updateQuery);
            
            // Obtenha os detalhes da solicitação
            String selectQuery = "SELECT * FROM troca_horario WHERE id_usuario_solicitante = " + idSolicitacao;
            ResultSet rs = stmt.executeQuery(selectQuery);
            
            if (rs.next()) {
                String idUsuarioSolicitante = rs.getString("id_usuario_solicitante");
                String idUsuarioDestinatario = rs.getString("id_usuario_destinatario");
                
                // Obtenha e troque as datas na tabela escala_guarda
                String updateEscalaQuery = "UPDATE escala_guarda SET id_usuario = CASE WHEN id_usuario = " + idUsuarioSolicitante + " THEN " + idUsuarioDestinatario + " ELSE " + idUsuarioSolicitante + " END WHERE id_usuario IN (" + idUsuarioSolicitante + ", " + idUsuarioDestinatario + ")";
                stmt.executeUpdate(updateEscalaQuery);
                
                // Exclua a entrada da tabela troca_horario após aceitar
                String deleteQuery = "DELETE FROM troca_horario WHERE id_usuario_solicitante = " + idUsuarioSolicitante;
                stmt.executeUpdate(deleteQuery);
            }
            
            rs.close();
        } else if (acao.equals("recusar")) {
            // Lógica para recusar a solicitação
            // Atualize o status_solicitacao para "Recusada" na tabela troca_horario
            String updateQuery = "UPDATE troca_horario SET status_solicitacao = 'Recusada' WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(updateQuery);
            
            // Exclua a entrada da tabela troca_horario após recusar
            String deleteQuery = "DELETE FROM troca_horario WHERE id_usuario_solicitante = " + idSolicitacao;
            stmt.executeUpdate(deleteQuery);
        }
        
        stmt.close();
        conn.close();
        
        // Redirecione de volta para a página anterior ou outra página desejada após o processamento
        response.sendRedirect("painel.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
