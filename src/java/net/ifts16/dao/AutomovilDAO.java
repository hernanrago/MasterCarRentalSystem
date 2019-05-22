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
import net.ifts16.model.Automovil;

/**
 *
 * @author Hernán Rago
 */
public class AutomovilDAO implements Dao<Automovil> {

    private static final String INSERT_AUTOMOVIL = "INSERT INTO automovil (patente, modelo, pasajeros, puertas, precio, cambios, sede_radicacion, sede_ubicacion, reservado, alquilado) VALUES (?, ?, ?, ?,?,?,?,?,?,?);";

    @Override
    public Automovil obtener(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Automovil> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
