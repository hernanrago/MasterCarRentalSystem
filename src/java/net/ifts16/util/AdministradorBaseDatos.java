/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hernán Rago
 */
public class AdministradorBaseDatos {

    private static Connection connection;
    
    private static final String URL = "jdbc:mysql://localhost:3306/master_car_rental_system";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";

    public static Connection obtenerConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace(System.err);
        }
        // TODO Auto-generated catch block
        return connection;
    }
}
