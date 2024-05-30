function obtenerChoferes() {
    $.ajax({
        url: '../ControladorChofer?accion=listar',
        type: 'POST',
        success: function (response) {
            console.log('Exito ObtenerChoferes');

            var dtTablaChoferes = $('#datatable-chofer');
            dtTablaChoferes.DataTable({
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
