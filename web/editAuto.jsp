<%-- 
    Document   : editSede
    Created on : 10/06/2019, 08:37:47
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.ModeloDAO"%>
<%@page import="net.ifts16.model.Modelo"%>
<%@page import="net.ifts16.enums.Cambios"%>
<%@page import="net.ifts16.model.Automovil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <form class="form-signin" action="Automoviles" method="post">
                    <input type="hidden" name="comando" value="actualizar"/>
                    <h1>Editar Auto</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Automovil auto = (Automovil)request.getAttribute("auto"); %>
                    <div class="form-group">
                        <h6>Id:</h6>
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= auto.getId() %>">
                    </div>
                    <div class="form-group">
                        <h6>Patente:</h6>
                        <input type="text" class="form-control" id="patente" name="patente" aria-describedby="patente" value="<%= auto.getPatente() %>" required="required">
                    </div>
                      <h6>Modelo:</h6>
                    <select class="form-group custom-select" id="modelo" name="modelo">
                        <option value="<%= auto.getModelo().getId() %>">Modelo</option>
                    <% List<Modelo> modelos = new ModeloDAO().obtenerTodos();
                        for (Modelo s : modelos) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getMarca().toString() + " - " + s.getNombre() + "</option>"); %>
                    <%
                        }
                    %>
                    </select>
                    <div class="form-group">
                          <h6>Cantidad de Pasajeros:</h6>
                        <input type="text" class="form-control" id="pasajeros" name="pasajeros" aria-describedby="pasajeros" value="<%= auto.getPasajeros() %>" required="required">
                    </div>
                    <div class="form-group">
                          <h6>Cantidad de Puertas:</h6>
                        <input type="text" class="form-control" id="puertas" name="puertas" aria-describedby="puertas" value="<%= auto.getPuertas() %>" required="required">
                    </div>
                    <div class="form-group">
                          <h6>Precio:</h6>
                        <input type="text" class="form-control" id="precio" name="precio" aria-describedby="precio" value="<%= auto.getPrecio() %>" required="required">
                    </div>
                      <h6>Cambios:</h6>
                    <select class="form-group custom-select" id="cambios" name="cambios">
                        <option value="<%= auto.getCambios().name() %>">Tipo de Caja</option>
                    <% for(Cambios c : Cambios.values()){
                    %>    
                       <% out.print("<option value=" + c.name() + ">" + c.toString() + "</option>"); %> 
                    <% } %>
                    </select>
                      <h6>Sede de Radicacion:</h6>
                    <select class="form-group custom-select" id="sedeRadicacion" name="sedeRadicacion">
                        <option value="<%= auto.getSedeRadicacion().getId() %>">Sede Radicacion</option>
                    <% List<Sede> sedes = new SedeDAO().obtenerTodos();
                        for (Sede s : sedes) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                    <%
                        }
                    %>
                    </select>
                      <h6>Sede de Ubicacion:</h6>
                    <select class="form-group custom-select"id="sedeUbicacion" name="sedeUbicacion">
                        <option value="<%= auto.getSedeUbicacion().getId() %>">Sede Ubicacion</option>
                    <% List<Sede> sedes1 = new SedeDAO().obtenerTodos();
                        for (Sede s : sedes1) {
                    %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                    <%
                        }
                    %>
                    </select>
                    <input id="editar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#edicionConfirmadaModal" value="Editar">
                </form>
                    
                    <div class="modal fade" id="edicionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="edicionConfirmadaModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Automovil editado</p>
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
        $.post('Automoviles', $('.form-signin').serialize())
                .done(function () {
                    $('#aceptarEditarButton').click(function () {
                        location.href = 'Automoviles';
                    });
                    $('#edicionConfirmadaModal').modal('toggle');
                });
    });
</script>