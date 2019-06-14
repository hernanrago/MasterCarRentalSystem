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
import java.util.List;
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

        String comando = request.getParameter("comando");

        if (comando != null) {
            switch (comando) {
                case "nuevo":
                    request.getRequestDispatcher("nuevo-usuario.jsp").forward(request, response);
                    break;
                case "crear":
                    crearUsuario(request);
                    break;
                case "editar":
                    editarUsuario(request, response);
                    break;
                case "actualizar":
                    actualizarUsuario(request);
                    break;
                case "eliminar":
                    eliminarUsuario(request);
                    break;
                case "salir":
                    salir(request, response);
                    break;
                case "registro":
                    response.setStatus(200);
                    break;
            }
        }
        request.setAttribute("usuarios", mostrarUsuarios());
        request.getRequestDispatcher("usuarios.jsp").forward(request, response);
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

//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
    private void salir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.logout();
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private List<Usuario> mostrarUsuarios() {
        return new UsuarioDAO().obtenerTodos();
    }

    private void crearUsuario(HttpServletRequest request)
            throws SQLException, IOException, ServletException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        usuarioDAO = new UsuarioDAO();
        usuarioDAO.crear(
                new Usuario(
                        request.getParameter("nombre"),
                        request.getParameter("apellido"),
                        request.getParameter("nombreUsuario"),
                        request.getParameter("contrasena"),
                        request.getParameter("rol") != null ? request.getParameter("rol") : Rol.CLIENTE.name()
                )
        );
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            usuarioDAO = new UsuarioDAO();
            Usuario u = usuarioDAO.obtener(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("editar-usuario.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void actualizarUsuario(HttpServletRequest request) {
        usuarioDAO = new UsuarioDAO();
        usuarioDAO.actualizar(
                new Usuario(
                        Integer.parseInt(request.getParameter("id")),
                        request.getParameter("nombre"),
                        request.getParameter("apellido"),
                        request.getParameter("nombreUsuario"),
                        request.getParameter("rol")
                )
        );
    }

    private void eliminarUsuario(HttpServletRequest request) {
        usuarioDAO = new UsuarioDAO();
        usuarioDAO.borrar(Integer.parseInt(request.getParameter("usuarioId")));
    }
}
