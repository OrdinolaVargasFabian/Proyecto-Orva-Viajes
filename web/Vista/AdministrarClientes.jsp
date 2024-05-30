<%@ include file="menu.jsp" %>
<div class="m-3">
    <div class="mb-3">
        <hr>
        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarCliente">
                <i class='bx bx-plus me-2'></i>Registrar
            </button>
            <button type="button" class="btn btn-primary">
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
                <tr>
                    <td class="text-center">1</td>
                    <td class="text-center">Vargas Santos, John</td>
                    <td class="text-center">123456789</td>
                    <td class="text-center">1990-01-01</td>
                    <td class="text-center">963852741</td>
                    <td class="text-center">M</td>
                    <td class="text-center"></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>