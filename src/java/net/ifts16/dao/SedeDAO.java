/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import net.ifts16.db.AdministradorBaseDatos;
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Sede;

/**
 *
 * @author Hernán Rago
 */
public class SedeDAO implements Dao<Sede> {

    private static final String INSERT_SEDE = "INSERT INTO sede (domicilio, codigo_postal, ciudad, provincia) VALUES (?, ?, ?, ?);";

    @Override
    public Sede obtener(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sede> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Sede t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(INSERT_SEDE);
            preparedStatement.setString(1, t.getDomicilio());
            preparedStatement.setString(2, t.getCodigoPostal());
            preparedStatement.setString(3, t.getCiudad());
            preparedStatement.setString(4, t.getProvincia());
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

}
