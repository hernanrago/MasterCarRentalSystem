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
        <div id="body" class="home">
<!--                        <form action="j_security_check" method="post">
                            <input type="hidden" name="comando" value="ingreso" />
                            <div class="form-group">
                                <label for="nombreUsuario">Nombre de usuario</label>
                                <input type="text" class="form-control" id="nombreUsuario" name="j_username" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario">
                            </div>
                            <div class="form-group">
                                <label for="contrasena">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" name="j_password" placeholder="Ingresar contraseña">
                            </div>
                            <input type="submit" class="btn btn-primary" value="Ingresar"/>
                        </form>-->
                        <form action="Usuario" method="post">
                            <input type="hidden" name="comando" value="ingreso" />
                            <div class="form-group">
                                <label for="nombreUsuario">Nombre de usuario</label>
                                <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" placeholder="Ingresar nombre de usuario">
                            </div>
                            <div class="form-group">
                                <label for="contrasena">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresar contraseña">
                            </div>
                            <input type="submit" class="btn btn-primary" value="Ingresar"/>
                        </form>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
