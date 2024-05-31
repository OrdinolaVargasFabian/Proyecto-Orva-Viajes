function obtenerChoferes() {
    $.ajax({
        url: '../ControladorChofer?accion=listar',
        type: 'POST',
        success: function (response) {
            console.log('Exito ObtenerChoferes');

            $('#datatable-chofer').DataTable({
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
                buttons: [],
                responsive: false
            });
        }
    });
}

function agregarChofer() {
    if (validarFormChofer()) {
        //Se obtiene el ID del usuario actual mediante JQuery al input hidden con el id "idUsuario" en menu.jsp
        var id = $('#idUsuario').val();
        $.ajax({
            type: 'POST',
            data: $('#frmAddChofer').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
            url: '../ControladorChofer?accion=agregar&id=' + id,
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
                document.getElementById('frmAddChofer').reset();
                swal.fire('CORRECTO', 'Se agreg&oacute nuevo chofer', 'success').then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            }
        });
    }
}

function eliminarChofer(id) {
    $.ajax({
        type: 'POST',
        url: '../ControladorChofer?accion=eliminar&idChofer=' + id,
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
            swal.fire('CORRECTO', 'Se elimin&oacute el chofer', 'success').then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            });
        }
    });
}

function validarFormChofer() {
    var form = document.getElementById('frmAddChofer');
    if (form.appat.value == "") {
        swal.fire('ERROR', 'El apellido paterno es requerido', 'error');
        return false;
    }
    if (form.apmat.value == "") {
        swal.fire('ERROR', 'El apellido materno es requerido', 'error');
        return false;
    }
    if (form.nombre.value == "") {
        swal.fire('ERROR', 'El nombre es requerido', 'error');
        return false;
    }
    if (form.dni.value == "") {
        swal.fire('ERROR', 'El dni es requerido', 'error');
        return false;
    }
    if (form.licencia.value == "") {
        swal.fire('ERROR', 'La Licencia es requerida', 'error');
        return false;
    }
    if (form.vencLicencia.value == "") {
        swal.fire('ERROR', 'La fecha de vencimiento de licencia es requerido', 'error');
        return false;
    }
    if (form.telefono.value == "") {
        swal.fire('ERROR', 'El número de telefono es requerido', 'error');
        return false;
    }
//    if (form.disponibilidad.value == "") {
//        swal.fire('ERROR', 'La disponibilidad es requerida', 'error');
//        return false;
//    }
//    if (form.estado.value == "") {
//        swal.fire('ERROR', 'El estado es requerido', 'error');
//        return false;
//    }

    return true;
}
