<%-- 
    Document   : nuevo-usuario
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="net.ifts16.enums.Rol"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <form class="form-signin" action="Usuario" method="post">
                <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                <input type="hidden" name="comando" value="crear"/>
                <div class="form-group">
                    <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre" placeholder="Ingresar nombre" required="required">
                    <div class="invalid-feedback" nombreErrores></div>
                </div>
                    
                <div class="form-group">
                    <input type="text" class="form-control" id="apellido" name="apellido" aria-describedby="apellido" placeholder="Ingresar apellido" required="required">
                    <div class="invalid-feedback" apellidoErrores></div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario" required="required">
                    <div class="invalid-feedback" nombreUsuarioErrores>
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresar contraseña" required="required">
                    <div class="invalid-feedback" contrasenaErrores>
                    </div>
                </div>
                <div class="form-group">
                    <select name="rol" class="custom-select">
                        <option selected>Rol</option>
                        <%                                for (Rol r : Rol.values()) {
                                out.print("<option value=" + r.name() + ">" + r.toString() + "</option>");
                            }
                        %>        
                    </select>
                </div>                 
                <input id="registrar" type="button" class="btn btn-primary" value="Registrar"/>
            </form>
            <hr class="featurette-divider">
        </div>

        <!--Modal registro confirmado-->
        <div class="modal fade" id="registroConfirmadoModal" tabindex="-1" role="dialog" aria-labelledby="registroConfirmadoModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <p>Usuario registrado correctamente</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="aceptarRegistroButton">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal errores-->
        <div class="modal fade" id="erroresModal" tabindex="-1" role="dialog" aria-labelledby="erroresModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <ul id="errores">

                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="aceptarErroresButton">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.html" %>
</body>
</html>

<script>
    $('#registrar').click(function () {
        $.post('Usuario', $('.form-signin').serialize())
                .done(function (msg) {
                    if (msg.length !== 0) {
                        let infe = document.querySelectorAll('.invalid-feedback');
                        for(let item in infe){
                            infe[item].innerHTML = '';
                        };
                        
//                        let foco = document.querySelectorAll('.form-control');
//                        for (let item in foco){
//                            if(foco[item].classList.contains('is-invalid')){
//                                foco[item].classList.remove('is-invalid');
//                            }
//                        }
                        for (e in msg) {
                            document.querySelector('#' + e).classList.add('is-invalid');
                            console.log("e: " + e);
                            console.log('msg[e]: '+ msg[e]);
                            
                            let errores = '<ul>';                
                            for(item in msg[e]){
                                errores += '<li>'+ msg[e][item]+'</li>'; 
                            };
                            errores += '</ul>';
                        document.querySelector('[' + e + 'Errores]').innerHTML = errores;
                        };
                        

                    } else {

                        $('#aceptarRegistroButton').click(function () {
                            location.href = 'Index';
                        });
                        $('#registroConfirmadoModal').modal('toggle');
                    }

                });
    });
</script>
