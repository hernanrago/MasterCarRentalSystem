<%-- 
    Document   : editarReserva
    Created on : 17/06/2019, 19:07:51
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.AutomovilDAO"%>
<%@page import="net.ifts16.model.Automovil"%>
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
                    <div class="list-group">
                        <input type="hidden" id="autoActual" name="autoActual" value="<%= reserva.getAutomovil().getId() %>"/>
                        <input type="hidden" id="id" name="id" value="<%= reserva.getId() %>"/>
                        <li class="list-group-item"><b>Nombre: </b><%= reserva.getUsuario().getNombre()%></li>
                        <li class="list-group-item"><b>Apellido: </b><%= reserva.getUsuario().getApellido()%></li>
                        <li class="list-group-item"><b>Usuario: </b><%= reserva.getUsuario().getNombreUsuario()%></li>
                        <li class="list-group-item"><b>Fecha Reserva: </b><%= reserva.getFechaReserva()%></li>
                        <li class="list-group-item"><b>Fecha Entrega: </b><%= reserva.getFechaEntrega()%></li>
                        <li class="list-group-item"><input id="fechaAlquiler2" value="<%= reserva.getFechaEntrega().toString() %>" name="fechaAlquiler2" placeholder="Escoger nueva fecha"/></li>
                        <li class="list-group-item"><b>Fecha Devolucion: </b><%= reserva.getFechaDevolucion()%></li>
                        <li class="list-group-item"><input id="fechaDevolucion2" value="<%= reserva.getFechaDevolucion()%>" name="fechaDevolucion2" placeholder="Escoger nueva fecha"/></li>
                        <li class="list-group-item">
                            <select class="form-control custom-select" id="autoFinal" name="autoFinal">
                                <option value="<%= reserva.getAutomovil().getId() %>">Vehiculos Disponibles</option>
                                <% List<Automovil> automovil = new AutomovilDAO().obtenerTodos();
                                    for (Automovil s : automovil) {
                                        if (s.isReservado() == false) {
                                %>
                                <% out.print("<option value=" + s.getId() + ">" + s.getModelo().getMarca() + s.getModelo().getNombre() + "</option>"); %>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </li>
                    </div>
                    <br>
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

<script type="text/javascript" >
    $(document).ready(function () {
        let today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
        $('#fechaAlquiler2').datepicker({
            uiLibrary: 'bootstrap4',
            locale: 'es-es',
            minDate: today,
            format: 'yyyy-mm-dd',
            footer: true,
            modal: true,
            header: true,
            maxDate: function () {
                return $('#fechaDevolucion2').val();
            }
        });
        $('#fechaDevolucion2').datepicker({
            uiLibrary: 'bootstrap4',
            locale: 'es-es',
            format: 'yyyy-mm-dd',
            footer: true,
            modal: true,
            header: true,
            minDate: function () {
                return $('#fechaAlquiler2').val();
            }
        });
    });
</script>