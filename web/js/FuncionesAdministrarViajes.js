function obtenerViajes() {
    $.ajax({
        url: '../srvControladorViajes?accion=listar',
        type: 'POST',
        success: function (response) {
            console.log('Exito ObtenerViajes');

            $('#datatable-viaje').DataTable({
                order: [[0, 'desc']],
                dom: '<"row mx-2"' +
                        '<"col-md-2"<"me-3"l>>' +
                        '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0"fB>>' +
                        '>t' +
                        '<"row mx-2"' +
                        '<"col-sm-12 col-md-6"i>' +
                        '<"col-sm-12 col-md-6"p>' +
                        '>',
                language: {
                    sLengthMenu: '_MENU_',
                    search: '',
                    searchPlaceholder: 'Search..'
                },
                buttons: [
                    {
                        extend: 'excel',
                        text: '<i class="bx bxs-file-export me-2"></i>Excel',
                        titleAttr: 'Exportar a Excel',
                        className: 'btn btn-success mx-3 rounded',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]
                        }
                    },
                    {
                        extend: 'pdf',
                        text: '<i class="bx bxs-file-pdf me-2"></i>PDF',
                        titleAttr: 'Exportar a PDF',
                        className: 'btn btn-danger me-3 rounded',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]
                        }
                    },
                    {
                        extend: 'print',
                        text: '<i class="bx bxs-printer me-2"></i>Imprimir',
                        titleAttr: 'Imprimir',
                        className: 'btn btn-info text-white rounded',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]
                        }
                    }
                ],
                responsive: true
            });
        }
    });
}

var formViaje = document.getElementById('frmAddViaje');

function agregarViaje() {
    if (validarFormViajes()) {
        //Se obtiene el ID del usuario actual mediante JQuery al input hidden con el id "idUsuario" en menu.jsp
        var id = $('#idUsuario').val();
        $.ajax({
            type: 'POST',
            data: $('#frmAddViaje').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
            url: '../srvControladorViajes?accion=agregar&id=' + id,
            beforeSend: function () {
                swal.fire({
                    title: 'ESPERA',
                    html: 'Procesando...',
                    didOpen: () => {
                        swal.showLoading()
                    }
                })
            },
            success: function (data, textStatus, jqXHR) {
                document.getElementById('frmAddViaje').reset();
                swal.fire('CORRECTO', 'Se program&oacute la nueva ruta de viaje', 'success').then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            }
        });
    }
}

function eliminarViaje(id) {
    $.ajax({
        type: 'POST',
        data: $('#frmAddViaje').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
        url: '../srvControladorViajes?accion=eliminar&idRuta=' + id,
        beforeSend: function () {
            swal.fire({
                title: 'ESPERA',
                html: 'Procesando...',
                didOpen: () => {
                    swal.showLoading()
                }
            })
        },
        success: function (data, textStatus, jqXHR) {
            swal.fire('CORRECTO', 'Se elimin&oacute la ruta de viaje', 'success').then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            });
        }
    });
}

function validarFormViajes() {
    var form = document.getElementById('frmAddViaje');
    if (form.slctBus.value == "") {
        swal.fire('ERROR', 'El bus de viaje es requerido', 'error');
        return false;
    }
    if (form.slctChofer.value == "") {
        swal.fire('ERROR', 'El chofer de viaje es requerido', 'error');
        return false;
    }
    if (form.txtFechaSalida.value == "") {
        swal.fire('ERROR', 'La fecha de salida es requerida', 'error');
        return false;
    }
    if (form.txtHoraSalida.value == "") {
        swal.fire('ERROR', 'La hora de salida es requerida', 'error');
        return false;
    }
    if (form.slctOrigen.value == "") {
        swal.fire('ERROR', 'El origen de viaje es requerido', 'error');
        return false;
    }
    if (form.txtFechaLlegada.value == "") {
        swal.fire('ERROR', 'La fecha de llegada es requerida', 'error');
        return false;
    }
    if (form.txtHoraLlegada.value == "") {
        swal.fire('ERROR', 'La hora de llegada es requerida', 'error');
        return false;
    }
    if (form.slctDestino.value == "") {
        swal.fire('ERROR', 'El destino de viaje es requerido', 'error');
        return false;
    }
    if (form.txtPrecio.value == "") {
        swal.fire('ERROR', 'El precio de viaje es requerido', 'error');
        return false;
    }
    return true;
}

function listarLugares() {
    $.ajax({
        url: '../srvObtenerLugares',
        type: 'POST',
        success: function (response) {
            console.log('Exito listar lugares');
        }
    });
}
