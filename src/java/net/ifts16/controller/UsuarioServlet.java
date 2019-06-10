/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.ifts16.dao.UsuarioDAO;
import net.ifts16.enums.Rol;
import net.ifts16.model.Usuario;

/**
 *
 * @author Hernán Rago
 */
public class UsuarioServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        response.setContentType("text/html;charset=UTF-8");

        switch (request.getParameter("comando")) {
            case "ingreso":
                try {
                    request.login(request.getParameter("nombreUsuario"), request.getParameter("contrasena"));
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                } catch (ServletException e) {
                    Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, e);
                    RequestDispatcher rd = request.getRequestDispatcher("ingreso.jsp");
                    rd.forward(request, response);
                }
                break;
            case "salir":
                salir(request, response);
                break;
            case "registro":
                insertarUsuario(request);
                response.setStatus(200);
                break;

        }

//        insertarUsuario(request, response);
//
//        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insertarUsuario(HttpServletRequest request)
            throws SQLException, IOException, ServletException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol") != null ? request.getParameter("rol") : Rol.CLIENTE.name();
        Usuario usuario = new Usuario(nombre, apellido, nombreUsuario, contrasena, rol);
        usuarioDAO = new UsuarioDAO();
        usuarioDAO.crear(usuario);

//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
    }

    private void salir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.logout();
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
