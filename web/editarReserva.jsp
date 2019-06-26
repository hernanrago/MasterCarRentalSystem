<%-- 
    Document   : editarReserva
    Created on : 17/06/2019, 19:07:51
    Author     : vitor
--%>

<%@page import="net.ifts16.model.Reserva"%>
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
                    <h1>Editar Reserva</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Reserva reserva = (Reserva)request.getAttribute("reserva"); %>
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= reserva.getId()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="usuario" name="usuario" aria-describedby="usuario" value="<%= reserva.getUsuario().getNombreUsuario()%>" readonly="usuario">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre" value="<%= reserva.getUsuario().getNombre()%>" readonly="nombre">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellido" name="apellido" aria-describedby="apellido" value="<%= reserva.getUsuario().getApellido()%>" readonly="apellido">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="reserva" name="reserva" placeholder="<%= reserva.getFechaReserva()%>" readonly="reserva">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="entrega" name="entrega" placeholder="<%= reserva.getFechaCancelacion()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="modelo" name="modelo" aria-describedby="modelo" value="<%= reserva.getAutomovil().getModelo().getMarca()%>" readonly="modelo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="sede" name="sede" aria-describedby="sede" value="<%= reserva.getAutomovil().getSedeUbicacion().getDomicilio()%>" readonly="sede">
                    </div>
                    <input id="editar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#edicionConfirmadaModal" value="Editar">
                </form>
                
                <div class="modal fade" id="edicionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="edicionConfirmadaModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Reserva editada</p>
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
        $.post('Reserva', $('.form-signin').serialize())
                .done(function () {
                    $('#aceptarEditarButton').click(function () {
                        location.href = 'Reserva';
                    });
                    $('#registroConfirmadoModal').modal('toggle');
                });
    });
</script>