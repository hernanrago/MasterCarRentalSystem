/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("comando")) {
            case "automovilesDisponibles":
                mostrarAutomovilesDisponibles(request, response);
                break;
            case "ingresarAutomovil":
                ingresarAutomovil(request, response);
                break;
            default:
            request.getRequestDispatcher("automoviles.jsp").forward(request,response);
        }

//        }
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
        return "Short description";
    }// </editor-fold>

    private void mostrarAutomovilesDisponibles(HttpServletRequest request,
            HttpServletResponse response) {
        
        automovilDAO = new AutomovilDAO();
        List<Automovil> automoviles;
        String sede = request.getParameter("sede");
        automoviles = sede.equals("todas") ? automovilDAO.obtenerTodos() : automovilDAO.obtenerSedeUbicacion(sede);
        request.setAttribute("automoviles", automoviles);
        
        try {
            request.getRequestDispatcher("automoviles.jsp").forward(request,response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(AutomovilServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void ingresarAutomovil(HttpServletRequest request, HttpServletResponse response) {
                Automovil automovil = new Automovil(
                request.getParameter("patente"),
                //                new ModeloDAO().obtener(Integer.parseInt(request.getParameter("modelo"))),
                new ModeloDAO().obtener(1),
                Integer.parseInt(request.getParameter("pasajeros")),
                Integer.parseInt(request.getParameter("puertas")),
                new BigDecimal(request.getParameter("precio")),
                //                Cambios.valueOf(request.getParameter("cambios")) ,
                Cambios.AUTOMATICO,
                //                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeRadicacion"))),
                //                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeUbicacion"))),
                new SedeDAO().obtener(1),
                new SedeDAO().obtener(1),
                false,
                false);

        automovilDAO = new AutomovilDAO();
        automovilDAO.crear(automovil);
    }

}
