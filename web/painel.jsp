<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Painel do Usuário</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>.edit-icon {
                color: blue;
            }

            .delete-icon {
                color: red;
            }
            .icon-button {
                cursor: pointer;
                transition: color 0.2s;
            }
            .move-left {
                margin-right: 80px; /* Ajuste conforme necessário */
            }
            .bg-successs{
                background-color:  #0b1c18;
            }

            body {
                background-image: url('imagens/fundo.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed; /* Isso impede que a imagem de fundo role com a página */
            }
            .active>.page-link, .page-link.active {
                background-color:  #198754;
            }
            .form-text {
                color: lightgrey;
            }


            /* Seus estilos existentes aqui */
        </style>

    </head>

    <body>
        <%
     String nomeUsuario = (String) session.getAttribute("nomeUsuario");
     if (nomeUsuario != null) {
     String nomePatente = (String) session.getAttribute("nm_patente");
     int usuarioID = (int) session.getAttribute("idUsuario");
         
 

     // Adicionando as demais informações
     int idadeUsuario = (int) session.getAttribute("cd_idade");
         
     String dataNas = (String) session.getAttribute("dt_dataNascimento");
         
     String nomeGuerra = (String) session.getAttribute("nm_guerra");
         
     String usLogin = (String) session.getAttribute("nm_usuarioLogin");
         
     String usSenha = (String) session.getAttribute("cd_senha");
         
     String nm_patente = (String) session.getAttribute("nm_patente");


        %>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper da barra de navegação -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                        <img
                            src="imagens/iconEx.png"
                            height="50"
                            />
                        <span class="fs-4 text-light">CGM</span>
                    </a>

                </div>
                <!-- Fim do wrapper colapsável -->

                <!-- Elementos à direita da barra de navegação -->
                <div class="d-flex align-items-center">
                    <!-- Ícone -->

                    <!-- Dropdown (menu suspenso) -->
                    <div class="dropdown">
                        <!-- Botão de ativação do dropdown -->
                        <button class="btn btn-success dropdown-toggle move-left" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img
                                src="imagens/userIcon.png"
                                height="40"
                                />
                            <%= nomeUsuario %>
                        </button>

                        <!-- Lista de opções do dropdown -->
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
                            <!-- Opção "Perfil" -->
                            <li>
                                <button type="button" class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#perfilSoldadoModal">
                                    Perfil
                                </button>
                            </li>
                            <!-- Separador -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <!-- Opção "Observação" -->
                            <%
                                if("Comandante".equals(nomePatente) || "Sentinela".equals(nomePatente)) {
               
                            %>   
                            <li>
                                <button type="button" class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#observacaoModal">
                                    Observações
                                </button>
                            </li>
                            <% } %>

                            <!-- Separador -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <!-- Formulário para registrar entrada -->
                            <li>
                                <form action="registrarEntrada.jsp" method="post">
                                    <input type="hidden" name="idEscala" value="<%= usuarioID %>">
                                    <button class="dropdown-item btn btn-success rounded" type="submit">Registrar Entrada</button>
                                </form>
                            </li>
                            <!-- Formulário para registrar saída -->
                            <li>
                                <form action="registrarSaida.jsp" method="post">
                                    <input type="hidden" name="idEscala" value="<%= usuarioID %>">
                                    <button class="dropdown-item btn btn-danger rounded" type="submit">Registrar Saída</button>
                                </form>
                            </li>
                            <!-- Formulário para registrar observação -->
                            <%
   

    try {
        // Conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        // Preparando a declaração SQL para verificar se há um registro para o usuário logado
        String query = "SELECT COUNT(*) FROM solicitar_observacao WHERE id_usuario_solicitante = ? AND status_solicitacao = 'pendente'" ;
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, usuarioID);

        // Executando a consulta
        ResultSet rs = pstmt.executeQuery();

        // Verificando se há um registro para o usuário logado
        boolean registroExistente = false;
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count > 0) {
                registroExistente = true;
            }
        }

        // Fechando as conexões
        rs.close();
        pstmt.close();
        conn.close();

        // Se houver um registro para o usuário logado, exiba o botão para registrar observação
        if (registroExistente == false && "Sentinela".equals(nomePatente)) {
                            %>
                            <li>
                                <button type="button" class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#observacaoRegistrarModal">
                                    Registrar Observação
                                </button>
                            </li>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    // Lidar com exceções (por exemplo, logar o erro, exibir uma mensagem de erro para o usuário, etc.)
                                }
                            %>

                            <!-- Separador -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <!-- Opção "Logout" -->
                            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>

            </div>
            <!-- Elementos à direita -->

        </div>
        <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->

    <!-- O Modal -->
    <div class="modal" id="perfilSoldadoModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Cabeçalho do Modal -->
                <div class="modal-header">
                    <h5 class="modal-title">Meu Perfil</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- Formulário para atualizar o perfil -->
                <form action="atualizarPerfil.jsp" method="post">
                    <!-- Corpo do Modal -->
                    <div class="modal-body">
                        <!-- Campo de entrada para o nome -->
                        <div class="form-group">
                            <label for="nomeInput"><strong>Nome</strong></label>
                            <input type="text" class="form-control" id="nomeInput" name="nomeInput" value="<%= nomeUsuario%>" readonly>
                        </div>
                        <!-- Campo de entrada para a idade -->
                        <div class="form-group">
                            <label for="idadeInput"><strong>Idade</strong></label>
                            <input type="text" class="form-control" id="idadeInput" name="idadeInput" value="<%= idadeUsuario%>" readonly>
                        </div>

                        <!-- Campo de entrada para a data de nascimento -->
                        <div class="form-group">
                            <label for="nascimentoInput"><strong>Data de Nascimento</strong></label>
                            <input type="text" class="form-control" id="nascimentoInput" name="nascimentoInput" value="<%= dataNas%>" readonly>
                        </div>
                        <!-- Campo de entrada para o nome de guerra -->
                        <div class="form-group">
                            <label for="nomeGuerraInput"><strong>Nome de Guerra</strong></label>
                            <input type="text" class="form-control" id="nomeGuerraInput" name="nomeGuerraInput" value="<%= nomeGuerra%>" readonly>
                        </div>

                        <!-- Campo de seleção para a patente -->
                        <div class="form-group">
                            <label for="patenteInput"><strong>Patente</strong></label>
                            <select id="nm_patente" aria-label="Escolha a Patente" name="nm_patente" class="form-control form-control-lg form-select" required value="<%= nm_patente%>">
                                <option selected disabled>Escolha a patente</option>
                                <option value="Sentinela" <%= "Sentinela".equals(nomePatente) ? "selected" : "" %>>Sentinela</option>
                                <option value="Comandante" <%= "Comandante".equals(nomePatente) ? "selected" : "" %>>Comandante</option>
                                <option value="Cabo" <%= "Cabo".equals(nomePatente) ? "selected" : "" %>>Cabo</option>
                            </select>
                        </div>

                        <!-- Campo de entrada para o login -->
                        <div class="form-group">
                            <label for="loginInput"><strong>Login</strong></label>
                            <input type="text" class="form-control" id="loginInput" name="loginInput" value="<%= usLogin%>" readonly>
                            <!-- Adicionado readonly para tornar somente leitura -->
                        </div>
                        <!-- Campo de entrada para a senha -->
                        <div class="form-group">
                            <label for="senhaInput"><strong>Senha</strong></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="senhaInput" name="senhaInput" value="<%= usSenha%>" required>
                                <button class="btn btn-secondary" type="button" id="mostrarSenhaBtn">Mostrar</button>
                            </div>
                        </div>                                              
                    </div>

                    <!-- Rodapé do Modal -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary">Salvar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Novo Modal para Relatório de Observações -->
    <div class="modal" id="observacaoModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Cabeçalho do Modal -->
                <div class="modal-header">
                    <h5 class="modal-title">Solicitações de Observações</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- Corpo do Modal -->
                <div class="modal-body">
                    <!-- Tabela para exibir as solicitações de troca -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome do Soldado</th>
                                <th>Observação</th>
                                <th>Data da Observação</th>
                                <th>Status</th>
                                    <% if("Comandante".equals(nomePatente)){ %>
                                <th>Ações</th>
                                    <% } %>
                            </tr>
                        </thead>
                        <tbody>
                            <%
 try {
     // Conexão com o banco de dados
     Class.forName("com.mysql.cj.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
     Statement stmt = conn.createStatement();

     // Consulta SQL para obter as solicitações de observação do usuário logado ou todas as solicitações, dependendo do tipo de usuário
     String query;
     if ("Comandante".equals(nomePatente)) {
         query = "SELECT so.*, u.nm_usuario FROM solicitar_observacao so INNER JOIN usuario u ON so.id_usuario_solicitante = u.id_usuario";
     } else {
         query = "SELECT so.*, u.nm_usuario FROM solicitar_observacao so INNER JOIN usuario u ON so.id_usuario_solicitante = u.id_usuario WHERE so.id_usuario_solicitante = ?";
     }
     
     // Preparando a consulta SQL
     PreparedStatement pstmt = conn.prepareStatement(query);
     if (!"Comandante".equals(nomePatente)) {
         pstmt.setInt(1, usuarioID); // Substitua idUsuarioLogado pelo ID do usuário logado
     }

     ResultSet rs = pstmt.executeQuery();

     // Iteração sobre os resultados da consulta
     while (rs.next()) { 
         String id_usuario_solicitante = rs.getString("id_usuario_solicitante");
         String nm_usuario = rs.getString("nm_usuario");
         String data_solicitacao = rs.getString("data_solicitacao");
         String status_solicitacao = rs.getString("status_solicitacao");
         String observacao = rs.getString("texto");
                            %>

                            <tr>
                                <!-- Exibindo informações de cada solicitação na tabela -->
                                <td><%= id_usuario_solicitante %></td>
                                <td><%= nm_usuario %></td>
                                <td><%= observacao %></td>
                                <td><%= data_solicitacao %></td>
                                <td><%= status_solicitacao %></td>

                                <% if("Comandante".equals(nomePatente) && "pendente".equals(status_solicitacao)){ %>
                                <td>
                                    <!-- Formulário para processar a solicitação -->
                                    <form action="processar_solicitacao.jsp" method="post">
                                        <input type="hidden" name="id_solicitacao" value="<%= id_usuario_solicitante %>">
                                        <!-- Botões para aceitar ou recusar a solicitação -->
                                        <button class="btn btn-success" type="submit" name="acao" value="aceitar">Aceitar</button>
                                        <br><!-- Quebra de linha aqui -->
                                        <button class="btn btn-danger" type="submit" name="acao" value="recusar">Recusar</button>
                                    </form>
                                </td>
                                <% } %>
                            </tr>

                            <%
                                }
                                // Fechando recursos
                                rs.close();
                                pstmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            %>

                        </tbody>
                    </table>
                </div>

                <!-- Rodapé do Modal -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>                        



    <!-- O Modal -->
    <div class="modal" id="observacaoRegistrarModal">
        <div class="modal-dialog">
            <form class="modal-content" action="criar_observacao.jsp" method="post">


                <!-- Cabeçalho do Modal -->
                <div class="modal-header">
                    <h5 class="modal-title">Observação</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- Corpo do Modal -->
                <div class="modal-body">
                    <!-- Campo de entrada para a observação -->
                    <div class="form-group">
                        <label for="observacaoInput"><strong>Digite...</strong></label>
                        <textarea class="form-control" id="observacaoInput" name="observacaoInput" rows="4" ></textarea>
                    </div>
                </div>

                <!-- Rodapé do Modal -->
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">Registrar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>   
                </div>
            </form>
        </div>
    </div>


    <!-- Container principal para as escalas de guarda -->
    <div class="container card text-center mt-5">
        <div class="card-header">
            <h2 class="">Escalas de Guarda</h2>
        </div>
        <div class="card-body">

            <%       
             if ("Cabo".equals(nomePatente)) { 
            %>
            <!-- Mostra o botão apenas se a patente do parâmetro for "Cabo" -->
            <button type="button" class="btn bg-success btn-lg btn-block text-light" data-bs-toggle="modal" data-bs-target="#addModal">
                Adicionar novo
            </button>
            <% } %>
            <br>
            <br>

            <!-- Add Modal -->

            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addModalLabel">Adicionar Nova Escala</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Formulário para adicionar nova escala -->
                            <form method="post" action="addRecord.jsp" class="needs-validation" novalidate>
                                <% try {
                                // Conexão com o banco de dados
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                                       Statement stmt = conn.createStatement();
                                       String query = "SELECT * FROM usuario";
                                       ResultSet rs = stmt.executeQuery(query); %>
                                <div class="mb-3">
                                    <label for="nome_soldado" class="form-label">Nome do Soldado</label>                                       
                                    <select class="form-select" id="nome_soldado" name="id_usuario" required> 
                                        <option selected disabled value="">Escolha o soldado</option>  
                                        <% while (rs.next()) { 
                                            String nm_usuario = rs.getString("nm_usuario");
                                            String id_usuario = rs.getString("id_usuario");
                                            String patente_usuario = rs.getString("nm_patente");
                                            if (!"Cabo".equals(patente_usuario)) {%>
                                        <option value="<%= id_usuario %>"><%= nm_usuario %></option>
                                        <% }} %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="tipo_escala" class="form-label">Tipo de Escala</label>
                                    <select class="form-select" id="tipo_escala" name="tipo_escala" required>  
                                        <option selected disabled value="">Escolha a escala</option>
                                        <option value="Cinza">Cinza</option>
                                        <option value="Vermelha">Vermelha</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="corte_cabelo_conformidade" class="form-label">Corte de Cabelo</label>
                                    <select class="form-select" id="corte_cabelo_conformidade" name="corte_cabelo_conformidade" required>  
                                        <option selected disabled value="">Escolha a conformidade</option>
                                        <option value="1">Conforme</option>
                                        <option value="0">Não Conforme</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="identificacao_militar_conformidade" class="form-label">Identificação Militar</label>
                                    <select class="form-select" id="identificacao_militar_conformidade" name="identificacao_militar_conformidade" required>  
                                        <option selected disabled value="">Escolha a conformidade</option>
                                        <option value="1">Conforme</option>
                                        <option value="0">Não Conforme</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Adicionar</button>
                                <%
                                            rs.close();
                                            stmt.close();
                                            conn.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                %>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Tabela para Escala de Guarda -->
            <table id="soldadoTable" class="table table-striped text-center">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Nome do Soldado</th>
                        <th class="text-center">Patente</th>
                        <th class="text-center">Entrada</th> 
                        <th class="text-center">Saída</th> 
                        <th class="text-center">Tipo de Escala</th>
                        <th class="text-center">Corte de Cabelo</th>
                        <th class="text-center">Identificação Militar</th>
                        <th class="text-center">Ações</th>                 
                    </tr>
                </thead>
                <tbody>
                    <%
                    // Obtém o ID do usuário logado
                    int loggedInUserId = (int) session.getAttribute("idUsuario");
                    try {
                        // Conecta-se ao banco de dados
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                        Statement stmt = conn.createStatement();
                        // Consulta para obter dados da escala de guarda, usuários e registros de entrada/saída
                        String query = "SELECT * FROM escala_guarda INNER JOIN usuario ON escala_guarda.id_usuario = usuario.id_usuario LEFT JOIN registro_entrada_saida ON escala_guarda.id_usuario = registro_entrada_saida.id_usuario";
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) { 
                            // Extrai dados da consulta
                            int idEscala = rs.getInt("id");
                            String nomeSoldado = rs.getString("nm_usuario");
                            String patente = rs.getString("nm_patente");     
                            String diaHoraEntrada = rs.getString("data_hora_entrada");
                            String diaHoraSaida = rs.getString("data_hora_saida");
                            String tipoEscala = rs.getString("tipo_escala");
                            boolean corteCabeloConforme = rs.getBoolean("corte_cabelo_conformidade");
                            boolean identificacaoConforme = rs.getBoolean("identificacao_militar_conformidade");

                            // Verifica se diaHoraEntrada e diaHoraSaida são nulos e exibe "Não registrado" se for o caso
                            diaHoraEntrada = (diaHoraEntrada != null) ? diaHoraEntrada : "Não registrado";
                            diaHoraSaida = (diaHoraSaida != null) ? diaHoraSaida : "Não registrado";
                    %>

                    <tr>
                        <td><%= idEscala %></td>
                        <td><%= nomeSoldado %></td>
                        <td><%= patente %></td>
                        <td><%= diaHoraEntrada %></td>
                        <td><%= diaHoraSaida %></td>
                        <% if (tipoEscala.equals("Vermelha")) { %>
                        <td class="text-danger"><%= tipoEscala %></td>
                        <% } else  { %>
                        <td class="text-body-secondary"><%= tipoEscala %></td>
                        <% } %>
                        <td><%= corteCabeloConforme ? "Conforme" : "Não Conforme" %></td>
                        <td><%= identificacaoConforme ? "Conforme" : "Não Conforme" %></td>
                        <td>
                            <% if (loggedInUserId != rs.getInt("id_usuario")) { %>


                            <%-- Verifica se a patente é igual a "Cabo" antes de exibir o botão "Remover" --%>
                            <% if ("Cabo".equals(nomePatente)) { %>
                            <!-- Formulário para remover registro -->
                            <form action="deleteRecord.jsp" method="post">
                                <input type="hidden" name="idEscala" value="<%= rs.getInt("id_usuario") %>">
                                <button class="btn btn-danger" type="submit" value="<%= rs.getInt("id_usuario") %>">Remover</button>
                            </form>
                            <% } %>
                            <% } %>
                        </td>
                    </tr>

                    <% } %>
                    <%
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </tbody>
            </table>

            <%
            } else {
            %>
            <p class="mt-3" style="color: white;">Você não está autenticado. Por favor, faça login <a href='index.jsp'>aqui</a>.</p>
            <%
            }
            %>

            <div class="card-footer text-body-secondary">
            </div>
        </div>





        <script>
            // Função para confirmar exclusão de registro
            function deleteRecord(recordId) {
                if (confirm("Tem certeza de que deseja excluir este registro?")) {
                    $.ajax({
                        type: "POST",
                        url: "deleteRecord.jsp",
                        data: {recordId: recordId},
                        success: function (data) {
                            // Trate a resposta (por exemplo, mostre uma mensagem de sucesso ou atualize a página)
                            // Você também pode usar JavaScript para ocultar o modal após uma exclusão bem-sucedida.
                            location.reload(); // Atualiza a página
                        }
                    });
                }
            }
        </script>

        <script>
            // Função para alternar entre texto e senha
            function togglePasswordVisibility() {
                var passwordInput = document.getElementById("senhaInput");
                var showPasswordBtn = document.getElementById("mostrarSenhaBtn");

                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    showPasswordBtn.textContent = "Ocultar";
                } else {
                    passwordInput.type = "password";
                    showPasswordBtn.textContent = "Mostrar";
                }
            }

            // Adiciona um ouvinte de evento ao botão
            document.getElementById("mostrarSenhaBtn").addEventListener("click", togglePasswordVisibility);
        </script>

        <script>
            (() => {
                'use strict';

                const forms = document.querySelectorAll('.needs-validation');

                Array.from(forms).forEach(form => {
                    form.addEventListener('submit', event => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }

                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>

        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <script>
            // Inicializa o DataTable
            $(document).ready(function () {
                $('#soldadoTable').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"
                    },
                    "responsive": true
                });
            });
        </script>
</body>
</html>

