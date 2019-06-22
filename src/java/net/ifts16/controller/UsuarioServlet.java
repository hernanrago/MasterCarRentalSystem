/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Path;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
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
                    crearUsuario(request, response);
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
                case "ingresar":
                    ingresar(request, response);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "salir":
                    salir(request);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("usuarios", mostrarUsuarios());
            request.getRequestDispatcher("usuarios.jsp").forward(request, response);
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

//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
    private void salir(HttpServletRequest request) {
        request.getSession().invalidate();
    }

    private List<Usuario> mostrarUsuarios() {
        return new UsuarioDAO().obtenerTodos();
    }

    private void crearUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        usuarioDAO = new UsuarioDAO();

        Usuario u = new Usuario(
                request.getParameter("nombre"),
                request.getParameter("apellido"),
                request.getParameter("nombreUsuario"),
                request.getParameter("contrasena"),
                request.getParameter("rol") != null ? request.getParameter("rol") : Rol.CLIENTE.name());

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<Usuario>> violations = validator.validate(u);

        if (violations.isEmpty()) usuarioDAO.crear(u);
        else {
                List<String> mensajes = new ArrayList<>();
        violations.forEach(v -> mensajes.add(v.getMessage()));

        response.setContentType("text/json");
        response.getWriter().print(new Gson().toJson(mensajes));
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, new Gson().toJson(mensajes));
    }
}

private void editarUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            usuarioDAO = new UsuarioDAO();
            Usuario u = usuarioDAO.obtener(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("editar-usuario.jsp").forward(request, response);
        

} catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class
.getName()).log(Level.SEVERE, null, ex);
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

    private void ingresar(HttpServletRequest request, HttpServletResponse response) {
        usuarioDAO = new UsuarioDAO();
        Usuario u = usuarioDAO.identificar(request.getParameter("nombreUsuario"),
                request.getParameter("contrasena"));

        if (u != null) {
            request.getSession().setAttribute("usuario", u);
        }
    }
}
