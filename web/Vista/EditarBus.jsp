<%@ include file="menu.jsp" %>
<div class="m-4 p-5 bg-light shadow rounded">
    <h3 class="text-center">EDITAR BUS</h3>
    <hr class="mb-5">
    <form id="frmEditBus" class="row g-3" method="post" action="../ServletBus?accion=actualizar">
        <input type="hidden" name="idBus" value="${detalleBus.getId()}">
        <div class="row mb-3">
            <div class="col-6">
                <label for="placa">Placa</label>
                <input type="text" name="placa" id="placa" class="form-control" value="${detalleBus.getPlaca()}">
            </div>
            <div class="col-6">
                <label for="asientos">Cantidad de Asientos</label>
                <input type="number" name="asientos" id="asientos" class="form-control" value="${detalleBus.getCapacidadAsientos()}">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="descripcion">Descripción</label>
                <textarea name="descripcion" id="descripcion" class="form-control">${detalleBus.getDescripcion()}</textarea>
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