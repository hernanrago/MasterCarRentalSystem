/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.interfaces;

import java.util.List;

/**
 *
 * @author Hernán Rago
 * @param <T>
 */
public interface Dao<T> {
    
    
    
    T obtener(int id);

    List<T> obtenerTodos();

    void crear(T t);

    void actualizar(T t);

    void borrar(int id);
}
