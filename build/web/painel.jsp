<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

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
                    <a>
                        <h5 class="mt-3" style="color: white;">Bem-vindo, <%= nomeUsuario %>!</h5>

                    </a>

                </div>
                <br>???<br>
                <a href="logout.jsp">Logout</a>
            </div>
            <!-- Right elements -->
        </div>
        <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->

    <body>
        <div class="container">



            <h2 class="mt-5">Listagem de Alimentos</h2>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
                Adicionar novo
            </button>

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
            <table id="alimentosTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome do Soldado</th>
                        <th>Patente</th>
                        <th>Dia/Hora de Guarda</th>
                        <th>Tipo de Escala</th>
                        <th>Corte de Cabelo</th>
                        <th>Identificação Militar</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try {
                        // Código JDBC para obter dados da escala de guarda
                        // Substitua o SQL e a conexão do banco de dados conforme necessário
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/soldiers?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
                        Statement stmt = conn.createStatement();
                        String query = "SELECT * FROM escala_guarda INNER JOIN usuario ON escala_guarda.id_usuario = usuario.id_usuario";
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>  
                        <td><%= rs.getString("nome_soldado") %></td>
                        <td><%= rs.getString("patente") %></td>
                        <td><%= rs.getString("dia_hora_guarda") %></td>
                        <td><%= rs.getString("tipo_escala") %></td>
                        <td><%= rs.getBoolean("corte_cabelo_conformidade") ? "Conforme" : "Não Conforme" %></td>
                        <td><%= rs.getBoolean("identificacao_militar_conformidade") ? "Conforme" : "Não Conforme" %></td>
                        <td>
                            <!-- Adicione botões de ação de acordo com os requisitos -->
                            <button class="btn btn-primary" onclick="requestScheduleChange(<%= rs.getInt("id") %>)">Solicitar Troca</button>
                            <%-- Adicione mais botões de ação conforme necessário --%>
                            <button class="btn btn-success" onclick="registerEntryExit(<%= rs.getInt("id_usuario") %>)">Registrar Entrada</button>
                            <%-- Adicione mais botões de ação conforme necessário --%>
                            <button class="btn btn-danger" onclick="registerEntryExit(<%= rs.getInt("id_usuario") %>)">Registrar Saída</button>
                        </td>
                    </tr>
                    <%
                        }
                        // Feche as conexões e os recursos JDBC
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
            <p class="mt-3">Você não está autenticado. Por favor, faça login <a href='login.jsp'>aqui</a>.</p>
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


        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"></script>
        <script>
            $(document).ready(function () {
                $('#alimentosTable').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese-Brasil.json"
                    },
                    "responsive": true
                });
            });
        </script>
    </body>
</html>
