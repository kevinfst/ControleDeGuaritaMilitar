<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.io.*, java.util.*, java.sql.Date" %>
 
<%
    // Importando a classe de conexão com o banco de dados
    Connection conn = null;
    try {
        // Carregando o driver JDBC e estabelecendo a conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
    } catch (Exception e) {
        e.printStackTrace();
    }
 
    // Recuperando os parâmetros do formulário
    String nomeUsuario = request.getParameter("nomeInput");
    String idadeUsuarioStr = request.getParameter("idadeInput");
    String dataNascimentoStr = request.getParameter("nascimentoInput");
    String nomeGuerra = request.getParameter("nomeGuerraInput");
    String nomePatente = request.getParameter("nm_patente");
    String loginUsuario = request.getParameter("loginInput");
    String senhaUsuario = request.getParameter("senhaInput");
    int usuarioID = (int) session.getAttribute("idUsuario");
 
    // Verificando se os valores não são nulos antes de converter
    int idadeUsuario = 0;
    if (idadeUsuarioStr != null && !idadeUsuarioStr.isEmpty()) {
        idadeUsuario = Integer.parseInt(idadeUsuarioStr);
    }
 
    Date dataNascimento = null;
    if (dataNascimentoStr != null && !dataNascimentoStr.isEmpty()) {
        dataNascimento = Date.valueOf(dataNascimentoStr);
    }
 
    // Atualizando os dados no banco de dados
    try {
        // Preparando a consulta SQL para atualização do perfil do usuário
        String updateQuery = "UPDATE usuario SET nm_usuario=?, cd_idade=?, dt_dataNascimento=?, nm_guerra=?, nm_patente=?, nm_usuarioLogin=?, cd_senha=md5(?) WHERE id_usuario=?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, nomeUsuario);
        pstmt.setInt(2, idadeUsuario);
        pstmt.setDate(3, dataNascimento);
        pstmt.setString(4, nomeGuerra);
        pstmt.setString(5, nomePatente);
        pstmt.setString(6, loginUsuario);
        pstmt.setString(7, senhaUsuario); // Tratar a senha como uma string
        pstmt.setInt(8, usuarioID); // Certifique-se de ter um campo oculto no formulário para armazenar o id_usuario
 
        // Executando a atualização no banco de dados
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        // Invalidando a sessão para garantir que o usuário faça login novamente com as novas credenciais
        session.invalidate();
 
        // Redirecionar para a página de perfil após a atualização
        response.sendRedirect("index.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<title>Atualização de Perfil</title>
</head>
<body>
<h2>Perfil Atualizado com Sucesso!</h2>
</body>
</html>
