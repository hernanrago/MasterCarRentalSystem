<%-- 
    Document   : registracion
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <h1>Alta de Sede</h1>
                <form class="form-signin">
                    <input type="hidden" name="comando" value="crear"/>
                    <h1>Registrar Sede</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <div class="form-group">
                        <input type="text" class="form-control" id="domicilio" name="domicilio" aria-describedby="domicilio" placeholder="Domicilio" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" aria-describedby="codigoPostal" placeholder="Codigo Postal" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" name="ciudad" aria-describedby="ciudad" placeholder="Ciudad" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia" required="required">
                    </div>
                    <input type="button" id="registrarSede" class="btn btn-primary" value="Registrar">
                </form>
                
                <div class="modal fade" id="registroConfirmadoModal" tabindex="-1" role="dialog" aria-labelledby="registroConfirmadoModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Sede Registrada Correctamente</p>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="aceptarRegistroButton">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>

<script>
    $('#registrarSede').click(function () {
        $.post('Sede', $('.form-signin').serialize())
                .done(function () {
                    $('#aceptarRegistroButton').click(function () {
                        location.href = 'Sede';
                    });
                    $('#registroConfirmadoModal').modal('toggle');
                });
    });
</script>