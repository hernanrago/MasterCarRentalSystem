/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.model;

import net.ifts16.enums.Rol;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Hernán Rago
 */
public class Usuario {

    private int id;

    @NotEmpty(message = "El campo nombre no puede estar vacío")
    @Length(min = 2,
            max = 50,
            message = "El campo nombre debe tener entre {min} y {max} caracteres")
    private String nombre;

    @NotEmpty(message = "El campo apellido no puede estar vacío")
    @Length(min = 2,
            max = 50,
            message = "El campo apellido debe tener entre {min} y {max} caracteres")
    private String apellido;

    @NotEmpty(message = "El campo nombre de usuario no puede estar vacío")
    @Length(min = 2,
            max = 50,
            message = "El campo nombre de usuario debe tener entre {min} y {max} caracteres")
    private String nombreUsuario;

    @NotEmpty(message = "El campo contraseña no puede estar vacío")
    @Length(min = 2,
            max = 50,
            message = "El campo contraseña debe tener entre {min} y {max} caracteres")
    private String contrasena;
    
    private Rol rol;

    public Usuario() {
    }

    public Usuario(String nombre, String apellido, String nombreUsuario, String contrasena, String rol) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
        this.rol = Rol.valueOf(rol);
    }

    public Usuario(int id, String nombre, String apellido, String nombreUsuario, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nombreUsuario = nombreUsuario;
        this.rol = Rol.valueOf(rol);
    }

    public Usuario(int id, String nombre, String apellido, String nombreUsuario, String contrasena, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
        this.rol = Rol.valueOf(rol);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the nombreUsuario
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * @param nombreUsuario the nombreUsuario to set
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * @return the contrasena
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * @param contrasena the contrasena to set
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     * @return the rol
     */
    public Rol getRol() {
        return rol;
    }

    /**
     * @param rol the rol to set
     */
    public void setRol(Rol rol) {
        this.rol = rol;
    }
}
