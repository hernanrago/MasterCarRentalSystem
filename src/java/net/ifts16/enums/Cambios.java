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
public enum Cambios {
    AUTOMATICO {
        @Override
        public String toString() {
            return "Automático";
        }
    },
    MANUAL {
        @Override
        public String toString() {
            return "Manual";
        }
    },

}
