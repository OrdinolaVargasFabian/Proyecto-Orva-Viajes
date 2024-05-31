<%@ include file="menu.jsp" %>
<div class="m-3">
    <div class="mb-3">
        <hr>
        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarBus"><i class='bx bx-plus me-2'></i>Registrar</button>
            <button type="button" class="btn btn-primary"><i class='bx bx-refresh me-2'></i>Refrescar</button>
        </div>

        <%@ include file="../componentes/bus/modalAgregarBus.jsp" %>
    </div>

    <div class="card-datatable table-responsive bg-light p-3 rounded shadow">
        <table id="datatable-bus" class="table table-striped m-3">
            <thead>
                <tr>
                    <td class="text-center">ID</td>
                    <td class="text-center">PLACA</td>
                    <td class="text-center">ASIENTOS</td>
                    <td class="text-center">DESCRIPCION</td>
                    <td class="text-center">ESTADO</td>
                    <td class="text-center">ACCIONES</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bus" items="${listaBuses}">
                    <tr>
                        <td class="text-center">${bus.getId()}</td>
                        <td class="text-center">${bus.getPlaca()}</td>
                        <td class="text-center">${bus.getCapacidadAsientos()}</td>
                        <td class="text-center">${bus.getDescripcion()}</td>
                        <td class="text-center">
                            <c:choose>
                                <c:when test="${bus.estado == 1}">
                                    Activo
                                </c:when>
                                <c:when test="${bus.estado == 2}">
                                    Inactivo
                                </c:when>
                            </c:choose>
                    </td>
                        <td class="text-center">
                            <div class="d-inline-block text-nowrap">
                                <a href="../ServletBus?accion=editar&idBus=${bus.getId()}" class='btn btn-icon btn-outline-success me-2'><i class='bx bxs-edit'></i></a>
                                <a href="javascript:eliminarBus(${bus.getId()})" type='button' class='btn btn-icon btn-outline-danger me-2'><i class='tf-icons bx bxs-trash'></i></a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>