<!DOCTYPE html>
<html>
<head>
    <title>Administrar Clientes</title>
    <!-- Aquí deberías incluir las referencias a Bootstrap CSS y JS si no lo has hecho -->
</head>
<body>
    <div class="mb-3">
        <hr>
        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlAgregarCliente">
                <i class='bx bx-plus me-2'></i>Registrar
            </button>
            <button type="button" class="btn btn-primary">
                <i class='bx bx-refresh me-2'></i>Refrescar
            </button>
        </div>

        <%@ include file="../componentes/cliente/modalAgregarCliente.jsp" %>
    </div>

    <div class="card-datatable table-responsive bg-light p-3 rounded shadow">
        <table id="datatable-cliente" class="table table-striped m-3" style="width: 100%;">
            <thead>
                <tr>
                    <td class="text-center">ID</td>
                    <td class="text-center">NOMBRE</td>
                    <td class="text-center">DNI</td>
                    <td class="text-center">FECHA DE NACIMIENTO</td>
                    <td class="text-center">TELEFONO</td>
                    <td class="text-center">GENERO</td>
                    <td class="text-center">ESTADO</td>
                    <td class="text-center">ACCIONES</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center">1</td>
                    <td class="text-center">Vargas Santos, John</td>
                    <td class="text-center">123456789</td>
                    <td class="text-center">1990-01-01</td>
                    <td class="text-center">963852741</td>
                    <td class="text-center">Masculino</td>
                    <td class="text-center">Activo</td>
                    <td class="text-center"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $('#datatable-cliente').DataTable({
                columnDefs: [
                    {
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
                buttons: [],
                responsive: true
            });
        });
    </script>
</body>
</html>
