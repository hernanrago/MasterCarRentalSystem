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
import java.util.ArrayList;
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

    private static final String INSERT_USUARIO = "INSERT INTO usuario (nombre, apellido, nombre_usuario, contrasena, rol) VALUES (?, ?, ?, ?, ?);";
    private static final String SELECT_USUARIO = "SELECT * from usuario";
    private static final String SELECT_USUARIO_ID = "SELECT * from usuario where id = ?";
    private static final String SELECT_USUARIO_NOMBRE_USUARIO_CONTRASENA = "SELECT * from usuario where nombre_usuario = ?";
    private static final String UPDATE_USUARIO = "UPDATE usuario SET nombre = ?, apellido = ?, nombre_usuario = ? , rol = ? WHERE id = ?";
    private static final String DELETE_USUARIO = "DELETE FROM usuario WHERE id = ?";

    public Usuario identificar(String usuario, String contrasena) {
        try (Connection c = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement ps = c.prepareStatement(SELECT_USUARIO_NOMBRE_USUARIO_CONTRASENA);
            ps.setString(1, usuario);
//            ps.setString(2, encriptarContrasena(contrasena));

            ResultSet rs = ps.executeQuery();

            if (rs.first()) {
                Usuario u = new Usuario();
                u.setNombreUsuario(usuario);
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public Usuario obtener(int id) {
        try (Connection connection = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USUARIO_ID)) {
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.first()) {
                return new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("nombre_usuario"),
                        rs.getString("contrasena"),
                        rs.getString("rol"));
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public List<Usuario> obtenerTodos() {
        try (Connection c = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement ps = c.prepareStatement(SELECT_USUARIO)) {
            ResultSet rs = ps.executeQuery();
            List<Usuario> usuarios = new ArrayList<>();
            while (rs.next()) {
                usuarios.add(new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("nombre_usuario"),
                        rs.getString("contrasena"),
                        rs.getString("rol"))
                );
            }
            return usuarios;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return null;
        }
    }

    @Override
    public void crear(Usuario t) {
        try (Connection connection = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USUARIO)) {
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
    public void borrar(int id) {

        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(DELETE_USUARIO);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
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

    @Override
    public void actualizar(Usuario t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(UPDATE_USUARIO);
            preparedStatement.setString(1, t.getNombre());
            preparedStatement.setString(2, t.getApellido());
            preparedStatement.setString(3, t.getNombreUsuario());
            preparedStatement.setString(4, t.getRol().name());
            preparedStatement.setInt(5, t.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

}
