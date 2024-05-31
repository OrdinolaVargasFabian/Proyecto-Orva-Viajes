<%@ include file="menu.jsp" %>
<!-- Actualizar datos -->
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DAO.DAOClientes daoClientes = new DAO.DAOClientes();
    Modelo.DTOCliente cliente = daoClientes.ObtenerCliente(id);
%>

<div class="m-4 p-5 bg-light shadow rounded">
    <h3 class="text-center">EDITAR CLIENTE</h3>
    <hr class="mb-5">
    <form action="../ControladorCliente?accion=actualizar" class="row g-3" method="post">
        <input type="hidden" name="idCliente" value="<%= cliente.getId() %>">
        <div class="mb-3">
            <label for="appat" class="form-label">Apellido Paterno</label>
            <input type="text" class="form-control" id="appat" name="appat" value="<%= cliente.getAppat() %>" required>
        </div>
        <div class="mb-3">
            <label for="apmat" class="form-label">Apellido Materno</label>
            <input type="text" class="form-control" id="apmat" name="apmat" value="<%= cliente.getApmat() %>" required>
        </div>
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" value="<%= cliente.getNombre() %>" required>
        </div>
        <div class="mb-3">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="dni" name="dni" value="<%= cliente.getDni() %>" required>
        </div>
        <div class="mb-3">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" value="<%= cliente.getFechaNacimiento() %>" required>
        </div>
        <div class="mb-3">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono" value="<%= cliente.getTelefono() %>" required>
        </div>
        <div class="mb-3">
            <label for="genero" class="form-label">Género</label>
            <select name="genero" id="genero" class="form-select" required>
                <option value="">[Seleccione]</option>
                <option value="M" <%= "M".equals(cliente.getGenero()) ? "selected" : "" %>>Masculino</option>
                <option value="F" <%= "F".equals(cliente.getGenero()) ? "selected" : "" %>>Femenino</option>
            </select>
        </div>
        <div class="d-flex">
            <div class="ms-auto">
                <button type="submit" class="btn btn-primary"><i class='bx bxs-save me-2'></i>Guardar Cambios</button>
            </div>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>


