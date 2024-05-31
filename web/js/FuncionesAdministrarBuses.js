function obtenerBuses() {
    $.ajax({
        url: '../ServletBus?accion=listar',
        type: 'POST',
        success: function (response) {
            console.log('Exito obtener buses');
            
            $('#datatable-bus').DataTable({
                order: [[0, 'desc']],
                dom:
                        '<"row mx-2"' +
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

    let formBus = document.getElementById('formAgregarBus');
    
    function agregarBus() {
        if (validarFormBus()) {
            //obtener id del usuario actual
            let id = $('#idUsuario').val();
            $.ajax({
                type: 'POST',
                data: $('#formAgregarBus').serialize(),
                url: '../ServletBus?accion=agregar&id=' + id,
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
                    document.getElementById('formAgregarBus').reset();
                    swal.fire('CORRECTO', 'Bus agregado!', 'success').then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                }
            });
        }
    }
    
    function validarFormBus() {
        let form = document.getElementById('formAgregarBus');
        if (form.placa.value == "") {
            swal.fire('ERROR', 'La placa del bus es requerido', 'error');
            return false;
        }
        if (form.asientos.value == "") {
            swal.fire('ERROR', 'La cantidad de asientos es requerida', 'error');
            return false;
        }
        if (form.descripcion.value == "") {
            swal.fire('ERROR', 'La descripcion es requerida', 'error');
            return false;
        }
        return true;
    }
    
    
    // eliminar buses
    function eliminarBus(id) {
    $.ajax({
        type: 'POST',
        data: $('#frmAddViaje').serialize(), // Convierte los datos del formulario a application/x-www-form-urlencoded
        url: '../ServletBus?accion=eliminar&idBus=' + id,
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
            swal.fire('CORRECTO', 'Se elimin&oacute el bus', 'success').then((result) => {
                if (result.isConfirmed) {
                    location.reload();
                }
            });
        }
    });
}
