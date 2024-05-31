<%@ include file="menu.jsp" %>
<!-- Actualizar datos -->
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DAO.DAOChoferes daoChoferes = new DAO.DAOChoferes();
    Modelo.DTOChofer chofer = daoChoferes.ObtenerChofer(id);
%>
<div class="m-4 p-5 bg-light shadow rounded">
    <h3 class="text-center">EDITAR CHOFER</h3>
    <hr class="mb-5">
    <form id="frmEditChofer" class="row g-3" method="post" action="../ControladorChofer?accion=actualizar"">
        <input type="hidden" name="idChofer" value="${detalleChofer.getId()}">
        <div class="row mb-3">
            <div class="col-6">
                <label for="appat">Apellido Paterno</label>
                <input type="text" name="txtAppat" id="appatCh" class="form-control" value="<%= chofer.getAppat()%>" required>
            </div>
            <div class="col-6">
                <label for="apmat">Apellido Materno</label>
                <input type="text" name="txtApmat" id="apmatCh" class="form-control"value="<%= chofer.getApmat()%>" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-6">
                <label for="nombre">Nombre</label>
                <input type="text" name="txtNombre" id="nombreCh" class="form-control"value="<%= chofer.getNombre()%>" required>
            </div>
            <div class="col-6">
                <label for="dni">DNI</label>
                <input type="text" name="txtDni" id="dniCh" class="form-control" value="<%= chofer.getDni()%>" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-6">
                <label for="licencia">Licencia de Conducir</label>
                <input type="text" name="txtLicencia" id="licenciaCh" class="form-control" value="<%= chofer.getLicenciaConducir()%>" required>
            </div>
            <div class="col-6">
                <label for="vencLicencia">Fecha de Vencimiento de Licencia</label>
                <input type="date" name="txtVencLicencia" id="vencLicenciaCh" class="form-control"value="<%= chofer.getFechaVencimientoLicencia()%>" required>
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col-6">
                <label for="telefono">Telefono de Contacto</label>
                <input type="text" name="txtTelefono" id="telefonoCh" class="form-control" value="<%= chofer.getTelefono()%>" required> 
            </div>
            
        </div>
        
        
               
        <div class="d-flex">
            <div class="ms-auto">
                <button type="submit" class="btn btn-primary"><i class='bx bxs-save me-2'></i>Guardar Cambios</button>
            </div>
        </div>
    </form>
</div>
<%@ include file="footer.jsp" %>