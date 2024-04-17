<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import= "java.math.BigInteger"%>
<%@ page import= "java.security.MessageDigest"%>
<%@ page import= "java.security.NoSuchAlgorithmException"%>



<%
    // Obtendo parâmetros do formulário de login
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    try {
        // Estabelecendo a conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        Statement stmt = conn.createStatement();
        
        // Verificando as credenciais do usuário no banco de dados
        String verificarUsuario = "SELECT * FROM usuario WHERE nm_usuarioLogin=? AND cd_senha=md5(?)";
        PreparedStatement ps = conn.prepareStatement(verificarUsuario);
        ps.setString(1, email);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            // Login bem-sucedido, configurando variáveis de sessão e redirecionando para o painel
            String nomeUsuario = rs.getString("nm_usuario");
            int idUsuario = rs.getInt("id_usuario"); // Supondo que o ID do usuário seja um inteiro
            String nomePatente = rs.getString("nm_patente"); 
            session.setAttribute("nm_patente", nomePatente);
            session.setAttribute("nomeUsuario", nomeUsuario);
            session.setAttribute("idUsuario", idUsuario);
            
            // Adicionando outras informações à sessão
            int idadeUsuario = rs.getInt("cd_idade");
            session.setAttribute("cd_idade", idadeUsuario);
            
            String dataNas = rs.getString("dt_dataNascimento");
            session.setAttribute("dt_dataNascimento", dataNas);
            
            String nomeGuerra = rs.getString("nm_guerra");
            session.setAttribute("nm_guerra", nomeGuerra);
            
            String usLogin = rs.getString("nm_usuarioLogin");
            session.setAttribute("nm_usuarioLogin", usLogin);
            

            
            
         session.setAttribute("cd_senha", senha);
            
            String nm_patente = rs.getString("nm_patente");
            session.setAttribute("nm_patente", nm_patente);
            
            response.sendRedirect("painel.jsp");
        } else {
            // Falha no login. Exibindo mensagem e link para tentar novamente
            out.println("Login falhou. Verifique suas credenciais. <a href='index.jsp'>Tentar novamente</a>");
        }
        
        // Fechando recursos
        ps.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        // Exibindo mensagem de erro
        out.println("Erro: " + e.getMessage());
    }
%>
