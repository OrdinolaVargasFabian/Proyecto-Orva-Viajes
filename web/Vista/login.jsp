<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <link rel="icon" href="../Imagenes/Orva_Viajes_logo.png">
        <title>Login | Orva Viajes</title>
    </head>
    <body style="background-color: rgb(21, 37, 58);" >
        <div class="d-flex justify-content-between row align-items-center mt-5" style="width: 100%;">
            <div class="col d-flex justify-content-center align-items-center">
                <img src="../Imagenes/Orva_Viajes_logo.png" class="img-fluid me-3" alt="...">
            </div>
            <div class="container bg-light col-4 p-5 rounded me-5 shadow">
                <h1 class="text-center mb-4">Login</h1>
                <form method="post" action="../srvIniciarSesion?accion=verificar">
                    <div class="row mb-3">
                        <div>
                            <label for="username">Correo:</label>
                            <input type="text" id="username" name="txtCorreo" class="form-control">
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div>
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="txtPassword" class="form-control">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <button class="btn btn-lg btn-primary" type="submit">Inicia Sesion</button>
                    </div>
                </form>
            </div>
        </div>

    </body>
    <script>
        /* $('#btnLogin').click(function () {

            Swal.fire({
                title: "Correcto!",
                text: "Inicio de Sesión Exitoso!",
                icon: "success"

            });
        });
        */
    </script>
</html>
