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
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Reserva;
import net.ifts16.util.AdministradorBaseDatos;

/**
 *
 * @author Hernán Rago
 */
public class ReservaDAO implements Dao<Reserva> {

    private static final String INSERT_RESERVA = "INSERT INTO reserva (fecha_reserva, automovil_id, usuario_id) VALUES (?, ?, ?);";

    @Override
    public Reserva obtener(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Reserva> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void crear(Reserva t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(INSERT_RESERVA);
            preparedStatement.setDate(1, t.getFechaReserva());
            preparedStatement.setInt(2, t.getAutomovil().getId());
            preparedStatement.setInt(3, t.getUsuario().getId());

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
