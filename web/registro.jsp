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
        <%@include file="header.html"%>
        <div id="body" class="home">
            <form action="RegistroUsuarioServlet" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre" placeholder="Ingresar nombre">
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" aria-describedby="apellido" placeholder="Ingresar apellido">
                </div>
                <div class="form-group">
                    <label for="nombreUsuario">Nombre de usuario</label>
                    <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario">
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña</label>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresar contraseña">
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
