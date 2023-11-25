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
        </style>

    </head>
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
                <a class="navbar-brand mt-2 mt-lg-0" href="#">
                    <img
                        src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
                        height="15"
                        alt="MDB Logo"
                        loading="lazy"
                        />
                </a>
                <!-- Left links -->

                <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->

            <!-- Right elements -->
            <div class="d-flex align-items-center">
                <!-- Icon -->
                <a class="text-reset me-3" href="#">
                    <i class="fas fa-shopping-cart"></i>
                </a>







                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

                <!-- Corpo do Modal -->
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nomeInput"><strong>Nome</strong></label>
                        <input type="text" class="form-control" id="nomeInput" value="<%= nomeUsuario%>">
                    </div>
                    <div class="form-group">
                        <label for="idadeInput"><strong>Idade</strong></label>
                        <input type="text" class="form-control" id="idadeInput" value="<%= idadeUsuario%>">
                    </div>

                    <div class="form-group">
                        <label for="nascimentoInput"><strong>Data de Nascimento</strong></label>
                        <input type="text" class="form-control" id="nascimentoInput" value="<%= dataNas%>">
                        
                    </div>
                    <div class="form-group">
                        <label for="nomeGuerraInput"><strong>Nome de Guerra</strong></label>
                        <input type="text" class="form-control" id="nomeGuerraInput" value="<%= nomeGuerra%>">
                    </div>
                    <label for="patenteInput"><strong>Patente</strong></label>
                    <select id="nm_patente" aria-label="Escolha a Patente" name="nm_patente" class="form-control form-control-lg form-select" required>
                        <option selected disabled value="">Escolha a patente</option>
                        <option value="sentinela" <%= "sentinela".equals(nomePatente) ? "selected" : "" %>>Sentinela</option>
                        <option value="comandante" <%= "comandante".equals(nomePatente) ? "selected" : "" %>>Comandante</option>
                    </select>
                    <div class="form-group">
                        <label for="loginInput"><strong>Login</strong></label>
                        <input type="text" class="form-control" id="loginInput" value="<%= usLogin%>">
                    </div>
                    <div class="form-group">
                        <label for="senhaInput"><strong>Senha</strong></label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="senhaInput" value="<%= usSenha%>" readonly>
                            <button class="btn btn-secondary" type="button" id="mostrarSenhaBtn">Mostrar</button>
                        </div>
                    </div>
                    <!-- Adicione mais campos conforme necessário -->
                </div>

                <!-- Rodapé do Modal -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Salvar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>


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
                            <!-- Adicione linhas conforme necessário com os dados das solicitações -->
                            <!-- Exemplo:
                                 <tr>
                                    <td>1</td>
                                    <td>Soldado1</td>
                                    <td>2023-11-24 12:30:00</td>
                                    <td>Pendente</td>
                                    <td>
                                        <button class="btn btn-success">Aceitar</button>
                                        <button class="btn btn-danger">Recusar</button>
                                    </td>
                                 </tr>
                            -->
                        </tbody>
                    </table>
                </div>

                <!-- Rodapé do Modal -->
                <div class="modal-footer">

                    <button class="btn btn-success">Aceitar</button>
                    <button class="btn btn-danger">Recusar</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>







</form>
</div>
</div>
</div>
</div>













