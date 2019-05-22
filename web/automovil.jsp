<%-- 
    Document   : registracion
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Automóvil</title>
    </head>
    <body>
        <h1>Alta de Automóvil</h1>
        <div>
            <form action="AutomovilServlet" method="post">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre"/></td>
                        </tr>
                        <tr>
                            <td>Apellido</td>
                            <td><input type="text" name="apellido"/></td>
                        </tr>
                        <tr>
                            <td>Nombre de Usuario</td>
                            <td><input type="text" name="nombreUsuario"/></td>
                        </tr>
                        <tr>
                            <td>Contraseña</td>
                            <td><input type="password" name="contrasena"/></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="registrar" />
            </form>
        </div>

    </body>
</html>
