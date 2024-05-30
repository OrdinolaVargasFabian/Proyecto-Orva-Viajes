function obtenerChoferes() {
    $.ajax({
        url: '../ControladorChofer?accion=listar',
        type: 'POST',
        success: function (response) {
            console.log('Exito ObtenerChoferes');

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
                buttons: [],
                responsive: false
            });
        }
    });
}


var formChofer = document.getElementById('frmAddChofer');

function agregarChofer() {
    if (validarFormChofer()) {
        //Se obtiene el ID del usuario actual mediante JQuery al input hidden con el id "idUsuario" en menu.jsp
        var id = $('#idUsario').val();
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
                swal.fire('CORRECTO', 'Se agrego nuevo chofer', 'success').then((result) => {
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
        data: $('#frmAddChofer').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
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
            swal.fire('CORRECTO', 'Se eliminó chofer', 'success').then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            });
        }
    });
}

function validarFormChofer() {
    var form = document.getElementById('frmAddChofer');
    if (form.txtappat.value == "") {
        swal.fire('ERROR', 'El apellido paterno es requerido', 'error');
        return false;
    }
    if (form.txtapmat.value == "") {
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
    if (form.txtDni.value == "") {
        swal.fire('ERROR', 'El origen de viaje es requerido', 'error');
        return false;
    }
    if (form.licencia.value == "") {
        swal.fire('ERROR', 'La Licencia es requerida', 'error');
        return false;
    }
    if (form.contratacion.value == "") {
        swal.fire('ERROR', 'La fecha de contratacion es requerida', 'error');
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
    if (form.disponibilidad.value == "") {
        swal.fire('ERROR', 'La disponibilidad es requerida', 'error');
        return false;
    }
    if (form.estado.value == "") {
        swal.fire('ERROR', 'El estado es requerido', 'error');
        return false;
    }
    
    return true;
}

function listarChoferes() {
    $.ajax({
        url: '../ObtenerChoferes',
        type: 'POST',
        success: function (response) {
            console.log('Exito listar choferes');
        }
    });
}