<body>
    <div class="container">

        <h2 class="mt-5">Escalas de Guarda</h2>


        <%       
         if ("comandante".equals(nomePatente)) { 
        %>
        <!-- Mostra o botão apenas se a patente do parâmetro for "Comandante" -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
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
                        <h5 class="modal-title" id="addModalLabel">Adicionar Novo Alimento</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Add form fields here to input a new food item -->
                        <form method="post" action="addRecord.jsp">
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome:</label>
                                <input type="text" class="form-control" id="nome" name="nome">
                            </div>
                            <div class="mb-3">
                                <label for="descricao" class="form-label">Descrição:</label>
                                <textarea class="form-control" id="descricao" name="descricao" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="preco" class="form-label">Preço:</label>
                                <input type="text" class="form-control" id="preco" name="preco">
                            </div>
                            <div class="mb-3">
                                <label for="categoria" class="form-label">Categoria:</label>
                                <select class="form-select" id="categoria" name="categoria">
                                    <option value="Frutas">Frutas</option>
                                    <option value="Verduras">Verduras</option>
                                    <option value="Carnes">Carnes</option>
                                    <option value="Pescados e mariscos">Pescados e mariscos</option>
                                    <option value="Lácteos">Lácteos</option>
                                    <option value="Grãos">Grãos</option>
                                    <option value="Legumes">Legumes</option>
                                    <option value="Produtos processados">Produtos processados</option>
                                    <option value="Doces e sobremesas">Doces e sobremesas</option>
                                    <option value="Bebidas">Bebidas</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="origem" class="form-label">Origem:</label>
                                <select class="form-select" id="origem" name="origem">
                                    <option value="Local">Local</option>
                                    <option value="Nacional">Nacional</option>
                                    <option value="Importado">Importado</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="data_validade" class="form-label">Data de Validade:</label>
                                <input type="date" class="form-control" id="data_validade" name="data_validade">
                            </div>
                            <div class="mb-3">
                                <label for="calorias" class="form-label">Calorias:</label>
                                <input type="text" class="form-control" id="calorias" name="calorias">
                            </div>
                            <div class="mb-3">
                                <label for="peso_gramas" class="form-label">Peso (gramas):</label>
                                <input type="text" class="form-control" id="peso_gramas" name="peso_gramas">
                            </div>
                            <div class="mb-3">
                                <label for="fabricante" class="form-label">Fabricante:</label>
                                <input type="text" class="form-control" id="fabricante" name="fabricante">
                            </div>
                            <div class="mb-3">
                                <label for="codigo_de_barras" class="form-label"  >Código de Barras:</label>
                                <input type="text" placeholder="Gerado automaticamente" class="form-control" disabled="" id="codigo_de_barras" name="codigo_de_barras">
                            </div>
                            <button type="submit" class="btn btn-primary">Adicionar</button>
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
                    <th class="text-center">Data / Hora</th>
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
                    String query = "SELECT * FROM escala_guarda INNER JOIN usuario ON escala_guarda.id_usuario = usuario.id_usuario";
                    ResultSet rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int idEscala = rs.getInt("id");
                        String nomeSoldado = rs.getString("nm_usuario");
                        String patente = rs.getString("nm_patente");
                           
String diaHoraGuarda = rs.getString("dia_hora_guarda");

// Supondo que "diaHoraGuarda" seja uma string representando a data e hora
SimpleDateFormat formatoOriginal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat formatoNovo = new SimpleDateFormat("dd/MM/yyyy | HH:mm");

Date data;
    
    data = formatoOriginal.parse(diaHoraGuarda);
    String dataFormatada = formatoNovo.format(data);
   
    

                        String tipoEscala = rs.getString("tipo_escala");
                        boolean corteCabeloConforme = rs.getBoolean("corte_cabelo_conformidade");
                        boolean identificacaoConforme = rs.getBoolean("identificacao_militar_conformidade");
        
                %>
                <tr>
                    <td><%= idEscala %></td>
                    <td><%= nomeSoldado %></td>
                    <td><%= patente %></td>
                    <td><%= dataFormatada %></td>
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
                            <input type="hidden" name="idEscala" value="<%= idEscala %>">
                            <button class="btn btn-primary" type="submit" value="<%= idEscala %>">Solicitar Troca</button>
                        </form>
                        <% } %>



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

            </tbody>
        </table>











        <%
        } else {
        %>
        <p class="mt-3">Você não está autenticado. Por favor, faça login <a href='index.jsp'>aqui</a>.</p>
        <%
        }
        %>



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


    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"></script>      
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
