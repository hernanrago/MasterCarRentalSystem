/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.model;

/**
 *
 * @author Hernán Rago
 */
public class Sede {

    private int id;
    private String domicilio;
    private String codigoPostal;
    private String ciudad;
    private String provincia;

    public Sede() {
    }

    public Sede(String domicilio, String codigoPostal, String ciudad, String provincia) {
        this.domicilio = domicilio;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.provincia = provincia;
    }

    public Sede(int id, String domicilio, String codigoPostal, String ciudad, String provincia) {
        this.id = id;
        this.domicilio = domicilio;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.provincia = provincia;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the domicilio
     */
    public String getDomicilio() {
        return domicilio;
    }

    /**
     * @param domicilio the domicilio to set
     */
    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    /**
     * @return the codigoPostal
     */
    public String getCodigoPostal() {
        return codigoPostal;
    }

    /**
     * @param codigoPostal the codigoPostal to set
     */
    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    /**
     * @return the ciudad
     */
    public String getCiudad() {
        return ciudad;
    }

    /**
     * @param ciudad the ciudad to set
     */
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    /**
     * @return the provincia
     */
    public String getProvincia() {
        return provincia;
    }

    /**
     * @param provincia the provincia to set
     */
    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

}
