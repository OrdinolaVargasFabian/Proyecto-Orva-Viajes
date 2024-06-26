<!-- modalAgregarCliente.jsp -->
<div class="modal fade" id="mdlAgregarCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content p-4">
            <form id="frmAddCliente" class="row g-3" onsubmit="return false">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Registrar Cliente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="appat" class="form-label">Apellido Paterno</label>
                        <input type="text" class="form-control" id="appat" name="appat" required>
                    </div>
                    <div class="mb-3">
                        <label for="apmat" class="form-label">Apellido Materno</label>
                        <input type="text" class="form-control" id="apmat" name="apmat" required>
                    </div>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="dni" class="form-label">DNI</label>
                        <input type="text" class="form-control" id="dni" name="dni" required>
                    </div>
                    <div class="mb-3">
                        <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Tel�fono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">G�nero</label>
                        <select name="genero" id="genero" class="form-select" required>
                            <option value="">[Seleccione]</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button onclick="agregarCliente()" class="btn btn-primary"><i class='bx bxs-save me-2'></i>Registrar</button>
                </div>
            </form>
        </div>
    </div>
</div>
