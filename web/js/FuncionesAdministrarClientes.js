$(document).ready(function () {
    $('#datatable-cliente').DataTable({
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
        responsive: true
    });
});

function agregarCliente() {
    if (validarFormCliente()) {
        //Se obtiene el ID del usuario actual mediante JQuery al input hidden con el id "idUsuario" en menu.jsp
        var id = $('#idUsuario').val();
        $.ajax({
            type: 'POST',
            data: $('#frmAddCliente').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
            url: '../RegistrarCliente?accion=agregar&id=' + id,
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
                document.getElementById('frmAddCliente').reset();
                swal.fire('CORRECTO', 'Se agregó el nuevo cliente', 'success').then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            }
        });
    }
}

function eliminarCliente(id) {
    $.ajax({
        type: 'POST',
        url: '../' + id,
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
            swal.fire('CORRECTO', 'Se eliminó el cliente', 'success').then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            });
        }
    });
}

function validarFormCliente() {
    var form = document.getElementById('frmAddCliente');
    if (form.appat.value == "") {
        swal.fire('ERROR', 'El apellido paterno es requerido', 'error');
        return false;
    }
    if (form.apmat.value == "") {
        swal.fire('ERROR', 'El apellido materno es requerido', 'error');
        return false;
    }
    if (form.nombre.value == "") {
        swal.fire('ERROR', 'La nombre es requerida', 'error');
        return false;
    }
    if (form.dni.value == "") {
        swal.fire('ERROR', 'La DNI es requerida', 'error');
        return false;
    }
    if (form.fechaNacimiento.value == "") {
        swal.fire('ERROR', 'La fecha de nacimiento es requerida', 'error');
        return false;
    }
    if (form.telefono.value == "") {
        swal.fire('ERROR', 'El telefono es requerida', 'error');
        return false;
    }
    if (form.genero.value == "") {
        swal.fire('ERROR', 'El genero es requerido', 'error');
        return false;
    }
    return true;
}

