<%-- 
    Document   : newjsp
    Created on : 23 de nov. de 2023, 18:57:45
    Author     : zCodexs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<!-- Edit Modal -->
                <div class="modal fade" id="editModal<%= rs.getInt("id") %>" tabindex="-1" aria-labelledby="editModalLabel<%= rs.getInt("id") %>" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel<%= rs.getInt("id") %>">Edit Record</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Add form fields here to edit the record -->
                                <form method="post" action="editRecord.jsp">
                                    <!-- You can populate this form with data from the current row -->
                                    <input type="hidden" name="recordId" value="<%= rs.getInt("id") %>">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name:</label>
                                        <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("nome") %>">
                                    </div>
                                    <!-- Add more input fields as needed for editing -->
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description:</label>
                                        <input type="text" class="form-control" id="description" name="description" value="<%= rs.getString("descricao") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price:</label>
                                        <input type="number" class="form-control" id="price" name="price" value="<%= rs.getBigDecimal("preco") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="category" class="form-label">Category:</label>
                                        <input type="text" class="form-control" id="category" name="category" value="<%= rs.getString("categoria") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="origin" class="form-label">Origin:</label>
                                        <input type="text" class="form-control" id="origin" name="origin" value="<%= rs.getString("origem") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="validityDate" class="form-label">Validity Date:</label>
                                        <input type="date" class="form-control" id="validityDate" name="validityDate" value="<%= rs.getDate("data_validade") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="calories" class="form-label">Calories:</label>
                                        <input type="number" class="form-control" id="calories" name="calories" value="<%= rs.getInt("calorias") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="weight" class="form-label">Weight (g):</label>
                                        <input type="number" class="form-control" id="weight" name="weight" value="<%= rs.getInt("peso_gramas") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="manufacturer" class="form-label">Manufacturer:</label>
                                        <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="<%= rs.getString("fabricante") %>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="barcode" class="form-label">Barcode:</label>
                                        <input type="text" class="form-control" id="barcode" name="barcode" disabled="" value="<%= rs.getString("codigo_de_barras") %>">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                                    
                                     <!-- Delete Modal -->
                <!--<div class="modal fade" id="deleteModal<%= rs.getInt("id") %>" tabindex="-1" aria-labelledby="deleteModalLabel<%= rs.getInt("id") %>" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel<%= rs.getInt("id") %>">Confirm Deletion</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to delete this record?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>



                            </div>
                        </div>
                    </div>
                </div>-->
                                     
                                     
                                     
                                     
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
                            <button class="btn btn-success" onclick="registerEntryExit(<%= rs.getInt("id_usuario") %>)">Registrar Entrada/Saída</button>
                        </td>