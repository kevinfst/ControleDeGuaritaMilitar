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

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
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

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                        <img
                            src="imagens/iconEx.png"
                            height="50"
                            />
                        <span class="fs-4 text-light">CGM</span>
                    </a>
                    <!-- Left links -->

                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center" >
                    <!-- Icon -->








                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle move-left" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                            <img
                                src="imagens/userIcon.png"
                                height="40"
                                />
                            <%= nomeUsuario %>
                        </button>

                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
                            <li>
                                <button type="button" class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#perfilSoldadoModal">
                                    Perfil
                                </button>
                            </li>
                            <li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <button type="button" class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#solicitacoesTrocaModal">
                                Solicitações
                            </button>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="registrarEntrada.jsp" method="post" >                            
                                    <input type="hidden" name="idEscala" value="<%= usuarioID %>">
                                    <button class="dropdown-item btn btn-success rounded" type="submit">Registrar Entrada</button>   
                                </form>  
                            </li>
                            <li>
                                <form action="registrarSaida.jsp" method="post">
                                    <input type="hidden" name="idEscala" value="<%= usuarioID %>">         
                                    <button class="dropdown-item btn btn-danger rounded" type="submit">Registrar Saída</button>
                                </form>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                        </ul>

                    </div>




                </div>
                <!-- Right elements -->
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

                    <form action="atualizarPerfil.jsp" method="post">
                        <!-- Corpo do Modal -->
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="nomeInput"><strong>Nome</strong></label>
                                <input type="text" class="form-control" id="nomeInput" name="nomeInput" value="<%= nomeUsuario%>">
                            </div>
                            <div class="form-group">
                                <label for="idadeInput"><strong>Idade</strong></label>
                                <input type="text" class="form-control" id="idadeInput" name="idadeInput" value="<%= idadeUsuario%>">
                            </div>

                            <div class="form-group">
                                <label for="nascimentoInput"><strong>Data de Nascimento</strong></label>
                                <input type="text" class="form-control" id="nascimentoInput" name="nascimentoInput" value="<%= dataNas%>">
                            </div>
                            <div class="form-group">
                                <label for="nomeGuerraInput"><strong>Nome de Guerra</strong></label>
                                <input type="text" class="form-control" id="nomeGuerraInput" name="nomeGuerraInput" value="<%= nomeGuerra%>">
                            </div>

                            <div class="form-group">
                                <label for="patenteInput"><strong>Patente</strong></label>
                                <select id="nm_patente" aria-label="Escolha a Patente" name="nm_patente" class="form-control form-control-lg form-select" required value="<%= nm_patente%>">
                                    <option selected disabled >Escolha a patente</option>
                                    <option value="Sentinela" <%= "Sentinela".equals(nomePatente) ? "selected" : "" %>>Sentinela</option>
                                    <option value="Comandante" <%= "Comandante".equals(nomePatente) ? "selected" : "" %>>Comandante</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="loginInput"><strong>Login</strong></label>
                                <input type="text" class="form-control" id="loginInput" name="loginInput" value="<%= usLogin%>">
                                <input type="hidden" class="form-control" id="usuarioID" name="usuarioID" value="<%= usuarioID%>">
                            </div>
                            <div class="form-group">
                                <label for="senhaInput"><strong>Senha</strong></label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="senhaInput" name="senhaInput" value="<%= usSenha%>" readonly>
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








        <!-- Novo Modal para Solicitações de Troca -->
        <div class="modal" id="solicitacoesTrocaModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Cabeçalho do Modal -->
                    <div class="modal-header">
                        <h5 class="modal-title">Solicitações de Troca de Horário</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Corpo do Modal -->
                    <div class="modal-body">
                        <!-- Adicione uma tabela para exibir as solicitações de troca -->
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID da Solicitação</th>
                                    <th>Soldado Solicitante</th>
                                    <th>Data da Solicitação</th>
                                    <th>Status</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                                        Statement stmt = conn.createStatement();
                                        String query = "SELECT troca_horario.*, solicitante.nm_usuario AS solicitante_nome, destinatario.nm_usuario AS destinatario_nome " +
               "FROM troca_horario " +
               "INNER JOIN usuario AS solicitante ON troca_horario.id_usuario_solicitante = solicitante.id_usuario " +
               "INNER JOIN usuario AS destinatario ON troca_horario.id_usuario_destinatario = destinatario.id_usuario " +
               "WHERE destinatario.id_usuario = " + usuarioID;
                                        ResultSet rs = stmt.executeQuery(query);
                                        
                            
                                        while (rs.next()) { 
                                            String solicitante = rs.getString("solicitante_nome");
                                            String destinatario = rs.getString("destinatario_nome");
                                            String id_usuario_solicitante = rs.getString("id_usuario_solicitante");
                                            String id_usuario_destinatario = rs.getString("id_usuario_destinatario");
                                            String data_solicitacao = rs.getString("data_solicitacao");
                                            String status_solicitacao = rs.getString("status_solicitacao");
                                %>

                                <tr>
                                    <td><%= id_usuario_solicitante %></td>
                                    <td><%= solicitante %></td>
                                    <td><%= data_solicitacao %></td>
                                    <td><%= status_solicitacao %></td>
                                    <td>
                                        <form action="processar_solicitacao.jsp" method="post">
                                            <input type="hidden" name="id_solicitacao" value="<%= id_usuario_solicitante %>">
                                            <button class="btn btn-success" type="submit" name="acao" value="aceitar">Aceitar</button>
                                            <button class="btn btn-danger" type="submit" name="acao" value="recusar">Recusar</button>
                                        </form>
                                    </td>
                                </tr>

                                <% 
                                        }
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <!-- Adicione linhas conforme necessário com os dados das solicitações -->
                                <!-- Exemplo: -->

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




        <div class="container card text-center mt-5">
            <div class="card-header">
                <h2 class="">Escalas de Guarda</h2>
            </div>
            <div class="card-body">

                <%       
                 if ("Comandante".equals(nomePatente)) { 
                %>
                <!-- Mostra o botão apenas se a patente do parâmetro for "Comandante" -->
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
                                <!-- Add form fields here to input a new food item -->
                                <form method="post" action="addRecord.jsp" class="needs-validation" novalidate>
                                    <% try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                                           Statement stmt = conn.createStatement();
                                           String query = "SELECT * FROM usuario";
                                           ResultSet rs = stmt.executeQuery(query); %>
                                    <div class="mb-3">
                                        <label for="nome_soldado" class="form-label">Nome do Soldado</label>                                       
                                        <select class="form-select" id="nome_soldado" name="id_usuario" required> 
                                            <option selected disabled value="">Escolha o soldado</option>  
                                            <%while (rs.next()) { 
                                             String nm_usuario = rs.getString("nm_usuario");
                                               String id_usuario = rs.getString("id_usuario");%>                                                                                    
                                            <option value="<%= id_usuario %>"><%= nm_usuario %></option>
                                            <% } %>
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
    int loggedInUserId = (int) session.getAttribute("idUsuario");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        Statement stmt = conn.createStatement();
        String query = "SELECT * FROM escala_guarda INNER JOIN usuario ON escala_guarda.id_usuario = usuario.id_usuario LEFT JOIN registro_entrada_saida ON escala_guarda.id_usuario = registro_entrada_saida.id_usuario";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) { 
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
           

            // Aqui você pode inserir os dados existentes na tabela conforme necessário
            // Por exemplo, você pode exibir os valores em HTML ou fazer qualquer outra manipulação necessária
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

                                <form action="solicitarTroca.jsp" method="post">
                                    <input type="hidden" name="idEscala" value="<%= rs.getInt("id_usuario") %>">
                                    <button class="btn btn-primary" type="submit" value="<%= rs.getInt("id_usuario") %>">Solicitar Troca</button>
                                </form>
                                <% } %>
                            </td>
                        </tr>
                        <%} %>
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

                function deleteRecord(recordId) {
                    if (confirm("Are you sure you want to delete this record?")) {
                        $.ajax({
                            type: "POST",
                            url: "deleteRecord.jsp",
                            data: {recordId: recordId},
                            success: function (data) {
                                // Handle the response (e.g., show a success message or refresh the page)
                                // You can also use JavaScript to hide the modal after a successful delete.

                                location.reload(); // Refresh the page
                            }
                        });
                    }
                }
            </script>

            <script>
                // Função para alternar entre texto e senha
                function alternarVisibilidadeSenha() {
                    var senhaInput = document.getElementById("senhaInput");
                    var mostrarSenhaBtn = document.getElementById("mostrarSenhaBtn");

                    if (senhaInput.type === "password") {
                        senhaInput.type = "text";
                        mostrarSenhaBtn.textContent = "Ocultar";
                    } else {
                        senhaInput.type = "password";
                        mostrarSenhaBtn.textContent = "Mostrar";
                    }
                }
                // Adiciona um ouvinte de evento ao botão
                document.getElementById("mostrarSenhaBtn").addEventListener("click", alternarVisibilidadeSenha);
            </script>





            <script>
                (() => {
                    'use strict'

                    const forms = document.querySelectorAll('.needs-validation')

                    Array.from(forms).forEach(form => {
                        form.addEventListener('submit', event => {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }

                            form.classList.add('was-validated')
                        }, false)
                    })
                })()
            </script>




            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
            <script src="https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"></script>      
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

            <script>
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
