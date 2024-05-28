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
                            <label for="slctBusVi">Bus de Viaje</label>
                            <select name="slctBus" id="slctBusVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                    <option value="1">Bus 1</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="slctChoferVi">Chofer Destinado</label>
                            <select name="slctChofer" id="slctChoferVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Chofer 1</option>
                                <option value="2">Chofer 2</option>
                                <option value="3">Chofer 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="txtFechaSalidaVi">Fecha de Salida</label>
                            <input type="date" name="txtFechaSalida" id="txtFechaSalidaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="txtHoraSalidaVi">Hora de Salida</label>
                            <input type="time" name="txtHoraSalida" id="txtHoraSalidaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="slctOrigenVi">Lugar de Salida</label>
                            <select name="slctOrigen" id="slctOrigenVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Lugar 1</option>
                                <option value="2">Lugar 2</option>
                                <option value="3">Lugar 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="txtFechaLlegadaVi">Fecha de Llegada</label>
                            <input type="date" name="txtFechaLlegada" id="txtFechaLlegadaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="txtHoraLlegadaVi">Hora de Llegada</label>
                            <input type="time" name="txtHoraLlegada" id="txtHoraLlegadaVi" class="form-control">
                        </div>
                        <div class="col">
                            <label for="slctDestinoVi">Lugar de Llegada</label>
                            <select name="slctDestino" id="slctDestinoVi" class="form-select">
                                <option value="">[Seleccione]</option>
                                <option value="1">Lugar 1</option>
                                <option value="2">Lugar 2</option>
                                <option value="3">Lugar 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-6">
                            <label for="txtPrecioVi">Precio</label>
                            <input type="text" name="txtPrecio" id="txtPrecioVi" class="form-control">
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