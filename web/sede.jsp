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
        <title>Alta de Sede</title>
    </head>
    <body>
        <h1>Alta de Sede</h1>
        <div>
            <form action="SedeServlet" method="post">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Domicilio</td>
                            <td><input type="text" name="domicilio"/></td>
                        </tr>
                        <tr>
                            <td>Código Postal</td>
                            <td><input type="text" name="codigoPostal"/></td>
                        </tr>
                        <tr>
                            <td>Ciudad</td>
                            <td><input type="text" name="ciudad"/></td>
                        </tr>
                        <tr>
                            <td>Provincia</td>
                            <td><input type="text" name="provincia"/></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="registrar" />
            </form>
        </div>

    </body>
</html>
