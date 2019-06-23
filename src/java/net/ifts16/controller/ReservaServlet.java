/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.ifts16.dao.AutomovilDAO;
import net.ifts16.dao.ReservaDAO;
import net.ifts16.dao.UsuarioDAO;
import net.ifts16.model.Reserva;

/**
 *
 * @author Hernán Rago
 */

public class ReservaServlet extends HttpServlet {
    private ReservaDAO reservaDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String comando = request.getParameter("comando");

        if (comando != null) {
            switch(comando){
                case "reservar":
                    reservar(request, response);
                break;
                case "mostrar":
                    mostrarSedes(request, response);
                break;    
                case "eliminar":
                    eliminarReserva(request);
                break;
                case "editar":
                    editarReserva(request, response);
                break;
                case "actualizar":
                    actualizarReserva(request, response);
                break;
            }
        }else{
            request.getRequestDispatcher("listaReserva.jsp").forward(request, response);
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

    private void reservar(HttpServletRequest request, HttpServletResponse response) {
        Reserva reserva = new Reserva(
                new Date(new java.util.Date().getTime()),
                new AutomovilDAO().obtener(Integer.parseInt(request.getParameter("automovilId"))),
//                new AutomovilDAO().obtener(1),
//                new UsuarioDAO().oUbtener(Integer.parseInt(request.getParameter("usuario"))) 
                new UsuarioDAO().obtener(Integer.parseInt(request.getParameter("usuarioId"))) 
        );
        
        reservaDAO = new ReservaDAO();
        reservaDAO.crear(reserva);    
    }// </editor-fold>

    private void mostrarSedes(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            reservaDAO = new ReservaDAO();
            List<Reserva> reservas;
            String sede = request.getParameter("sede");
            reservas = sede.equals("todas") ? reservaDAO.obtenerTodos() : reservaDAO.obtenerReservaUbicacion(sede);
            request.setAttribute("reservas", reservas);
            request.getRequestDispatcher("consultaReserva.jsp").forward(request,response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(AutomovilServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminarReserva(HttpServletRequest request) throws ServletException, IOException {
        int reserva = Integer.parseInt(request.getParameter("reservaId"));
        reservaDAO = new ReservaDAO();
        reservaDAO.borrar(reserva);
    }

    private void editarReserva(HttpServletRequest request, HttpServletResponse response) {
        try {
            reservaDAO = new ReservaDAO();
            Reserva reserva = reservaDAO.obtener(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("reserva", reserva);
            request.getRequestDispatcher("editarReserva.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SedeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void actualizarReserva(HttpServletRequest request, HttpServletResponse response) {
       // reservaDAO = new ReservaDAO();
        //Reserva reserva = new Reserva(
          //      Integer.parseInt(request.getParameter("id")),
                
        //);
    }

}
