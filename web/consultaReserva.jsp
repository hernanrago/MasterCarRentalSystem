<%-- 
    Document   : consultaReserva
    Created on : 17/06/2019, 06:07:30
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.ReservaDAO"%>
<%@page import="net.ifts16.model.Reserva"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
    </head>
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
                    <button type="submit" class="btn btn-primary">Consultar</button>
                </div>
            </form>      
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Usuario</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Apellido</th>
                    <th class="text-center">Fecha Reserva</th>
                    <th class="text-center">Fecha Entrega</th>
                    <th class="text-center">Modelo</th>
                    <th class="text-center">Ubicacion</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Reserva> reservas = (List<Reserva>) request.getAttribute("reservas");
                    for (Reserva a : reservas) {
                %>
                <tr>
                    <td class="text-center"><%= a.getId()%></td>
                    <td class="text-center"><%= a.getUsuario().getNombreUsuario()%>
                    <td class="text-center"><%= a.getUsuario().getNombre()%>
                    <td class="text-center"><%= a.getUsuario().getApellido()%>
                    <td class="text-center"><%= a.getFechaReserva()%>
                    <td class="text-center"><%= a.getFechaCancelacion()%>
                    <td class="text-center"><%= a.getAutomovil().getModelo().getMarca()%>
                    <td class="text-center"><%= a.getAutomovil().getSedeUbicacion().getDomicilio()%>
                    <td class="text-center">
                        <a href="Reserva?comando=editar&id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
                            Eliminar
                        </button>
                    </td>
                </tr>
                <% }%>
            </table>  
            
                        <!-- Modal confirmar reserva -->
            <div class="modal fade" id="confirmarEliminarModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminarModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmarEliminarModalLabel">Eliminar</h5>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea eliminar esta reserva?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-danger confirmar">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal reserva confirmada -->
            <div class="modal fade" id="eliminacionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="eliminacionConfirmadaModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p>Reserva eliminada</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="aceptarEliminarButton">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <%@include file="footer.html" %>
    </body>
</html>

<script>
        $(document).on("click", ".eliminar", function () {
        let reservaId = $(this).val();
        let reserva = <% out.print(request.getParameter("reserva"));%>
        $('#confirmarEliminarModal').val(reservaId);

        $(".confirmar").click(function () {
            $.ajax({
                method: "POST",
                url: "Reserva",
                data: {
                comando: 'eliminar',    
                reservaId: reservaId}
            })
                    .done(function () {
                        $('#aceptarEliminarButton').click(function () {
                            $.ajax({
                                method: "GET",
                                url: "Reserva"
                            })
                                    .done(function () {
                                        location.reload();
                                    });
                        });
                        $('#confirmarEliminarModal').modal('toggle');
                        $('#eliminacionConfirmadaModal').modal('toggle');
                    });
        });
    });
</script>
