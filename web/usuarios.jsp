<%-- 
    Document   : usuarios
    Created on : June 13, 2019, 19:52:39 PM
    Author     : Hernán Rago
--%>

<%@page import="net.ifts16.model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <br>
            <h1>USUARIOS</h1>
            <hr>
            <a href="Usuario?comando=nuevo" class="btn btn-success btn-lg">Ingresar Usuario</a>
            <br>
            <br>
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Apellido</th>
                    <th class="text-center">Nombre de Usuario</th>
                    <th class="text-center">Rol</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Usuario> usuarios = (List<Usuario>)request.getAttribute("usuarios");
                    for (Usuario u : usuarios) {
                %>
                <tr>
                    <td class="text-center"><%= u.getId()%></td>
                    <td class="text-center"><%= u.getNombre()%></td>
                    <td class="text-center"><%= u.getApellido()%></td>
                    <td class="text-center"><%= u.getNombreUsuario()%></td>
                    <td class="text-center"><%= u.getRol()%></td>
                    <td class="text-center">
                        <a href="Usuario?comando=editar&id=<%= u.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= u.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
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
                            <p>¿Desea eliminar este usuario?</p>
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
                            <p>Usuario eliminado</p>
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
        let usuarioId = $(this).val();
        let usuario = <% out.print(request.getParameter("usuario"));%>
        $('#confirmarEliminarModal').val(usuarioId);

        $(".confirmar").click(function () {
            $.ajax({
                method: "POST",
                url: "Usuario",
                data: {
                    comando: 'eliminar',
                    usuarioId: usuarioId}
            })
                    .done(function () {
                        $('#aceptarEliminarButton').click(function () {
                            $.ajax({
                                method: "GET",
                                url: "Usuario"
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
