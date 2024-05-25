<div class="modal fade" id="mdlAgregarViaje" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <div class="d-flex">
                    <div class="ms-auto">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>

                <div class="text-center mb-4">
                    <h3>Agregar</h3>
                </div>
                <hr style="padding-bottom: 20px;">
                <form id="frmAddViaje" class="row g-3" onsubmit="return false">
                    <div class="row mb-3">
                        <div class="col-6">
                            <label for="bus">Bus de Viaje</label>
                            <select name="bus" id="busVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Bus 1</option>
                                <option value="2">Bus 2</option>
                                <option value="3">Bus 3</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="chofer">Chofer Destinado</label>
                            <select name="chofer" id="choferVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Chofer 1</option>
                                <option value="2">Chofer 2</option>
                                <option value="3">Chofer 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="fechaSalida">Fecha de Salida</label>
                            <input type="date" name="fechaSalida" id="fechaSalidaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="horaSalida">Hora de Salida</label>
                            <input type="time" name="horaSalida" id="horaSalidaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="origen">Lugar de Salida</label>
                            <select name="origen" id="origenVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Lugar 1</option>
                                <option value="2">Lugar 2</option>
                                <option value="3">Lugar 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="fechaLlegada">Fecha de Llegada</label>
                            <input type="date" name="fechaLlegada" id="fechaLlegadaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="horaLlegada">Hora de Llegada</label>
                            <input type="time" name="horaLlegada" id="horaLlegadaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="destino">Lugar de Llegada</label>
                            <select name="destino" id="destinoVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Lugar 1</option>
                                <option value="2">Lugar 2</option>
                                <option value="3">Lugar 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-6">
                            <label for="precio">Precio</label>
                            <input type="text" name="precio" id="precioVi" class="form-control">
                        </div>
                    </div>
                </form>
                <hr style="padding-bottom: 20px;">
                <div class="d-flex">
                    <div class="ms-auto">
                        <a href="#" class="btn btn-primary"><i class='bx bxs-save me-2'></i>Registrar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>