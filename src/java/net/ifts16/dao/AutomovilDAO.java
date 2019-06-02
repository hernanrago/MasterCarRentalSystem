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
import net.ifts16.enums.Cambios;
import net.ifts16.util.AdministradorBaseDatos;
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Automovil;

/**
 *
 * @author Hernán Rago
 */
public class AutomovilDAO implements Dao<Automovil> {

    private static final String INSERT_AUTOMOVIL = "INSERT INTO automovil (patente, modelo_id, pasajeros, puertas, precio, cambios, sede_radicacion_id, sede_ubicacion_id, reservado, alquilado) VALUES (?, ?, ?, ?,?,?,?,?,?,?);";
    private static final String SELECT_AUTOMOVIL = "SELECT * FROM automovil";
    private static final String SELECT_AUTOMOVIL_ID = "SELECT * FROM automovil WHERE id = ?";

    @Override
    public Automovil obtener(int id) {
        try (Connection connection = AdministradorBaseDatos.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_AUTOMOVIL_ID)) {
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.first()) {
                return new Automovil(
                        rs.getInt("id"),
                        rs.getString("patente"),
                        new ModeloDAO().obtener(rs.getInt("modelo_id")),
                        rs.getInt("pasajeros"),
                        rs.getInt("puertas"),
                        rs.getBigDecimal("precio"),
                        Cambios.valueOf(rs.getString("cambios")),
                        new SedeDAO().obtener(rs.getInt("sede_radicacion_id")),
                        new SedeDAO().obtener(rs.getInt("sede_ubicacion_id")),
                        rs.getBoolean("reservado"),
                        rs.getBoolean("alquilado")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public List<Automovil> obtenerTodos() {
        try (Connection conn = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement ps = conn.prepareStatement(SELECT_AUTOMOVIL);
            ResultSet rs = ps.executeQuery();
            List<Automovil> automoviles = new ArrayList<>();
            while (rs.next()) {
                automoviles.add(new Automovil(
                        rs.getInt("id"),
                        rs.getString("patente"),
                        new ModeloDAO().obtener(rs.getInt("modelo_id")),
                        rs.getInt("pasajeros"),
                        rs.getInt("puertas"),
                        rs.getBigDecimal("precio"),
                        Cambios.valueOf(rs.getString("cambios")),
                        new SedeDAO().obtener(rs.getInt("sede_radicacion_id")),
                        new SedeDAO().obtener(rs.getInt("sede_ubicacion_id")),
                        rs.getBoolean("reservado"),
                        rs.getBoolean("alquilado")
                ));
            }
            return automoviles;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public void crear(Automovil t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(INSERT_AUTOMOVIL);
            preparedStatement.setString(1, t.getPatente());
            preparedStatement.setInt(2, t.getModelo().getId());
            preparedStatement.setInt(3, t.getPasajeros());
            preparedStatement.setInt(4, t.getPuertas());
            preparedStatement.setBigDecimal(5, t.getPrecio());
            preparedStatement.setString(6, t.getCambios().name());
            preparedStatement.setInt(7, t.getSedeRadicacion().getId());
            preparedStatement.setInt(8, t.getSedeUbicacion().getId());
            preparedStatement.setBoolean(9, t.isReservado());
            preparedStatement.setBoolean(10, t.isReservado());
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
