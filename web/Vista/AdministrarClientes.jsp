<%@ include file="menu.jsp" %>
<div class="m-3">
    <div class="mb-3">
        <hr>
        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarCliente">
                <i class='bx bx-plus me-2'></i>Registrar
            </button>
            <button type="button" class="btn btn-primary" onclick="window.location.reload();">
                <i class='bx bx-refresh me-2'></i>Refrescar
            </button>
        </div>

        <%@ include file="../componentes/cliente/modalAgregarCliente.jsp" %>
    </div>

    <div class="card-datatable table-responsive bg-light p-3 rounded shadow">
        <table id="datatable-cliente" class="table table-striped m-3" style="width: 100%;">
            <thead>
                <tr>
                    <td class="text-center">ID</td>
                    <td class="text-center">NOMBRE</td>
                    <td class="text-center">DNI</td>
                    <td class="text-center">FECHA DE NACIMIENTO</td>
                    <td class="text-center">TELEFONO</td>
                    <td class="text-center">GENERO</td>
                    <td class="text-center">ACCIONES</td>
                </tr>
            </thead>
            <tbody>
                <% 
                    DAO.DAOClientes daoClientes = new DAO.DAOClientes();
                    java.util.LinkedList<Modelo.DTOCliente> lista = daoClientes.ListarClientes();
                    for(Modelo.DTOCliente cliente : lista) {
                %>
                <tr>
                    <td class="text-center"><%= cliente.getId() %></td>
                    <td class="text-center"><%= cliente.getAppat() %> <%= cliente.getApmat() %>, <%= cliente.getNombre() %></td>
                    <td class="text-center"><%= cliente.getDni() %></td>
                    <td class="text-center"><%= cliente.getFechaNacimiento() %></td>
                    <td class="text-center"><%= cliente.getTelefono() %></td>
                    <td class="text-center"><%= cliente.getGenero() %></td>
                    <td class="text-center">
                        <!-- Agregar acciones como editar y eliminar -->
                        <a href="EditarCliente.jsp?id=<%= cliente.getId() %>" class='btn btn-icon btn-outline-success me-2'><i class='bx bxs-edit'></i></a>
                        <a href="EliminarCliente?id=<%= cliente.getId() %>" class='btn btn-icon btn-outline-danger me-2'><i class='tf-icons bx bxs-trash'></i></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>
