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
import java.util.ArrayList;
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

    private static final String INSERT_MODELO = "INSERT INTO modelo (nombre, marca) VALUES (?,?);";
    private static final String SELECT_MODELO = "SELECT * FROM modelo WHERE id = ?";
    private static final String SELECT_MODELO_TODOS = "SELECT * FROM modelo";
    private static final String DELETE_MODELO = "DELETE FROM modelo WHERE id = ?";
    private static final String UPDATE_MODELO = "UPDATE modelo SET nombre = ? WHERE id= ?;";

    @Override
    public Modelo obtener(int id) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(SELECT_MODELO);
            preparedStatement.setInt(1, id);
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
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(SELECT_MODELO_TODOS);
            ResultSet rs = preparedStatement.executeQuery();
            List<Modelo> modelo = new ArrayList<>();
            while (rs.next()) {
                modelo.add(
                        new Modelo(
                                rs.getInt("id"),
                                rs.getString("nombre"),
                                Marca.valueOf(rs.getString("marca"))
                        ));
            }
            return modelo;

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public void crear(Modelo t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(INSERT_MODELO);
            preparedStatement.setString(1, t.getNombre());
            preparedStatement.setString(2, t.getMarca().name());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);

        }
    }

    @Override
    public void borrar(int id) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(DELETE_MODELO);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    @Override
    public void actualizar(Modelo t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(UPDATE_MODELO);
            preparedStatement.setString(1, t.getNombre());
            preparedStatement.setInt(2, t.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

}
