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
import net.ifts16.interfaces.Dao;
import net.ifts16.model.Automovil;
import net.ifts16.model.Reserva;
import net.ifts16.model.Usuario;
import net.ifts16.util.AdministradorBaseDatos;

/**
 *
 * @author Hernán Rago
 */
public class ReservaDAO implements Dao<Reserva> {

    private static final String INSERT_RESERVA = "INSERT INTO reserva (fecha_reserva, automovil_id, usuario_id) VALUES (?, ?, ?);";
    private static final String SELECT_RESERVA = "SELECT * FROM reserva";
    private static final String SELECT_RESERVA_ID = "SELECT * FROM reserva WHERE id = ?";
    private static final String SELECT_RESERVA_UBICACION = "SELECT * FROM reserva where automovil_id = ?";
    private static final String DELETE_RESERVA = "DELETE FROM reserva WHERE id = ?";
    private static final String UPDATE_RESERVA = "UPDATE reserva SET fecha_reserva = ?, fecha_cancelacion = ?, automovil_id = ?, usuario_id = ? WHERE id = ?";
    private AutomovilDAO automovilDAO;
    private UsuarioDAO usuarioDAO;
    
    
    @Override
    public Reserva obtener(int id) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement ps = conexion.prepareStatement(SELECT_RESERVA_ID);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            automovilDAO =  new AutomovilDAO();
            usuarioDAO = new UsuarioDAO();
            Reserva reserva = new Reserva();
            while (rs.next()) {
                reserva.setId(rs.getInt("id"));
                reserva.setFechaReserva(rs.getDate("fecha_reserva"));        
                reserva.setFechaCancelacion(rs.getDate("fecha_cancelacion"));         
                reserva.setAutomovil(automovilDAO.obtener(rs.getInt("automovil_id")));        
                reserva.setUsuario(usuarioDAO.obtener(rs.getInt("usuario_id")));        
            }
            return reserva;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public List<Reserva> obtenerTodos() {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(SELECT_RESERVA);
            ResultSet rs = preparedStatement.executeQuery();
            automovilDAO = new AutomovilDAO();
            usuarioDAO = new UsuarioDAO();
            List<Reserva> reservas = new ArrayList<>();
            while (rs.next()) {
                reservas.add(
                        new Reserva(
                                rs.getInt("id"),
                                rs.getDate("fecha_reserva"),
                                rs.getDate("fecha_cancelacion"),
                                automovilDAO.obtener(rs.getInt("automovil_id")),
                                usuarioDAO.obtener(rs.getInt("usuario_id"))
                        ));
            }
            return reservas;

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public List<Reserva> obtenerReservaUbicacion(String sede){
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement ps = conexion.prepareStatement(SELECT_RESERVA_UBICACION);
            ps.setString(1, sede);
            ResultSet rs = ps.executeQuery();
            automovilDAO =  new AutomovilDAO();
            usuarioDAO = new UsuarioDAO();
            List<Reserva> reservas = new ArrayList<>();
            while (rs.next()) {
                reservas.add(
                    new Reserva(
                        rs.getInt("id"),
                        rs.getDate("fecha_reserva"),
                        rs.getDate("fecha_cancelacion"), 
                        automovilDAO.obtener(rs.getInt("automovil_id")),
                        usuarioDAO.obtener(rs.getInt("usuario_id"))
                    ));
            }
            return reservas;

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public void crear(Reserva t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(INSERT_RESERVA);
            preparedStatement.setDate(1, t.getFechaReserva());
            preparedStatement.setInt(2, t.getAutomovil().getId());
            preparedStatement.setInt(3, t.getUsuario().getId());

            int x = preparedStatement.executeUpdate();
            System.out.println(x);
            
            automovilDAO = new AutomovilDAO();
            automovilDAO.reservar(t.getAutomovil().getId());

        } catch (SQLException e) {
            e.printStackTrace(System.out);

        }
    }

    @Override
    public void borrar(int id) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(DELETE_RESERVA);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    @Override
    public void actualizar(Reserva t) {
        try (Connection conexion = AdministradorBaseDatos.obtenerConexion()) {
            PreparedStatement preparedStatement = conexion.prepareStatement(UPDATE_RESERVA);
            preparedStatement.setDate(1, t.getFechaReserva());
            preparedStatement.setDate(2, t.getFechaCancelacion());
            preparedStatement.setInt(3, t.getAutomovil().getId());
            preparedStatement.setInt(4, t.getUsuario().getId());
            preparedStatement.setInt(5, t.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

}
