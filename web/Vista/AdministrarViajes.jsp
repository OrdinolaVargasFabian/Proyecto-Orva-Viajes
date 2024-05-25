<div class="mb-3">
    <hr>
    <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarViaje"><i class='bx bx-plus me-2'></i>Programar</button>
        <button type="button" class="btn btn-primary"><i class='bx bx-refresh me-2'></i>Refrescar</button>
    </div>
    <hr>
    <h3 class="text-center">Filtrar por Fecha</h3>
    <div class="d-flex justify-content-between">
        <div>
            <label for="fechaInicio">Fecha de inicio</label>
            <input type="date" class="form-control" placeholder="Fecha de inicio">
        </div>
        <div>
            <label for="fechaFin">Fecha de fin</label>
            <input type="date" class="form-control" placeholder="Fecha de fin">
        </div>
    </div>
    
    <%@ include file="../componentes/viaje/modalAgregarViaje.jsp" %>
</div>

<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-viaje" class="table table-striped m-3">
        <thead>
            <tr>
                <td class="text-center">ID</td>
                <td class="text-center">BUS</td>
                <td class="text-center">CHOFER</td>
                <td class="text-center">SALIDA</td>
                <td class="text-center">LLEGADA</td>
                <td class="text-center">ORIGEN</td>
                <td class="text-center">DESTINO</td>
                <td class="text-center">PRECIO</td>
                <td class="text-center">BOLETOS RESTANTES</td>
                <td class="text-center">ACCIONES</td>
            </tr>
        </thead>
        <%-- <tbody>
            <tr>
                <td class="text-center">1</td>
                <td class="text-center">Sanchez Quintana, Jorge</td>
                <td class="text-center">78364582</td>
                <td class="text-center">T12345678</td>
                <td class="text-center">12/11/2023</td>
                <td class="text-center">24/07/2027</td>
                <td class="text-center">987654321</td>
                <td class="text-center">Disponible</td>
                <td class="text-center">Activo</td>
                <td class="text-center"></td>
            </tr>
        </tbody> --%>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('#datatable-viaje').DataTable({
        columnDefs: [
                {
                    // Actions
                    targets: -1,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, full, meta) {
                        var btnEliminar = "<button type='button' class='btn btn-icon btn-outline-danger  me-2'><i class='tf-icons bx bxs-trash'></i></button>"
                        var btnEditar = "<button type='button' class='btn btn-icon btn-outline-info  me-2'><i class='bx bxs-edit'></i></button>"

                        return (
                                '<div class="d-inline-block text-nowrap">' +
                                btnEditar +
                                btnEliminar +
                                '</div>'
                                );
                    }
                }
            ],
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
                    className: 'btn btn-success mx-3 rounded'
                },
                {
                    extend: 'pdf',
                    text: '<i class="bx bxs-file-pdf me-2"></i>PDF',
                    titleAttr: 'Exportar a PDF',
                    className: 'btn btn-danger me-3 rounded'
                },
                {
                    extend: 'print',
                    text: '<i class="bx bxs-printer me-2"></i>Imprimir',
                    titleAttr: 'Imprimir',
                    className: 'btn btn-info text-white rounded'
                }
            ],
            responsive: true
        });
    });
</script>