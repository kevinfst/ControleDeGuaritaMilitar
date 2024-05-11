<%@ page import="java.sql.*, java.io.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>

<%
    // Supondo que você tenha uma sessão Java chamada session e já tenha o ID do usuário lá
    int usuarioID = (int) session.getAttribute("idUsuario");

    // Supondo que você já obteve o texto da observação do campo HTML, armazenado em uma variável chamada observacaoTexto
    String observacaoTexto = request.getParameter("observacaoInput");

    try {
        // Conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Preparando a declaração SQL para inserção
        String query = "INSERT INTO solicitar_observacao (id_usuario_solicitante, data_solicitacao, status_solicitacao, texto) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);

        // Definindo os valores para a declaração preparada
        pstmt.setInt(1, usuarioID);

        // Obtendo a data e hora atual
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        pstmt.setString(2, formattedDateTime);

        // Definindo o status como "pendente"
        pstmt.setString(3, "pendente");

        // Definindo o texto da observação
        pstmt.setString(4, observacaoTexto);

        // Executando a inserção
        int rowsAffected = pstmt.executeUpdate();

        // Fechando a conexão
        pstmt.close();
        conn.close();

        // Verifica se a inserção foi bem-sucedida
        if (rowsAffected > 0) {
            // Inserção bem-sucedida, redireciona de volta para painel.jsp
            response.sendRedirect("painel.jsp");
        } else {
            // Inserção falhou, exibe uma mensagem de erro para o usuário
            out.println("Erro ao inserir observação. Por favor, tente novamente.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Lidar com exceções (por exemplo, logar o erro, exibir uma mensagem de erro para o usuário, etc.)
        out.println("Erro ao processar a solicitação. Por favor, tente novamente mais tarde.");
    }
%>
