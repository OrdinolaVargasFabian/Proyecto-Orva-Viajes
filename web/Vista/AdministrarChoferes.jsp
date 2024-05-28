<%@page import="Modelo.DTOChofer"%>
<%@page import="java.util.LinkedList"%>
<div class="mb-3">
    <hr>
    <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarChofer"><i class='bx bx-plus me-2'></i>Registrar</button>
        <button type="button" class="btn btn-primary"><i class='bx bx-refresh me-2'></i>Refrescar</button>
    </div>
    
    <%@ include file="../componentes/chofer/modalAgregarChofer.jsp" %>
</div>

<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-chofer" class="table table-striped m-3">
        <thead>
            <tr>
                <td class="text-center">ID</td>
                <td class="text-center">NOMBRE</td>
                <td class="text-center">DNI</td>
                <td class="text-center">LICENCIA</td>
                <td class="text-center">CONTRATACION</td>
                <td class="text-center">VENCIMIENTO</td>
                <td class="text-center">TELEFONO</td>
                <td class="text-center">DISPONIBILIDAD</td>
                <td class="text-center">ESTADO</td>
                <td class="text-center">ACCIONES</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="choferes" items="${listaChoferes}">
                <tr>
                    <td class="text-center">${choferes.getId()}</td> 
                    <td class="text-center">${choferes.getNombre()}</td>
                    <td class="text-center">${choferes.getDni()}</td>
                    <td class="text-center">${choferes.getLicenciaConducir()}</td>
                    <td class="text-center">${choferes.getFechaContratacion()}</td>
                    <td class="text-center">${choferes.getFechaVencimientoLicencia()}</td>
                    <td class="text-center">${choferes.getTelefono()}</td>
                    <td class="text-center">${choferes.getDisponibilidad()}</td>
                    <td class="text-center">${choferes.getEstado()}</td>
                    <td class="text-center">
                        <div class="d-inline-block text-nowrap">
                            <a href="../srvControladorViajes?accion=editar&idChofer=${choferes.getId()}" type='button' class='btn btn-icon btn-outline-success  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='bx bxs-edit'></i></a>
                            <a href="../srvControladorViajes?accion=eliminar&idChofer=${choferes.getId()}" type='button' class='btn btn-icon btn-outline-danger  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='tf-icons bx bxs-trash'></i></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>