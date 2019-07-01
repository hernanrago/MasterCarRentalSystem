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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String comando = request.getParameter("comando");
        
        if(comando != null){
            switch (comando) {
            case "nuevo":
                request.getRequestDispatcher("automovil.jsp").forward(request, response);
            break;
            case "automovilesDisponibles":
                mostrarAutomovilesDisponibles(request, response);
                break;
            case "ingresarAutomovil":
                ingresarAutomovil(request, response);
            break;
            case "editar":
                editarAuto(request, response);
            break;
            case "mostrarAutos":
                mostrarAutos(request, response);
            break;    
            case"eliminar":
                eliminarAuto(request, response);
            break;
            case "actualizar":
                actualizarAuto(request, response);
            break;
            }
        }else{
            request.setAttribute("autos", mostrarAutos(request, response));
            request.getRequestDispatcher("consultAuto.jsp").forward(request,response);
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
                new ModeloDAO().obtener(Integer.parseInt(request.getParameter("modelo"))),
                Integer.parseInt(request.getParameter("pasajeros")),
                Integer.parseInt(request.getParameter("puertas")),
                new BigDecimal(request.getParameter("precio")),
                Cambios.valueOf(request.getParameter("cambios")) ,
                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeRadicacion"))),
                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeUbicacion"))),
                false,
                false);

        automovilDAO = new AutomovilDAO();
        automovilDAO.crear(automovil);
    }
    
    private List mostrarAutos(HttpServletRequest request, HttpServletResponse response){
        return new AutomovilDAO().obtenerTodos();
    }

    private void editarAuto(HttpServletRequest request, HttpServletResponse response) {
        try{
            automovilDAO = new AutomovilDAO();
            Automovil automovil = automovilDAO.obtener(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("auto", automovil);
            request.getRequestDispatcher("editAuto.jsp").forward(request, response);
        }catch (ServletException | IOException ex) {
            Logger.getLogger(SedeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminarAuto(HttpServletRequest request, HttpServletResponse response) {
        automovilDAO = new AutomovilDAO();
        automovilDAO.borrar(Integer.parseInt(request.getParameter("autoId")));
    }

    private void actualizarAuto(HttpServletRequest request, HttpServletResponse response) {
        automovilDAO = new AutomovilDAO();
        Automovil automovil = new Automovil(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("patente"),
                new ModeloDAO().obtener(Integer.parseInt(request.getParameter("modelo"))),
                Integer.parseInt(request.getParameter("pasajeros")),
                Integer.parseInt(request.getParameter("puertas")),
                new BigDecimal(request.getParameter("precio")),
                Cambios.valueOf(request.getParameter("cambios")) ,
                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeRadicacion"))),
                new SedeDAO().obtener(Integer.parseInt(request.getParameter("sedeUbicacion")))
        );
        automovilDAO.actualizar(automovil);
    }
}
