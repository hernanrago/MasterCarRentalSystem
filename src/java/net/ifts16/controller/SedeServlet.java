/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.ifts16.dao.SedeDAO;
import net.ifts16.model.Sede;

/**
 *
 * @author Hernán Rago
 */
public class SedeServlet extends HttpServlet {

    private SedeDAO sedeDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String comando = request.getParameter("comando");

        if (comando != null) {
            switch (comando) {
                case "nuevo":
                    request.getRequestDispatcher("sede.jsp").forward(request, response);
                    break;
                case "crear":
                    crearSede(request);
                    break;
                case "editar":
                    editarSede(request, response);
                    break;
                case "actualizar":
                    actualizarSede(request);
                    break;
                case "eliminar":
                    eliminarSede(request);
                    break;
            }
        }
        request.setAttribute("sedes", mostrarSedes());
        request.getRequestDispatcher("consultSede.jsp").forward(request, response);

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

    private void crearSede(HttpServletRequest request) throws ServletException, IOException {

        Sede sede = new Sede(request.getParameter("domicilio"),
                request.getParameter("codigoPostal"),
                request.getParameter("ciudad"),
                request.getParameter("provincia"));

        sedeDAO = new SedeDAO();
        sedeDAO.crear(sede);
    }

    private List mostrarSedes() throws ServletException, IOException {
        return new SedeDAO().obtenerTodos();
    }

    private void editarSede(HttpServletRequest request, HttpServletResponse response) {
        try {
            sedeDAO = new SedeDAO();
            Sede sede = sedeDAO.obtener(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("sede", sede);
            request.getRequestDispatcher("editSede.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SedeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void actualizarSede(HttpServletRequest request) {
        sedeDAO = new SedeDAO();
        Sede sede = new Sede(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("domicilio"),
                request.getParameter("codigoPostal"),
                request.getParameter("ciudad"),
                request.getParameter("provincia"));
        sedeDAO.actualizar(sede);
    }

    private void eliminarSede(HttpServletRequest request) throws ServletException, IOException {
        int sede = Integer.parseInt(request.getParameter("sedeId"));
        sedeDAO = new SedeDAO();
        sedeDAO.borrar(sede);
    }
}
