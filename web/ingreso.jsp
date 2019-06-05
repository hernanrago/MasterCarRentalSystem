<%-- 
    Document   : ingreso
    Created on : May 31, 2019, 11:08:25 PM
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
                <input type="hidden" name="comando" value="ingreso" />
                <div class="form-group">
                    <label for="nombreUsuario">Ingresa al Sistema</label>
                    <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario">
                </div>
                <div class="form-group">
                    <label for="contrasena"></label>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresar contraseña">
                </div>
                <button type="submit" class="btn btn-primary">Ingresar</button>
            </form>
            <div class="checkbox mb-3">
            <label>
                <a href="registro.jsp">Usuario Nuevo - Registrate</a>
            </label>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
