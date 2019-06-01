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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Usuario;
import net.ifts16.util.AdministradorBaseDatos;

/**
 *
 * @author Hernán Rago
 */
public class UsuarioDAO implements Dao<Usuario> {

    private static final String INSERT_USER = "INSERT INTO usuario (nombre, apellido, nombre_usuario, contrasena, rol) VALUES (?, ?, ?, ?, ?);";
    private static final String SELECT_USER = "SELECT * from usuario where id = ?";

    @Override
    public Usuario obtener(int id) {
        try (Connection connection = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setInt(1, id);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            return new Usuario(
                    rs.getString("nombre"),
                    rs.getString("apellido"),
            rs.getString("nombre_usuario"),
            rs.getString("contrasena"),
            rs.getString("rol"));
            
            
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public List<Usuario> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Usuario t) {
        try (Connection connection = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, t.getNombre());
            preparedStatement.setString(2, t.getApellido());
            preparedStatement.setString(3, t.getNombreUsuario());
            preparedStatement.setString(4, encriptarContrasena(t.getContrasena()));
            preparedStatement.setString(5, t.getRol().name());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    @Override
    public void actualizar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void borrar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private String encriptarContrasena(String contrasena) {
        try {
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[16];
            random.nextBytes(salt);

            KeySpec spec = new PBEKeySpec(contrasena.toCharArray(), salt, 65536, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

            byte[] hash = factory.generateSecret(spec).getEncoded();

            return new String(hash, "UTF-8");

        } catch (NoSuchAlgorithmException | InvalidKeySpecException | UnsupportedEncodingException e) {
            e.printStackTrace(System.out);

        }
        return null;
    }

}
