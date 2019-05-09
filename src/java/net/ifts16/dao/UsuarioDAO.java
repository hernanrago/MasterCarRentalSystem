/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import net.ifts16.modelo.Usuario;

/**
 *
 * @author Hernán Rago
 */
public class UsuarioDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/master_car_rental_system";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_USERS_SQL = "INSERT INTO usuario (nombre, apellido, usuario, contrasena) VALUES (?, ?, ?, ?);";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace(System.err);
        }
        // TODO Auto-generated catch block
        return connection;
    }
    
        public void insertarUsuario(Usuario usuario) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getApellido());
            preparedStatement.setString(3, usuario.getNombreUsuario());
            preparedStatement.setString(4, usuario.getContrasena());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

}
