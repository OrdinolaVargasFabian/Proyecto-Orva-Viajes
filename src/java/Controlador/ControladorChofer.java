
package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.*;
import DAO.DAOChoferes;
import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorChofer", urlPatterns = {"/ControladorChofer"})
public class ControladorChofer extends HttpServlet {
       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        String action = request.getParameter("accion");
        DAOChoferes dao = new DAOChoferes();
        DTOChofer chofer = new DTOChofer();

        if (action != null && action.equals("actualizar")) {
            LeerChoferes(request,chofer, true);
            dao.ActualizarChofer(chofer);
            response.sendRedirect("Vista/AdministrarChoferes.jsp");
        } else {
            LeerChoferes(request, chofer, false);
            dao.AgregarChofer(chofer);
            response.sendRedirect("Vista/AdministrarChoferes.jsp");
        }
        
    }  
    
            
    public void LeerChoferes(HttpServletRequest request, DTOChofer chofer,boolean editar){
//         DTOChofer chofer = new DTOChofer();
 //       chofer.setId(Integer.parseInt(request.getParameter("idChofer")));
        chofer.setAppat(request.getParameter("appat"));
        chofer.setApmat(request.getParameter("apmat"));
        chofer.setNombre((request.getParameter("nombre")));        
        chofer.setDni(Integer.parseInt(request.getParameter("dni")));
        chofer.setLicenciaConducir(request.getParameter("licencia"));
        chofer.setFechaVencimientoLicencia(Date.valueOf(request.getParameter("Venclicencia")));
        chofer.setTelefono(Integer.parseInt(request.getParameter("telefono")));
        if (editar) {
            chofer.setId(Integer.parseInt(request.getParameter("idChofer")));
        } else {
            chofer.setCreador(Integer.parseInt(request.getParameter("id")));
        }
    }
        
        
        
        
//        DAOChoferes dao = new DAOChoferes();
//        
//        String action = request.getParameter("accion");//accion: listar,agregar,editar,eliminar
//        
//        if(action.equalsIgnoreCase("editar")){
//            int idChofer = Integer.parseInt(request.getParameter("idChofer"));
//            chofer = dao.ObtenerChofer(idChofer);
//            HttpSession session = request.getSession();
//            session.setAttribute("detalleChofer", chofer);
//            response.sendRedirect("Vista/EditarChofer.jsp");
//        }else if(action.equalsIgnoreCase("actualizar")){
//            LeerChoferes(request, response, true);
//            dao.ActualizarChofer(chofer);
//            response.sendRedirect("Vista/AdministrarChoferes.jsp");             
//        }else if(action.equalsIgnoreCase("listar")){
//            LinkedList<DTOChofer> listaChoferes = dao.ListarChoferes();
//            HttpSession session = request.getSession();
//            session.setAttribute("listaChoferes", listaChoferes);           
//            RequestDispatcher vista = request.getRequestDispatcher("Vista/AdministrarChoferes.jsp");
//            vista.forward(request, response);                 
//        }else if(action.equalsIgnoreCase("agregar")){                        
//            LeerChoferes(request, response, false);
//            dao.AgregarChofer(chofer);
//                      
//        }else if(action.equalsIgnoreCase("eliminar")){
//            int idChofer = Integer.parseInt(request.getParameter("idChofer"));
//            dao.EliminarChofer(idChofer);            
//        }        
    

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar y actualizar choferes";
    }// </editor-fold>

}

