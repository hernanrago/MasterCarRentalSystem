/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.model;

import net.ifts16.enums.Marca;

/**
 *
 * @author Hernán Rago
 */
public class Modelo {
    private int id;
    private String nombre;
    private Marca marca;

    public Modelo() {
    }
    
        public Modelo(String nombre, Marca marca) {
        this.nombre = nombre;
        this.marca = marca;
    }

    public Modelo(int id, String nombre, Marca marca) {
        this.id = id;
        this.nombre = nombre;
        this.marca = marca;
    }
    
    public Modelo(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the marca
     */
    public Marca getMarca() {
        return marca;
    }

    /**
     * @param marca the marca to set
     */
    public void setMarca(Marca marca) {
        this.marca = marca;
    }
}
