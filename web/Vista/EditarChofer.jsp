<%@ include file="menu.jsp" %>
<div class="m-4 p-5 bg-light shadow rounded">
    <h3 class="text-center">EDITAR CHOFER</h3>
    <hr class="mb-5">
    <form id="frmEditChofer" class="row g-3" method="post" action="../ControladorChofer?accion=actualizar"">
        <input type="hidden" name="idChofer" value="${detalleChofer.getId()}">
        <div class="row mb-3">
            <div class="col-6">
                <label for="appat">Apellido Paterno</label>
                <input type="text" name="txtAppat" id="appatCh" class="form-control">
            </div>
            <div class="col-6">
                <label for="apmat">Apellido Materno</label>
                <input type="text" name="txtApmat" id="apmatCh" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-6">
                <label for="nombre">Nombre</label>
                <input type="text" name="txtNombre" id="nombreCh" class="form-control">
            </div>
            <div class="col-6">
                <label for="dni">DNI</label>
                <input type="text" name="txtDni" id="dniCh" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-6">
                <label for="licencia">Licencia de Conducir</label>
                <input type="text" name="txtLicencia" id="licenciaCh" class="form-control">
            </div>
            <div class="col-6">
                <label for="vencLicencia">Fecha de Vencimiento de Licencia</label>
                <input type="date" name="txtVencLicencia" id="vencLicenciaCh" class="form-control">
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col-6">
                <label for="telefono">Telefono de Contacto</label>
                <input type="text" name="txtTelefono" id="telefonoCh" class="form-control">
            </div>
            <div class="col-6">
                <label for="disponibilidad">Disponibilidad</label>
                <input type="text" name="txtDisponibilidad" id="disponibilidadCh" class="form-control">
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col-6">
                <label for="estado">Estado</label>
                <input type="text" name="txtEstado" id="estadoCh" class="form-control">
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