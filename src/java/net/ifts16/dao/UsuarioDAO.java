/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import net.ifts16.model.Usuario;

/**
 *
 * @author Hernán Rago
 */
public class UsuarioDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/master_car_rental_system";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "root";
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

    public void insertarUsuario(Usuario usuario) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException, UnsupportedEncodingException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getApellido());
            preparedStatement.setString(3, usuario.getNombreUsuario());
            preparedStatement.setString(4, encriptarContrasena(usuario.getContrasena()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    private String encriptarContrasena(String contrasena) throws NoSuchAlgorithmException, InvalidKeySpecException, UnsupportedEncodingException {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);

        KeySpec spec = new PBEKeySpec(contrasena.toCharArray(), salt, 65536, 128);
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        
        byte[] hash = factory.generateSecret(spec).getEncoded();
        
        return new String(hash, "UTF-8");
    }

}
