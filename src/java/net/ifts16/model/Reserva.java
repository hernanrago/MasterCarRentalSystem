/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.model;

import java.sql.Date;

/**
 *
 * @author Hernán Rago
 */
public class Reserva {
    private int id;
    private Date fechaReserva;
    private Date fechaEntrega;
    private Date fechaDevolucion;
    private Date fechaCancelacion;
    private Automovil automovil;
    private Usuario usuario;

    public Reserva() {
    }
    
    public Reserva(Date fechaReserva, Date fechaEntrega, Date fechaDevolucion, Automovil automovil, Usuario usuario) {
        this.fechaReserva = fechaReserva;
        this.fechaEntrega = fechaEntrega;
        this.fechaDevolucion = fechaDevolucion;
        this.automovil = automovil;
        this.usuario = usuario;
    }

    public Reserva(int id, Date fechaReserva, Date fechaEntrega, Date fechaDevolucion, Date fechaCancelacion, Automovil automovil, Usuario usuario) {
        this.id = id;
        this.fechaReserva = fechaReserva;
        this.fechaEntrega = fechaEntrega;
        this.fechaDevolucion = fechaDevolucion;
        this.fechaCancelacion = fechaCancelacion;
        this.automovil = automovil;
        this.usuario = usuario;
    }
    
    public Reserva(int id, Date fechaEntrega, Date fechaDevolucion, Automovil automovil) {
        this.id = id;
        this.fechaEntrega = fechaEntrega;
        this.fechaDevolucion = fechaDevolucion;
        this.automovil = automovil;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the fechaReserva
     */
    public Date getFechaReserva() {
        return fechaReserva;
    }

    /**
     * @param fechaReserva the fechaReserva to set
     */
    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    /**
     * @return the fechaEntrega
     */
    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    /**
     * @param fechaEntrega the fechaEntrega to set
     */
    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    /**
     * @return the fechaDevolucion
     */
    public Date getFechaDevolucion() {
        return fechaDevolucion;
    }

    /**
     * @param fechaDevolucion the fechaDevolucion to set
     */
    public void setFechaDevolucion(Date fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }

    /**
     * @return the fechaCancelacion
     */
    public Date getFechaCancelacion() {
        return fechaCancelacion;
    }

    /**
     * @param fechaCancelacion the fechaCancelacion to set
     */
    public void setFechaCancelacion(Date fechaCancelacion) {
        this.fechaCancelacion = fechaCancelacion;
    }

    /**
     * @return the automovil
     */
    public Automovil getAutomovil() {
        return automovil;
    }

    /**
     * @param automovil the automovil to set
     */
    public void setAutomovil(Automovil automovil) {
        this.automovil = automovil;
    }

    /**
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
