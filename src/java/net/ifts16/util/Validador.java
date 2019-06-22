/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ifts16.util;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.ConstraintViolation;
import javax.validation.Path;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 *
 * @author Hernán Rago
 * @param <T>
 */
public class Validador {
    
    public static <T> Map<Path, List<String>> validar(T t){
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        
        return validator.validate(t).stream().collect(
                    Collectors.groupingBy(ConstraintViolation<T>::getPropertyPath,
                        Collectors.mapping(ConstraintViolation<T>::getMessage, Collectors.toList())
                    )
                );
    }
}
