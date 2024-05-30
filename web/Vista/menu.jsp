<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.LinkedList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%--Bootstrap--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        
        <%--CSS Tablas Dinamicas--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
        <link href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">

        <%--JQuery--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <%--JS Tablas Dinamicas--%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.min.js"></script>
        
        <%--Botones Tablas Dinamicas--%>
        <link href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap5.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
        
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>

        <%--Iconos--%>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <%--Pop Up--%>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <link rel="icon" href="../Imagenes/Orva_Viajes_logo.png">

        <title>Orva Viajes</title>
    </head>
    <body style="background-color: rgb(231, 239, 246);">
        <!-- Establece la sesion iniciada -->
        <c:set var="usuario" value="${sessionScope.user}"/>
        <!-- Valida si hay una sesion activa -->
        <c:if test="${usuario == null}">
            <script>
                window.location.href = '../Vista/login.jsp';
            </script>
        </c:if>
        <input type="hidden" name="idUsuario" id="idUsuario" value="${usuario.getIdUsuario()}">
        <div>
            <div class="d-flex align-items-start">
                <div class="nav flex-column p-3 col-2 d-flex justify-content-between min-vh-100 shadow" style="background-color: rgb(39, 49, 53); position: fixed;">
                    <div>
                        <div class="d-flex justify-content-center align-items-center my-4">
                            <img src="https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg" class="rounded-circle" alt="..." width="100" height="100">
                        </div>
                        <div>
                            <h4 class="text-center text-white"><c:out value="${usuario.getAppat()} ${usuario.getApmat()}, ${usuario.getNombre()}"/></h4>
                        </div>
                    </div>
                    
                    <hr class="text-white">

                    <ul class="nav flex-column">
                        <li class="nav-item mb-3">
                            <a class="nav-link text-white" aria-current="page" href="AdministrarBuses.jsp"><i class='bx bxs-bus me-2'></i>Registrar Bus</a>
                        </li>
                        <li class="nav-item mb-3">
                            <a class="nav-link text-white" aria-current="page" href="AdministrarChoferes.jsp"><i class='bx bxs-user-account me-2'></i>Registrar Choferes</a>
                        </li>
                        <li class="nav-item mb-3">
                            <a class="nav-link text-white" aria-current="page" href="AdministrarViajes.jsp"><i class='bx bxs-map me-2'></i>Programar Ruta</a>
                        </li>
                        <li class="nav-item mb-3">
                            <a class="nav-link text-white" aria-current="page" href="AdministrarClientes.jsp"><i class='bx bx-user me-2'></i>Registrar Cliente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="AdministrarPasajes.jsp"><i class='bx bxs-coupon me-2'></i>Pasajes</a>
                        </li>
                    </ul>
                    
                    <hr class="text-white">
                    
                    <div class="text-center">
                        <a href="../srvIniciarSesion?accion=cerrar" class="text-white" style="text-decoration: none;"><i class='bx bx-log-out me-2'></i>Cerrar Sesión</a>
                    </div>
                </div>
                <div class="col-2"></div>
                <div class="col-10">
                    <div class="row">
                        <!<!-- Banner superior con el logo -->
                        <div class="d-flex align-items-center justify-content-center p-2 flex-fill" style="background-color: rgb(21, 37, 58);">
                            <img src="../Imagenes/Orva_Viajes_logo.png" class="img-fluid me-3" alt="..." width="100px">
                            <h1 class="m-0 text-white">Orva Viajes</h1>
                        </div>
                    </div>
            
