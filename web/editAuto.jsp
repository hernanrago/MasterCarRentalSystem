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
                <form class="form-signin" action="Sede" method="post">
                    <input type="hidden" name="comando" value="actualizar"/>
                    <h1>Editar Auto</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Automovil auto = (Automovil)request.getAttribute("sede"); %>
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= auto.getModelo().getMarca()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="domicilio" name="domicilio" aria-describedby="domicilio" value="<%= auto.getModelo().getNombre()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" aria-describedby="codigoPostal" value="<%= auto.getPatente()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" name="ciudad" aria-describedby="ciudad" value="<%= auto.getSedeRadicacion().getDomicilio()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="provincia" name="provincia" value="<%= auto.getProvincia()%>" required="required">
                    </div>
                    <button type="submit" class="btn btn-primary">Editar</button>
                </form>
                <hr class="featurette-divider">
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
