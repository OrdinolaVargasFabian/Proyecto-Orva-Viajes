<%@ include file="menu.jsp" %>
<%@page import="Modelo.DTOChofer"%>
<%@page import="java.util.LinkedList"%>
<div class="m-3">
    <div class="mb-3">
        <hr>
        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarChofer">
                <i class='bx bx-plus me-2'></i>Registrar</button>
            <button type="button" class="btn btn-primary"onclick="window.location.reload();">
                <i class='bx bx-refresh me-2'></i>Refrescar</button>
        </div>

        <%@ include file="../componentes/chofer/modalAgregarChofer.jsp" %>
    </div>

    <div class="card-datatable table-responsive bg-light p-3 rounded shadow">
        <table id="datatable-chofer" class="table table-striped m-3" style="width: 100%;">
            <thead>
                <tr>
                    <td class="text-center">ID</td>
                    <td class="text-center">NOMBRE</td>
                    <td class="text-center">DNI</td>
                    <td class="text-center">LICENCIA</td>
                    <td class="text-center">CONTRATACION</td>
                    <td class="text-center">VENCIMIENTO LICENCIA</td>
                    <td class="text-center">TELEFONO</td>
                    <td class="text-center">DISPONIBILIDAD</td>
                    <td class="text-center">ESTADO</td>
                    <td class="text-center">ACCIONES</td>
                </tr>
            </thead>
            <tbody>
               <%--<c:forEach var="choferes" items="${listaChoferes}">--%>
               <% 
                    DAO.DAOChoferes daoChoferes = new DAO.DAOChoferes();
                    java.util.LinkedList<Modelo.DTOChofer> lista = daoChoferes.ListarChoferes();
                    for(Modelo.DTOChofer choferes : lista) {
                %>
                    <tr>
                        <td class="text-center"><%=choferes.getId()%></td> 
                        <td class="text-center"><%=choferes.getAppat()%> ${choferes.getApmat()}, ${choferes.getNombre()}</td>
                        <td class="text-center"><%=choferes.getDni()%></td>
                        <td class="text-center"><%=choferes.getLicenciaConducir()%></td>
                        <td class="text-center"><%=choferes.getFechaContratacion()%></td>
                        <td class="text-center"><%=choferes.getFechaVencimientoLicencia()%></td>
                        <td class="text-center"><%=choferes.getTelefono()%></td>
                        <td class="text-center"><%= choferes.getDisponibilidad() == 1 ? "Disponible" : "No disponible" %></td>
                        <td class="text-center">
                            <%--<c:if test="${choferes.getEstado() == 1}">
                                <i class='bx bxs-circle text-success'></i>
                            </c:if>
                            <c:if test="${choferes.getEstado() == 2}">
                                <i class='bx bxs-circle text-danger'></i>
                            </c:if> --%>
                            <% if (choferes.getEstado() == 1) { %>
                            <i class='bx bxs-circle text-success'></i>
                            <% } else if (choferes.getEstado() == 2) { %>
                            <i class='bx bxs-circle text-danger'></i>
                            <% } %>
                        </td>
                        <td class="text-center">
                            <div class="d-inline-block text-nowrap">
                                <a href="EditarChofer.jsp?id=<%= choferes.getId() %>" class='btn btn-icon btn-outline-success me-2'><i class='bx bxs-edit'></i></a>
                                <a href="EliminarChofer?id=<%= choferes.getId() %>" class='btn btn-icon btn-outline-danger me-2'><i class='tf-icons bx bxs-trash'></i></a>
                               <%--<a href="../ControladorChofer?accion=editar&idChofer=${choferes.getId()}" class='btn btn-icon btn-outline-success me-2'><i class='bx bxs-edit'></i></a>--%>
                               <%-- 1 <a href="../srvControladorViajes?accion=editar&idChofer=${choferes.getId()}" type='button' class='btn btn-icon btn-outline-success  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='bx bxs-edit'></i></a> --%>
                               <%--<a href="javascript:eliminarChoferes(${choferes.getId()})" type='button' class='btn btn-icon btn-outline-danger me-2'><i class='tf-icons bx bxs-trash'></i></a>--%>
                                <%--<a href="../ControladorChofer?accion=eliminar&idChofer=${choferes.getId()}" class='btn btn-icon btn-outline-danger  me-2'><i class='tf-icons bx bxs-trash'></i></a>--%>
                                <%--1<a href="../ControladorChofer?accion=eliminar&idChofer=${choferes.getId()}" type='button' class='btn btn-icon btn-outline-danger  me-2' data-bs-toggle="modal" data-bs-target="#mdlAgregarChofer"><i class='tf-icons bx bxs-trash'></i></a>--%>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                <%--</c:forEach>--%>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>