/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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

        switch (request.getParameter("tipo")) {
            case "registro":
                ingresarSede(request);
                response.sendRedirect("consultSede.jsp");
                break;
            case "listado":
                request.setAttribute("sedes", mostrarSedes(request));
                request.getRequestDispatcher("consultSede.jsp").forward(request, response);
                break;
            case "editar":
                editSede(request);
                response.sendRedirect("consultSede.jsp");
                break;
            case "eliminar":
                elimSede(request);
                response.sendRedirect("consultSede.jsp");
                break;
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

    private void ingresarSede(HttpServletRequest request) throws ServletException, IOException {

        Sede sede = new Sede(request.getParameter("domicilio"),
                request.getParameter("codigoPostal"),
                request.getParameter("ciudad"),
                request.getParameter("provincia"));

        sedeDAO = new SedeDAO();
        sedeDAO.crear(sede);

    }

    private List<Sede> mostrarSedes(HttpServletRequest request) throws ServletException, IOException {
        sedeDAO = new SedeDAO();
        return sedeDAO.obtenerTodos();
    }

    private void editSede(HttpServletRequest request) throws ServletException, IOException {
        sedeDAO = new SedeDAO();
        sedeDAO.actualizar(Integer.parseInt(request.getParameter("id")));
    }

    private void elimSede(HttpServletRequest request) throws ServletException, IOException {
        int sede = Integer.parseInt(request.getParameter("id"));

        sedeDAO = new SedeDAO();
        sedeDAO.borrar(sede);
    }
}
