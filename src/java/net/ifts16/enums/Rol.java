/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.enums;

/**
 *
 * @author Hernán Rago
 */
public enum Rol {
    ADMINISTRADOR {
        @Override
        public String toString() {
            return "Administrador";
        }
    },
    OPERADOR {
        @Override
        public String toString() {
            return "Operador";
        }
    },
    CLIENTE{
                @Override
        public String toString() {
            return "Cliente";
        }
    },
}
