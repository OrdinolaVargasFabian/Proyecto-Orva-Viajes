
package Controlador;

import Modelo.DTOChofer;
import DAO.DAOChoferes;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rhommel
 */
@WebServlet(name = "ControladorChofer", urlPatterns = {"/ControladorChofer"})
public class ControladorChofer extends HttpServlet {
    
      String listar="Vista/AdministrarChoferes.jsp";
      String add = "Vista/AdministrarChoferes.jsp";
      String edit = "Vista/AdministrarChoferes.jsp";
      DTOChofer chofer = new DTOChofer();
      DAOChoferes dao = new DAOChoferes();
      String id;
      
public void LeerChoferes(HttpServletRequest request, HttpServletResponse response,boolean isUpdate){
 DTOChofer chofer = new DTOChofer();

    if (isUpdate) {
        chofer.setId(Integer.parseInt(request.getParameter("idchofer"))); // Solo se necesita para actualización
    }

    chofer.setAppat(request.getParameter("appat"));
    chofer.setApmat(request.getParameter("apmat"));
    chofer.setNombre(request.getParameter("nombre"));
    chofer.setDni(Integer.parseInt(request.getParameter("dni")));
    chofer.setLicenciaConducir(request.getParameter("licencia"));

    try {
        String fechaVencLicencia = request.getParameter("vencLicencia");
        java.sql.Date sqlFechaVencLicencia = java.sql.Date.valueOf(fechaVencLicencia);
        chofer.setFechaVencimientoLicencia(sqlFechaVencLicencia);
    } catch (Exception e) {
        e.printStackTrace();
    }

    chofer.setTelefono(Integer.parseInt(request.getParameter("telefono")));
    chofer.setDisponibilidad(1); // Valor por defecto
    chofer.setEstado(1); // Valor por defecto

    request.setAttribute("chofer", chofer);
} 
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String acceso="";
        String action = request.getParameter("accion");//accion: listar,agregar,editar,eliminar
        
        DAOChoferes dao = new DAOChoferes();
        
        if(action.equalsIgnoreCase("listar")){
            LinkedList<DTOChofer> listaChoferes = dao.ListarChoferes();
            HttpSession session = request.getSession();
            session.setAttribute("listaChoferes", listaChoferes);
        }else if(action.equalsIgnoreCase("add")){
            
        }else if(action.equalsIgnoreCase("Agregar")){
            LeerChoferes(request,response,false);
            DTOChofer chofer = (DTOChofer) request.getAttribute("chofer");
            dao.AgregarChofer(chofer);
            acceso=listar;
        }else if(action.equalsIgnoreCase("Editar")){
            request.setAttribute("idchofer",request.getParameter("idchofer"));
            acceso=edit;
        }else if(action.equalsIgnoreCase("Actualizar")){
             LeerChoferes(request,response, true);
             DTOChofer chofer = (DTOChofer) request.getAttribute("chofer");
             dao.ActualizarChofer(chofer);
             acceso=listar;
        }else if(action.equalsIgnoreCase("eliminar")){
            int id = Integer.parseInt(request.getParameter("idchofer"));
           // id = request.getParameter("idchofer");
            dao.EliminarChofer(id);
            acceso=listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher("Vista/AdministrarChoferes.jsp");
        vista.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
