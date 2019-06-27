<%-- 
    Document   : editSede
    Created on : 10/06/2019, 08:37:47
    Author     : vitor
--%>

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
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= auto.getId() %>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="modelo" name="modelo" aria-describedby="modelo" value="<%= auto.getModelo().getNombre()%>" readonly="modelo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="pasajeros" name="pasajeros" aria-describedby="pasajeros" value="<%= auto.getPasajeros() %>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="patente" name="patente" aria-describedby="patente" value="<%= auto.getPatente() %>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="cambios" name="cambios" aria-describedby="cambios" value="<%= auto.getCambios() %>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="precio" name="precio" aria-describedby="precio" value="<%= auto.getPrecio() %>" required="required">
                    </div>
                    <select class="form-group custom-select">
                        <% List<Sede> sedes = new SedeDAO().obtenerTodos();
                            for (Sede s : sedes) {
                        %>
                        <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit" class="btn btn-primary">Editar</button>
                </form>
                <hr class="featurette-divider">
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
