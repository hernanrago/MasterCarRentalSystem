/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author h3ln4n_l33
 */
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		
		if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || 
				password.isEmpty() || address.isEmpty() || contact.isEmpty())
		{
			RequestDispatcher req = request.getRequestDispatcher("register_1.jsp");
			req.include(request, response);
		}
		else
		{
			RequestDispatcher req = request.getRequestDispatcher("register_2.jsp");
			req.forward(request, response);
		}
	}
 
}