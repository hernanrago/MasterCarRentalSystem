<%-- 
    Document   : editSede
    Created on : 10/06/2019, 07:06:40
    Author     : vitor
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <br>
            <h1>SEDES</h1>
            <hr>
            <a href="Sede?comando=nuevo" class="btn btn-success btn-lg">Ingresar Sede</a>
            <br>
            <br>
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Domicilio</th>
                    <th class="text-center">Código Postal</th>
                    <th class="text-center">Ciudad</th>
                    <th class="text-center">Provincia</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Sede> sedes = (List<Sede>)request.getAttribute("sedes");
                    for (Sede a : sedes) {
                %>
                <tr>
                    <td class="text-center"><%= a.getId()%></td>
                    <td class="text-center"><%= a.getDomicilio()%></td>
                    <td class="text-center"><%= a.getCodigoPostal()%></td>
                    <td class="text-center"><%= a.getCiudad()%></td>
                    <td class="text-center"><%= a.getProvincia()%></td>
                    <td class="text-center">
                        <a href="Sede?comando=editar&id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
                                Eliminar
                        </button>
                    </td>
                </tr>
                <% } %>
            </table>
            
                        <!-- Modal confirmar reserva -->
            <div class="modal fade" id="confirmarEliminarModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminarModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmarEliminarModalLabel">Eliminar</h5>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea eliminar esta sede?</p>
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
                            <p>Sede eliminada</p>
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
        let sedeId = $(this).val();
        let sede = <% out.print(request.getParameter("sede"));%>
        $('#confirmarEliminarModal').val(sedeId);

        $(".confirmar").click(function () {
            $.ajax({
                method: "POST",
                url: "Sede",
                data: {
                comando: 'eliminar',    
                sedeId: sedeId}
            })
                    .done(function () {
                        $('#aceptarEliminarButton').click(function () {
                            $.ajax({
                                method: "GET",
                                url: "Sede"
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
