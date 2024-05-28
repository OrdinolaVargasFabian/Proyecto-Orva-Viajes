<div class="mb-3">
    <hr>
    <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='bx bx-plus me-2'></i>Programar</button>
        <button type="button" class="btn btn-primary"><i class='bx bx-refresh me-2'></i>Refrescar</button>
    </div>
    <hr>
    <h3 class="text-center">Filtrar por Fecha</h3>
    <div class="d-flex justify-content-between">
        <div>
            <label for="fechaInicio">Fecha de inicio</label>
            <input type="date" class="form-control" placeholder="Fecha de inicio">
        </div>
        <div>
            <label for="fechaFin">Fecha de fin</label>
            <input type="date" class="form-control" placeholder="Fecha de fin">
        </div>
    </div>

    <%@ include file="../componentes/viaje/modalAgregarViaje.jsp" %>
</div>

<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-viaje" class="table table-striped m-3">
        <thead>
            <tr>
                <td class="text-center">ID</td>
                <td class="text-center">BUS</td>
                <td class="text-center">CHOFER</td>
                <td class="text-center">SALIDA</td>
                <td class="text-center">LLEGADA</td>
                <td class="text-center">ORIGEN</td>
                <td class="text-center">DESTINO</td>
                <td class="text-center">PRECIO</td>
                <td class="text-center">BOLETOS RESTANTES</td>
                <td class="text-center">ACCIONES</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="rutas" items="${listaRutas}">
                <tr>
                    <td class="text-center">${rutas.getId()}</td>
                    <td class="text-center">${rutas.getIdBus()}</td>
                    <td class="text-center">${rutas.getIdChofer()}</td>
                    <td class="text-center">${rutas.getFechaSalida()}  ${rutas.getHoraSalida()}</td>
                    <td class="text-center">${rutas.getFechaLlegada()}  ${rutas.getHoraLlegada()}</td>
                    <td class="text-center">${rutas.getOrigen()}</td>
                    <td class="text-center">${rutas.getDestino()}</td>
                    <td class="text-center">${rutas.getPrecio()}</td>
                    <td class="text-center">${rutas.getBoletosRestantes()}</td>
                    <td class="text-center">
                        <div class="d-inline-block text-nowrap">
                            <a href="../srvControladorViajes?accion=editar&idRuta=${rutas.getId()}" type='button' class='btn btn-icon btn-outline-success  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='bx bxs-edit'></i></a>
                            <a href="../srvControladorViajes?accion=eliminar&idRuta=${rutas.getId()}" type='button' class='btn btn-icon btn-outline-danger  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='tf-icons bx bxs-trash'></i></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>