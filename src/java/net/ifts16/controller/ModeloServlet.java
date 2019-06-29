/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.ifts16.dao.ModeloDAO;
import net.ifts16.enums.Marca;
import net.ifts16.model.Modelo;
import org.json.simple.JSONObject;

/**
 *
 * @author vitor
 */
public class ModeloServlet extends HttpServlet {
    
    private ModeloDAO modeloDAO;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String comando = request.getParameter("comando");

        if (comando != null) {
            switch (comando) {
                case "crear":
                    crearModelo(request);
                    break;
                case "editar":
                    editarModelo(request, response);
                    break;
                case "eliminar":
                    eliminarModelo(request);
                    break;
                case "mostrar":
                    mostrarModelo(request, response);
                    break;
            }
        }
        request.setAttribute("modelos", mostrarModelos());
        request.getRequestDispatcher("consultaModelos.jsp").forward(request, response);
        }
    

    private void crearModelo(HttpServletRequest request) {
        Modelo modelo = new Modelo(
                request.getParameter("descripcion"),
                Marca.valueOf(request.getParameter("marca"))
        );
        modeloDAO = new ModeloDAO();
        modeloDAO.crear(modelo);
    }

    private void eliminarModelo(HttpServletRequest request) {
        modeloDAO = new ModeloDAO();
        modeloDAO.borrar(Integer.parseInt(request.getParameter("modeloId")));
    }

    private List mostrarModelos() {
        return new ModeloDAO().obtenerTodos();
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

    private void mostrarModelo(HttpServletRequest request, HttpServletResponse response) {
        modeloDAO = new ModeloDAO();
        Modelo modelo = modeloDAO.obtener(Integer.parseInt(request.getParameter("modeloId")));
        PrintWriter out = null;
        try {
            out = response.getWriter();
            JSONObject json = new JSONObject();
            json.put("id", modelo.getId());
            json.put("nombre", modelo.getNombre());
            json.put("marca", modelo.getMarca().toString());
            out.print(json);
        } catch (IOException ex) {
            Logger.getLogger(ReservaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    private void editarModelo(HttpServletRequest request, HttpServletResponse response) {
        modeloDAO = new ModeloDAO();
        Modelo modelo = new Modelo(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("descripcion")
        );
        modeloDAO.actualizar(modelo);
    }
}

