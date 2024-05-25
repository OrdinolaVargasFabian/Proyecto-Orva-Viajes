<div class="mb-3">
    <hr>
    <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarChofer"><i class='bx bx-plus me-2'></i>Registrar</button>
        <button type="button" class="btn btn-primary"><i class='bx bx-refresh me-2'></i>Refrescar</button>
    </div>
    
    <%@ include file="../componentes/chofer/modalAgregarChofer.jsp" %>
</div>

<div class="card-datatable table-responsive bg-light p-3 rounded shadow">
    <table id="datatable-chofer" class="table table-striped m-3">
        <thead>
            <tr>
                <td class="text-center">ID</td>
                <td class="text-center">NOMBRE</td>
                <td class="text-center">DNI</td>
                <td class="text-center">LICENCIA</td>
                <td class="text-center">CONTRATACION</td>
                <td class="text-center">VENCIMIENTO</td>
                <td class="text-center">TELEFONO</td>
                <td class="text-center">DISPONIBILIDAD</td>
                <td class="text-center">ESTADO</td>
                <td class="text-center">ACCIONES</td>
            </tr>
        </thead>
        <tbody>
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
        </tbody>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('#datatable-chofer').DataTable({
        columnDefs: [
            {
                // Actions
                targets: -1,
                searchable: false,
                orderable: false,
                render: function (data, type, full, meta) {
                    var btnEliminar = "<button onclick='(\"" + full['item_id'] + "\")' type='button' class='btn btn-icon btn-outline-danger  me-2'><i class='tf-icons bx bxs-trash'></i></button>"
                    var btnEditar = "<button onclick='(\"" + full['item_id'] + "\")' type='button' class='btn btn-icon btn-outline-info  me-2'><i class='bx bxs-edit'></i></button>"

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
    });
</script>