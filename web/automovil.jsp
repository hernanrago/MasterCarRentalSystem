<%-- 
    Document   : registracion
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page import="net.ifts16.enums.Marca"%>
<%@page import="net.ifts16.enums.Cambios"%>
<%@page import="net.ifts16.dao.AutomovilDAO"%>
<%@page import="net.ifts16.model.Automovil"%>
<%@page import="net.ifts16.dao.ModeloDAO"%>
<%@page import="net.ifts16.model.Modelo"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
            <form class="form-signin" action="Automoviles" method="post">
                <h1>Ingresar Automovil</h1>
                <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                <input type="hidden" name="comando" value="ingresarAutomovil"/>
                <div class="form-group">
                    <input type="text" class="form-control" id="patente" name="patente" aria-describedby="patente" placeholder="Ingresar Patente" required="required">
                </div>
                <select class="form-group custom-select" id="modelo" name="modelo">
                    <option>Modelo</option>
                    <% List<Modelo> modelos = new ModeloDAO().obtenerTodos();
                        for (Modelo s : modelos) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getMarca().toString() + " - " + s.getNombre() + "</option>"); %>
                    <%
                        }
                    %>
                </select>
                <div class="form-group">
                    <input type="text" class="form-control" id="pasajeros" name="pasajeros" aria-describedby="pasajeros" placeholder="Ingresar cantidad pasajeros" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="puertas" name="puertas" aria-describedby="puertas" placeholder="Ingresar cantidad de puertas" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="precio" name="precio" placeholder="Ingresar precio" required="precio">
                </div>
                <select class="form-group custom-select" id="cambios" name="cambios">
                    <option>Tipo de Caja</option>
                    <% for(Cambios c : Cambios.values()){
                    %>    
                       <% out.print("<option value=" + c.name() + ">" + c.toString() + "</option>"); %> 
                    <% } %>
                </select>
                <select class="form-group custom-select" id="sedeRadicacion" name="sedeRadicacion">
                    <option>Sede Radicacion</option>
                    <% List<Sede> sedes = new SedeDAO().obtenerTodos();
                        for (Sede s : sedes) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                    <%
                        }
                    %>
                </select>
                <select class="form-group custom-select"id="sedeUbicacion" name="sedeUbicacion">
                    <option>Sede Ubicacion</option>
                    <% List<Sede> sedes1 = new SedeDAO().obtenerTodos();
                        for (Sede s : sedes1) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                    <%
                        }
                    %>
                </select>
                <input id="registrar" type="button" class="btn btn-primary" value="Registrar"/>
                <a href="Modelo" class="btn btn-secondary">Ingresar Modelo</a>
            </form>
            <hr class="featurette-divider">
            </div>
        </div>
                
        <div class="modal fade" id="registroConfirmadoModal" tabindex="-1" role="dialog" aria-labelledby="registroConfirmadoModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <p>Vehiculo Registrado Correctamente</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="aceptarRegistroButton">Aceptar</button>
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
        $.post('Automoviles', $('.form-signin').serialize())
                .done(function () {
                    $('#aceptarRegistroButton').click(function () {
                        location.href = 'Automoviles';
                    });
                    $('#registroConfirmadoModal').modal('toggle');
                });
    });
</script>