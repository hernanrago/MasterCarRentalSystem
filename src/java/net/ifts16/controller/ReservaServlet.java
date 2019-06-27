/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.json.simple.JSONObject;

/**
 *
 * @author Hernán Rago
 */

public class ReservaServlet extends HttpServlet {
    private ReservaDAO reservaDAO;
    private AutomovilDAO automovilDAO;
    
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
                case "mostrarReserva":
                    mostrarReserva(request, response);
                break;
                case "cancelar":
                    cancelarReserva(request, response);
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
                new ReservaDAO().normalizarFecha(request.getParameter("fechaEntrega")),
                new ReservaDAO().normalizarFecha(request.getParameter("fechaDevolucion")),
                new AutomovilDAO().obtener(Integer.parseInt(request.getParameter("automovilId"))),
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
        automovilDAO = new AutomovilDAO();
        automovilDAO.cancelarReserva(Integer.parseInt(request.getParameter("autoActual")));
        automovilDAO.reservar(Integer.parseInt(request.getParameter("autoFinal")));
        reservaDAO = new ReservaDAO();
        Reserva reserva = new Reserva(
                Integer.parseInt(request.getParameter("id")),
                new ReservaDAO().normalizarFecha(request.getParameter("fechaAlquiler2")),
                new ReservaDAO().normalizarFecha(request.getParameter("fechaDevolucion2")),
                new AutomovilDAO().obtener(Integer.parseInt(request.getParameter("autoFinal")))
        );
        reservaDAO.actualizar(reserva);
    }
    
    private void mostrarReserva(HttpServletRequest request, HttpServletResponse response){
        reservaDAO = new ReservaDAO();
        Reserva reserva = reservaDAO.obtener(Integer.parseInt(request.getParameter("reservaId")));
        String fechaReserva = reservaDAO.fechaCadena(reserva.getFechaReserva());
        String fechaEntrega = reservaDAO.fechaCadena(reserva.getFechaEntrega());
        String fechaDevolucion = reservaDAO.fechaCadena(reserva.getFechaDevolucion());
        PrintWriter out = null;
        try {
            out = response.getWriter();
            JSONObject json = new JSONObject();
            json.put("usuario", reserva.getUsuario().getNombreUsuario());
            json.put("nombre", reserva.getUsuario().getNombre());
            json.put("apellido", reserva.getUsuario().getApellido());
            json.put("modelo", reserva.getAutomovil().getModelo().getMarca().toString());
            json.put("patente", reserva.getAutomovil().getPatente());
            json.put("precio", reserva.getAutomovil().getPrecio());
            json.put("cambios", reserva.getAutomovil().getCambios().toString());
            json.put("pasajeros", reserva.getAutomovil().getPasajeros());
            json.put("puertas", reserva.getAutomovil().getPuertas());
            json.put("fechaEntrega", fechaEntrega);
            json.put("fechaDevolucion", fechaDevolucion);
            json.put("fechaReserva", fechaReserva);
            json.put("ubicacion", reserva.getAutomovil().getSedeUbicacion().getDomicilio());
            out.print(json);
        } catch (IOException ex) {
            Logger.getLogger(ReservaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    private void cancelarReserva(HttpServletRequest request, HttpServletResponse response) {
        reservaDAO = new ReservaDAO();
        Reserva reserva = reservaDAO.obtener(Integer.parseInt(request.getParameter("reservaId")));
        
        Reserva rCancelada = new Reserva(
                reserva.getId(),
                reserva.getFechaReserva(),
                reserva.getFechaEntrega(),
                reserva.getFechaDevolucion(),
                new Date(new java.util.Date().getTime()),
                reserva.getAutomovil(),
                reserva.getUsuario()
        );
        reservaDAO.cancelarReserva(rCancelada);
    }
}
