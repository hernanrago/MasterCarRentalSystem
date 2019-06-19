<%-- 
    Document   : editSede
    Created on : 10/06/2019, 07:06:40
    Author     : vitor
--%>

<%@page import="net.ifts16.dao.AutomovilDAO"%>
<%@page import="net.ifts16.model.Automovil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <br>
            <h1>AUTOS</h1>
            <hr>
            <a href="Sede?comando=nuevo" class="btn btn-success btn-lg">Ingresar Auto</a>
            <br>
            <br>
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Marca</th>
                    <th class="text-center">Modelo</th>
                    <th class="text-center">Patente</th>
                    <th class="text-center">Sede</th>
                    <th class="text-center">Alquilado</th>
                </tr>
                <%List<Automovil> auto = new AutomovilDAO().obtenerTodos();
                    for (Automovil a : auto) {
                %>
                <tr>
                    <td class="text-center"><%= a.getId()%></td>
                    <td class="text-center"><%= a.getModelo().getMarca()%></td>
                    <td class="text-center"><%= a.getModelo().getNombre()%></td>
                    <td class="text-center"><%= a.getPatente()%></td>
                    <td class="text-center"><%= a.getSedeRadicacion().getDomicilio()%></td>
                    <td class="text-center">
                        <a href="Sede?comando=editar&id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
                                Eliminar
                            </button>
                        <!--<a value="<%= a.getId()%>" class="btn btn-danger btn-sm">Eliminar</a>-->
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
