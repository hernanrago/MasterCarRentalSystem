<%-- 
    Document   : elimSede
    Created on : 10/06/2019, 13:21:04
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.SedeDAO"%>
<%@page import="net.ifts16.model.Sede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <form class="form-signin" action="SedeServlet" method="post">
                    <input type="hidden" name="tipo" value="eliminar"/>
                    <h1>Eliminar Sede</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Sede sede = new SedeDAO().obtener(Integer.parseInt(request.getParameter("id")));%>
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= sede.getId()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="domicilio" name="domicilio" readonly="domicilio" aria-describedby="domicilio" value="<%= sede.getDomicilio()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" readonly="codigoPostal" aria-describedby="codigoPostal" value="<%= sede.getCodigoPostal()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" name="ciudad" readonly="ciudad" aria-describedby="ciudad" value="<%= sede.getCiudad()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="provincia" name="provincia" readonly="provincia" value="<%= sede.getProvincia()%>">
                    </div>
                    <button type="submit" class="btn btn-primary">ELIMINAR</button>
                </form>
                <hr class="featurette-divider">
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
