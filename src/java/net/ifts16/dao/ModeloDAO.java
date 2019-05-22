/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import net.ifts16.util.AdministradorBaseDatos;
import net.ifts16.enums.Marca;
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Modelo;

/**
 *
 * @author Hernán Rago
 */
public class ModeloDAO implements Dao<Modelo> {

    private static final String SELECT_MODELO = "SELECT * FROM modelo WHERE id = ?";

    @Override
    public Modelo obtener(int id) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(SELECT_MODELO);
            preparedStatement.setInt(id, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Modelo modelo = new Modelo();
            while (resultSet.next()) {
                modelo.setId(resultSet.getInt("id"));
                modelo.setMarca(Marca.valueOf(resultSet.getString("marca")));
                modelo.setNombre(resultSet.getString("nombre"));
            }
            return modelo;

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public List<Modelo> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Modelo t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
