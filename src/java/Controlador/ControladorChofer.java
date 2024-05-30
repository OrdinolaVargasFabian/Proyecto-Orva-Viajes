
package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.DTOChofer;
import DAO.DAOChoferes;
import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorChofer", urlPatterns = {"/ControladorChofer"})
public class ControladorChofer extends HttpServlet {
    
    DTOChofer chofer = new DTOChofer();
           
    public void LeerChoferes(HttpServletRequest request, HttpServletResponse response,boolean editar){
 //       DTOChofer chofer = new DTOChofer();
 //       chofer.setId(Integer.parseInt(request.getParameter("idChofer")));
        chofer.setAppat(request.getParameter("txtAppat"));
        chofer.setApmat(request.getParameter("txtApmat"));
        chofer.setNombre((request.getParameter("txtNombre")));        
        chofer.setDni(Integer.parseInt(request.getParameter("txtDni")));
        chofer.setLicenciaConducir(request.getParameter("txtLicencia"));
        chofer.setFechaVencimientoLicencia(Date.valueOf(request.getParameter("txtVencLicencia")));
        chofer.setTelefono(Integer.parseInt(request.getParameter("txtTelefono")));
        if (editar) {
            chofer.setId(Integer.parseInt(request.getParameter("idChofer")));
        } else {
            chofer.setCreador(Integer.parseInt(request.getParameter("id")));
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
              
        DAOChoferes dao = new DAOChoferes();
        String action = request.getParameter("accion");//accion: listar,agregar,editar,eliminar
        
        if(action.equalsIgnoreCase("editar")){
            int idChofer = Integer.parseInt(request.getParameter("idChofer"));
            chofer = dao.ObtenerChofer(idChofer);
            HttpSession session = request.getSession();
            session.setAttribute("detalleChofer", chofer);
            response.sendRedirect("Vista/EditarChofer.jsp");
        }else if(action.equalsIgnoreCase("actualizar")){
            LeerChoferes(request, response, true);
            dao.ActualizarChofer(chofer);
            response.sendRedirect("Vista/AdministrarChoferes.jsp");             
        }else if(action.equalsIgnoreCase("listar")){
            LinkedList<DTOChofer> listaChofer = dao.ListarChoferes();
            HttpSession session = request.getSession();
            session.setAttribute("listaChoferes", listaChofer);           
            RequestDispatcher vista = request.getRequestDispatcher("Vista/AdministrarChoferes.jsp");
            vista.forward(request, response);                 
        }else if(action.equalsIgnoreCase("agregar")){                        
            LeerChoferes(request, response, false);
            boolean agregado = dao.AgregarChofer(chofer);
            if(agregado){
                response.sendRedirect("Vista/AdministrarChoferes");
            }           
        }else if(action.equalsIgnoreCase("eliminar")){
            int idChofer = Integer.parseInt(request.getParameter("idChofer"));
            dao.EliminarChofer(idChofer);            
        }        
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
