/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.DAOBuses;
import Modelo.DTOBuses;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luis Armando Bailon Victorio - luis_abv@outlook.com
 */
@WebServlet(name = "ServletBus", urlPatterns = {"/ServletBus"})
public class ServletBus extends HttpServlet {
    
    DTOBuses bus = new DTOBuses();
    
    public void LeerDatos(HttpServletRequest request, HttpServletResponse response, boolean editar){
        bus.setPlaca(request.getParameter("placa"));
        bus.setCapacidadAsientos(Integer.parseInt(request.getParameter("asientos")));
        bus.setDescripcion(request.getParameter("descripcion"));
        
        if (editar) {
            bus.setId(Integer.parseInt(request.getParameter("idBus")));
        } else {
            bus.setCreador(Integer.parseInt(request.getParameter("id")));
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // crear funciones crud
        DAOBuses daoBus = new DAOBuses();
        
        // obtener accion
        String action = request.getParameter("accion");
        
         if (action.equalsIgnoreCase("listar")) {
            ArrayList<DTOBuses> listaBuses = daoBus.getBusesDisponibles();
            HttpSession session = request.getSession();
            session.setAttribute("listaBuses", listaBuses);
            RequestDispatcher vista = request.getRequestDispatcher("Vista/AdministrarBuses.jsp");
            vista.forward(request, response);
        } else if (action.equalsIgnoreCase("agregar")) {
            LeerDatos(request, response, false);
            daoBus.addBus(bus);
        } else if (action.equalsIgnoreCase("editar")) {
            int idBus = Integer.parseInt(request.getParameter("idBus"));
            bus = daoBus.getBus(idBus);
            HttpSession session = request.getSession();
            session.setAttribute("detalleBus", bus);
            response.sendRedirect("Vista/EditarBus.jsp");
        } else  if (action.equalsIgnoreCase("actualizar")) {
            LeerDatos(request, response, true);
            daoBus.updateBus(bus);
            response.sendRedirect("Vista/AdministrarBuses.jsp");
        } else if (action.equalsIgnoreCase("eliminar")) {
            int idBus = Integer.parseInt(request.getParameter("idBus"));
            daoBus.deleteBus(idBus);
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
