<%-- 
    Document   : registracion
    Created on : May 7, 2019, 11:29:25 PM
    Author     : Hernán Rago
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <h1>Alta de Sede</h1>
                <form class="form-signin" action="SedeServlet" method="post">
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <input type="hidden" name="tipo" value="registro"/>
                    <div class="form-group">
                        <input type="text" class="form-control" id="domicilio" name="domicilio" aria-describedby="domicilio" placeholder="Domicilio" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" aria-describedby="codigoPostal" placeholder="Codigo Postal" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" name="ciudad" aria-describedby="ciudad" placeholder="Ciudad" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia" required="required">
                    </div>
                    <button type="submit" class="btn btn-primary" value="registrar">Registrar</button>
                </form>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
