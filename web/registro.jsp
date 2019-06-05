<%-- 
    Document   : registracion
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="text-center">
            <form class="form-signin" action="UsuarioServlet" method="post">
                <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                <input type="hidden" name="comando" value="registro"/>
                <div class="form-group">
                    <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre" placeholder="Ingresar nombre" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="apellido" name="apellido" aria-describedby="apellido" placeholder="Ingresar apellido" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresar contraseña" required="required">
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
