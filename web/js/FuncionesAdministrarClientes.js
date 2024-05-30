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
        buttons: [
            {
                extend: 'excel',
                text: '<i class="bx bxs-file-export me-2"></i>Excel',
                titleAttr: 'Exportar a Excel',
                className: 'btn btn-success mx-3 rounded',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6, 7] //columnas de Cliente
                }
            },
            {
                extend: 'pdf',
                text: '<i class="bx bxs-file-pdf me-2"></i>PDF',
                titleAttr: 'Exportar a PDF',
                className: 'btn btn-danger me-3 rounded',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6, 7] //columnass de Cliente 
                }
            },
            {
                extend: 'print',
                text: '<i class="bx bxs-printer me-2"></i>Imprimir',
                titleAttr: 'Imprimir',
                className: 'btn btn-info text-white rounded',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8] // Ajusta las columnas según tu tabla de clientes
                }
            }
        ],
        responsive: true
    });
});

