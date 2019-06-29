/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.model;

import java.math.BigDecimal;
import net.ifts16.enums.Cambios;

/**
 *
 * @author Hernán Rago
 */
public class Automovil {

    private int id;
    private String patente;
    private Modelo modelo;
    private int pasajeros;
    private int puertas;
    private BigDecimal precio;
    private Cambios cambios;
    private Sede sedeRadicacion;
    private Sede sedeUbicacion;
    private boolean reservado;
    private boolean alquilado;

    public Automovil() {
    }

    public Automovil(String patente, Modelo modelo, int pasajeros, int puertas,
            BigDecimal precio, Cambios cambios, Sede sedeRadicacion,
            Sede sedeUbicacion, boolean reservado, boolean alquilado) {
        this.patente = patente;
        this.modelo = modelo;
        this.pasajeros = pasajeros;
        this.puertas = puertas;
        this.precio = precio;
        this.cambios = cambios;
        this.sedeRadicacion = sedeRadicacion;
        this.sedeUbicacion = sedeUbicacion;
        this.reservado = reservado;
        this.alquilado = alquilado;
    }

    public Automovil(int id, String patente, Modelo modelo, int pasajeros, int puertas,
            BigDecimal precio, Cambios cambios, Sede sedeRadicacion,
            Sede sedeUbicacion, boolean reservado, boolean alquilado) {
        this.id = id;
        this.patente = patente;
        this.modelo = modelo;
        this.pasajeros = pasajeros;
        this.puertas = puertas;
        this.precio = precio;
        this.cambios = cambios;
        this.sedeRadicacion = sedeRadicacion;
        this.sedeUbicacion = sedeUbicacion;
        this.reservado = reservado;
        this.alquilado = alquilado;
    }
    
    public Automovil(int id, String patente, Modelo modelo, int pasajeros, int puertas,
            BigDecimal precio, Cambios cambios, Sede sedeRadicacion,
            Sede sedeUbicacion) {
        this.id = id;
        this.patente = patente;
        this.modelo = modelo;
        this.pasajeros = pasajeros;
        this.puertas = puertas;
        this.precio = precio;
        this.cambios = cambios;
        this.sedeRadicacion = sedeRadicacion;
        this.sedeUbicacion = sedeUbicacion;
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @return the patente
     */
    public String getPatente() {
        return patente;
    }

    /**
     * @param patente the patente to set
     */
    public void setPatente(String patente) {
        this.patente = patente;
    }

    /**
     * @return the modelo
     */
    public Modelo getModelo() {
        return modelo;
    }

    /**
     * @param modelo the modelo to set
     */
    public void setModelo(Modelo modelo) {
        this.modelo = modelo;
    }

    /**
     * @return the pasajeros
     */
    public int getPasajeros() {
        return pasajeros;
    }

    /**
     * @param pasajeros the pasajeros to set
     */
    public void setPasajeros(int pasajeros) {
        this.pasajeros = pasajeros;
    }

    /**
     * @return the puertas
     */
    public int getPuertas() {
        return puertas;
    }

    /**
     * @param puertas the puertas to set
     */
    public void setPuertas(int puertas) {
        this.puertas = puertas;
    }

    /**
     * @return the precio
     */
    public BigDecimal getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    /**
     * @return the cambios
     */
    public Cambios getCambios() {
        return cambios;
    }

    /**
     * @param cambios the cambios to set
     */
    public void setCambios(Cambios cambios) {
        this.cambios = cambios;
    }

    /**
     * @return the sedeRadicacion
     */
    public Sede getSedeRadicacion() {
        return sedeRadicacion;
    }

    /**
     * @param sedeRadicacion the sedeRadicacion to set
     */
    public void setSedeRadicacion(Sede sedeRadicacion) {
        this.sedeRadicacion = sedeRadicacion;
    }

    /**
     * @return the sedeUbicacion
     */
    public Sede getSedeUbicacion() {
        return sedeUbicacion;
    }

    /**
     * @param sedeUbicacion the sedeUbicacion to set
     */
    public void setSedeUbicacion(Sede sedeUbicacion) {
        this.sedeUbicacion = sedeUbicacion;
    }

    /**
     * @return the reservado
     */
    public boolean isReservado() {
        return reservado;
    }

    /**
     * @param reservado the reservado to set
     */
    public void setReservado(boolean reservado) {
        this.reservado = reservado;
    }

    /**
     * @return the alquilado
     */
    public boolean isAlquilado() {
        return alquilado;
    }

    /**
     * @param alquilado the alquilado to set
     */
    public void setAlquilado(boolean alquilado) {
        this.alquilado = alquilado;
    }

}
