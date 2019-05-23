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
                            <td>Patente</td>
                            <td><input type="text" name="patente"/></td>
                        </tr>
                        <tr>
                            <td>Modelo</td>
                            <td><input type="text" name="modelo"/></td>
                        </tr>
                        <tr>
                            <td>pasajeros</td>
                            <td><input type="number" name="pasajeros"/></td>
                        </tr>
                        <tr>
                            <td>puertas</td>
                            <td><input type="number" name="puertas"/></td>
                        </tr>
                        <tr>
                            <td>precio</td>
                            <td><input type="number" name="precio"/></td>
                        </tr>
                        <tr>
                            <td>cambios</td>
                            <td><input type="text" name="cambios"/></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="registrar" />
            </form>
        </div>

    </body>
</html>
