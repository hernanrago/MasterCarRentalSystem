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
    private Date fechaCancelacion;
    private Automovil automovil;
    private Usuario usuario;

    public Reserva() {
    }
    
        public Reserva(Date fechaReserva, Automovil automovil, Usuario usuario) {
        this.fechaReserva = fechaReserva;
        this.automovil = automovil;
        this.usuario = usuario;
    }

    public Reserva(int id, Date fechaReserva, Date fechaCancelacion, Automovil automovil, Usuario usuario) {
        this.id = id;
        this.fechaReserva = fechaReserva;
        this.fechaCancelacion = fechaCancelacion;
        this.automovil = automovil;
        this.usuario = usuario;
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
