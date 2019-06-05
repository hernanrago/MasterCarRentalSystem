/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                
        Reserva reserva = new Reserva(
                new Date(new java.util.Date().getTime()),
                new AutomovilDAO().obtener(Integer.parseInt(request.getParameter("automovilId"))),
//                new AutomovilDAO().obtener(1),
//                new UsuarioDAO().oUbtener(Integer.parseInt(request.getParameter("usuario"))) 
                new UsuarioDAO().obtener(1) 
        );
        
        reservaDAO = new ReservaDAO();
        reservaDAO.crear(reserva);        
        
        try (PrintWriter out = response.getWriter()) {   
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReservaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            response.setStatus(200);
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

}