<%-- 
    Document   : editar-usuario
    Created on : Jun 13, 2019, 21:16:52 PM
    Author     : Hernán Rago
--%>

<%@page import="net.ifts16.enums.Rol"%>
<%@page import="net.ifts16.model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="text-center">
                <form class="form-signin" action="Usuario" method="post">
                    <input type="hidden" name="comando" value="actualizar"/>
                    <h1>Editar Usuario</h1>
                    <img class="mb-4" src="resources/images/car-logo.png" alt="" width="72" height="72">
                    <%Usuario u = (Usuario) request.getAttribute("usuario");%>
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" readonly="id" aria-describedby="id" value="<%= u.getId()%>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="nombre" value="<%= u.getNombre()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellido" name="apellido" aria-describedby="apellido" value="<%= u.getApellido()%>" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" aria-describedby="nombreUsuario" value="<%= u.getNombreUsuario()%>" required="required">
                    </div>
                    <div class="form-group">
                        <select name="rol" class="custom-select">
                            <option>Rol</option>
                            <%
                                for (Rol r : Rol.values()) {
                                    if (r.toString().equals(u.getRol().toString())) {
                                        out.print("<option value=" + r.name() + " selected>" + r.toString() + "</option>");
                                    } else {
                                        out.print("<option value=" + r.name() + ">" + r.toString() + "</option>");
                                    }
                                }
                            %>        
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
                <hr class="featurette-divider">
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
