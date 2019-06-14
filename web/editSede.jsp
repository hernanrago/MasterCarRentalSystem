<%-- 
    Document   : editSede
    Created on : 10/06/2019, 08:37:47
    Author     : vitor
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <form class="form-signin">
                    <input type="hidden" name="comando" value="actualizar"/>
                    <h1>Editar Sede</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Sede sede = (Sede)request.getAttribute("sede"); %>
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= sede.getId()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="domicilio" name="domicilio" aria-describedby="domicilio" value="<%= sede.getDomicilio()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" aria-describedby="codigoPostal" value="<%= sede.getCodigoPostal()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" name="ciudad" aria-describedby="ciudad" value="<%= sede.getCiudad()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="provincia" name="provincia" value="<%= sede.getProvincia()%>" required="required">
                    </div>
                    <input id="editar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#edicionConfirmadaModal" value="Editar">
                </form>
                
                <div class="modal fade" id="edicionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="edicionConfirmadaModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Sede editada</p>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="aceptarEditarButton">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="featurette-divider">
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>

<script>
    $('#editar').click(function () {
        $.post('Sede', $('.form-signin').serialize())
                .done(function () {
                    $('#aceptarEditarButton').click(function () {
                        location.href = 'Sede';
                    });
                    $('#registroConfirmadoModal').modal('toggle');
                });
    });
</script>
