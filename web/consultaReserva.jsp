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
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Apellido</th>
                    <th class="text-center">Fecha Reserva</th>
                    <th class="text-center">Modelo</th>
                    <th class="text-center">Ubicacion</th>
                    <th class="text-center">Ver Mas</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Reserva> reservas = (List<Reserva>) request.getAttribute("reservas");
                    for (Reserva a : reservas) {
                        if (a.getFechaCancelacion() != null) {
                %>
                <tr>
                    <td class="text-center"><%= a.getUsuario().getNombre()%>
                    <td class="text-center"><%= a.getUsuario().getApellido()%>
                    <td class="text-center"><%= a.getFechaReserva()%>
                    <td class="text-center"><%= a.getAutomovil().getModelo().getMarca()%>
                    <td class="text-center"><%= a.getAutomovil().getSedeUbicacion().getDomicilio()%>
                    <td class="text-center"><button type="button" class="btn btn-info btn-sm informacion" value="<%= a.getId()%>">Informacion</button>    
                    <td class="text-center">
                        <a href="#" class="btn btn-warning btn-sm">Reserva Cancelada</a>
                    </td>
                </tr> 
                <%
                } else {
                %>
                <tr>
                    <td class="text-center"><%= a.getUsuario().getNombre()%>
                    <td class="text-center"><%= a.getUsuario().getApellido()%>
                    <td class="text-center"><%= a.getFechaReserva()%>
                    <td class="text-center"><%= a.getAutomovil().getModelo().getMarca()%>
                    <td class="text-center"><%= a.getAutomovil().getSedeUbicacion().getDomicilio()%>
                    <td class="text-center"><button type="button" class="btn btn-info btn-sm informacion" value="<%= a.getId()%>">Informacion</button>    
                    <td class="text-center">
                        <a href="Reserva?comando=editar&id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
                            Cancelar
                        </button>
                    </td>
                </tr>
                <%      }
                    }
                %>
            </table>  
            
                        <!-- Modal ver informacion -->
            <div class="modal fade" id="verInformacion">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Informacion de la reserva</h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="modal-title">Informacion del usuario</h5>
                            <br>
                            <div class="list-group">
                                <div class="list-group">
                                    <li class="list-group-item"><b>Nombre y Apellido: </b><span id="nombre"/></li>
                                    <li class="list-group-item"><b>Usuario: </b><span id="usuario"/></li>
                                </div>
                            </div>
                            <hr>
                            <h5 class="modal-title">Informacion del Vehiculo</h5>
                            <br>
                            <div class="list-group">
                                <div class="list-group">
                                    <li class="list-group-item"><b>Modelo: </b><span id="modelo"/></li>
                                    <li class="list-group-item"><b>Patente: </b><span id="patente"/></li>
                                    <li class="list-group-item"><b>Cambios: </b><span id="cambios"/></li>
                                    <li class="list-group-item"><b>Pasajeros: </b><span id="pasajeros"/></li>
                                    <li class="list-group-item"><b>Puertas: </b><span id="puertas"/></li>
                                    <li class="list-group-item"><b>Precio: </b><span id="precio"/></li>
                                </div>
                            </div>
                            <hr>
                            <h5 class="modal-title">Informacion de la reserva</h5>
                            <br>
                            <div class="list-group">
                                <div class="list-group">
                                    <li class="list-group-item"><b>Fecha Entrega: </b><span id="fechaEntregaR"/></li>
                                    <li class="list-group-item"><b>Fecha Devolucion: </b><span id="fechaDevolucionR"/></li>
                                    <li class="list-group-item"><b>Fecha Reserva: </b><span id="fechaReservaR"/></li>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Listo</button>
                        </div>
                    </div>
                </div>
            </div>
                        
                        <!-- Modal confirmar reserva -->
            <div class="modal fade" id="confirmarEliminarModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminarModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmarEliminarModalLabel">Cancelar</h5>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea Cancelar esta reserva?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-danger confirmar">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal reserva confirmada -->
            <div class="modal fade" id="eliminacionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="eliminacionConfirmadaModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p>Reserva Cancelada</p>
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
                comando: 'cancelar',    
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

<script>
        $(document).on('click', '.informacion', function(){
       let reservaId = $(this).val(); 
        $.ajax({
            method: "POST",
            url: "Reserva",
            data: {
                comando: "mostrarReserva",    
                reservaId: reservaId
            },
            success: function(data){
                let datos = JSON.parse(data);
                $('#nombre').text(datos.nombre + " " + datos.apellido);
                $('#usuario').text(datos.usuario);
                $('#modelo').text(datos.modelo);
                $('#precio').text(datos.precio);
                $('#patente').text(datos.patente);
                $('#cambios').text(datos.cambios);
                $('#pasajeros').text(datos.pasajeros);
                $('#puertas').text(datos.puertas);
                $('#fechaReservaR').text(datos.fechaReserva);
                $('#fechaEntregaR').text(datos.fechaEntrega);
                $('#fechaDevolucionR').text(datos.fechaDevolucion);
                $('#verInformacion').modal('show');
            }
            });
    });
</script>