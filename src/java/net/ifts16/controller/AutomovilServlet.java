/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.ifts16.dao.AutomovilDAO;
import net.ifts16.dao.ModeloDAO;
import net.ifts16.dao.SedeDAO;
import net.ifts16.enums.Cambios;
import net.ifts16.model.Automovil;

/**
 *
 * @author Hernán Rago
 */
public class AutomovilServlet extends HttpServlet {

    private AutomovilDAO automovilDAO;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String x = request.getParameter("comando");
        switch (x) {
            case "automovilesDisponibles":
                mostrarAutomovilesDisponibles(request, response);
                break;
            default:
                System.out.println("No entró");
        }

//        Automovil automovil = new Automovil(
//                request.getParameter("patente"),
//                //                new ModeloDAO().obtener(Integer.parseInt(request.getParameter("modelo"))),
//                new ModeloDAO().obtener(1),
//                Integer.parseInt(request.getParameter("pasajeros")),
//                Integer.parseInt(request.getParameter("puertas")),
//                new BigDecimal(request.getParameter("precio")),
//                //                Cambios.valueOf(request.getParameter("cambios")) ,
//                Cambios.AUTOMATICO,
//                //                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeRadicacion"))),
//                //                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeUbicacion"))),
//                new SedeDAO().obtener(1),
//                new SedeDAO().obtener(1),
//                false,
//                false);
//
//        automovilDAO = new AutomovilDAO();
//        automovilDAO.crear(automovil);
//
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AutomovilServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AutomovilServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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

    private void mostrarAutomovilesDisponibles(HttpServletRequest request,
            HttpServletResponse response) {
        
        automovilDAO = new AutomovilDAO();
        List<Automovil> automoviles = automovilDAO.obtenerTodos();
        request.setAttribute("automoviles", automoviles);
        
        try {
            request.getRequestDispatcher("automoviles.jsp").forward(request,response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(AutomovilServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
