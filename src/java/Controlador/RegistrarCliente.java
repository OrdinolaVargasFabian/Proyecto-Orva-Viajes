package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.DTOCliente;
import DAO.DAOClientes;

@WebServlet(name = "RegistrarCliente", urlPatterns = {"/RegistrarCliente"})
public class RegistrarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("accion");
        DAOClientes dao = new DAOClientes();
        DTOCliente cliente = new DTOCliente();

        if (action != null && action.equals("actualizar")) {
            LeerDatos(request, cliente, true);
            dao.ActualizarCliente(cliente);
            response.sendRedirect("Vista/AdministrarClientes.jsp");
        } else {
            LeerDatos(request, cliente, false);
            dao.AgregarCliente(cliente);
            response.sendRedirect("Vista/AdministrarClientes.jsp");
        }
    }

    private void LeerDatos(HttpServletRequest request, DTOCliente cliente, boolean editar) {
        cliente.setAppat(request.getParameter("appat"));
        cliente.setApmat(request.getParameter("apmat"));
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setDni(Integer.parseInt(request.getParameter("dni")));
        cliente.setFechaNacimiento(request.getParameter("fechaNacimiento"));
        cliente.setTelefono(Integer.parseInt(request.getParameter("telefono")));
        cliente.setGenero(request.getParameter("genero"));
        if (editar) {
            cliente.setId(Integer.parseInt(request.getParameter("idCliente")));
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar y actualizar clientes";
    }
}


