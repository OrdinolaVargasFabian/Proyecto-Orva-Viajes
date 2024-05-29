package Controlador;

import DAO.DAOClientes;
import Modelo.DTOCliente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "RegistrarCliente", urlPatterns = {"/RegistrarCliente"})
public class RegistrarCliente extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private DAOClientes daoClientes = new DAOClientes();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        int dni = Integer.parseInt(request.getParameter("dni"));
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        String genero = request.getParameter("genero");

        // Crear el objeto DTOCliente
        DTOCliente cliente = new DTOCliente();
        cliente.setNombre(nombre);
        cliente.setDni(dni);
        cliente.setFechaNacimiento(fechaNacimiento);
        cliente.setTelefono(telefono);
        cliente.setGenero(genero);

        // Llamar al método AgregarCliente del DAO
        boolean agregado = daoClientes.AgregarCliente(cliente);

        // Redirigir o mostrar un mensaje de éxito/error
        if (agregado) {
            response.sendRedirect("AdministrarClientes.jsp?mensaje=Cliente registrado exitosamente");
        } else {
            response.sendRedirect("AdministrarClientes.jsp?mensaje=Error al registrar el cliente");
        }
    }
}

