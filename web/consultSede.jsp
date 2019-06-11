<%-- 
    Document   : editSede
    Created on : 10/06/2019, 07:06:40
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
            <h1>Lista Sedes</h1>
            <hr>
            <a href="sede.jsp" class="btn btn-success btn-lg">Ingresar Sede</a>
            <br>
            <br>
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Domicilio</th>
                    <th class="text-center">Codigo Postal</th>
                    <th class="text-center">Ciudad</th>
                    <th class="text-center">Provincia</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Sede> sedes = new SedeDAO().obtenerTodos();
                    for (Sede a : sedes) {
                %>
                <tr>
                    <td class="text-center"><%= a.getId()%></td>
                    <td class="text-center"><%= a.getDomicilio()%></td>
                    <td class="text-center"><%= a.getCodigoPostal()%></td>
                    <td class="text-center"><%= a.getCiudad()%></td>
                    <td class="text-center"><%= a.getProvincia()%></td>
                    <td class="text-center">
                        <a href="editSede.jsp?id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="elimSede.jsp?id=<%= a.getId()%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
