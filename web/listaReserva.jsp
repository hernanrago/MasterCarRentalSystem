<%-- 
    Document   : listaReserva
    Created on : 14/06/2019, 16:05:11
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.ReservaDAO"%>
<%@page import="net.ifts16.model.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <br>
            <h1>Reservas</h1>
            <hr>
            <form action="Reserva" method="GET">
                <input type="hidden" id="comando" name="comando" value="mostrar"/>
                    <div class="form-group col-md-4">
                        <label for="sede">Sede</label>
                        <select class="form-control custom-select" id="sede" name="sede">
                            <option value="todas">Todas la sedes</option>
                            <%List<Sede> sedes = new SedeDAO().obtenerTodos();
                                for (Sede s : sedes) {
                            %>
                            <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <!--<a href="consultaReserva.jsp?comando=mostrar" class="btn btn-primary">Consultar</a>-->
                        <button type="submit" class="btn btn-primary">Consultar</button>
                    </div>
            </form>        
        </div>
        <%@include file="footer.html" %>            
    </body>
</html>
