<%-- 
    Document   : automoviles
    Created on : May 29, 2019, 11:08:49 AM
    Author     : Hernán Rago
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="net.ifts16.model.Automovil"%>
<%@page import="java.util.List"%>
<%@page isELIgnored = "false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div id="body" class="home">
                <div class="row">
                <%List<Automovil> automoviles = (ArrayList<Automovil>) request.getAttribute("automoviles");
                    for (Automovil a : automoviles) {
                %>
                <div class="col-sm-4">
                <div class="card">
                    <img src="resources/images/automoviles/<%= a.getId()%>.png" class="card-img-top" />
                    <div class="card-body">
                        <h5 class="card-title"><%= a.getModelo().getMarca()%></h5>
                        <h6 class="card-subtitle mb-2 text-muted"><%= a.getModelo().getNombre()%></h6>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><%= a.getPasajeros() + " pasajeros"%></li>
                        <li class="list-group-item"><%= a.getPuertas() + " puertas"%></li>
                        <li class="list-group-item"><%= "$" + a.getPrecio() + "/día"%></li>
                        <li class="list-group-item"><%= a.getCambios().toString()%></li>
                    </ul>
                    <div class="card-footer" id="<%= a.getId()%>">
                        <p class="card-text">Ubicación: <% out.print(a.getSedeUbicacion().getDomicilio()); %></p>
                        <% if (a.isReservado()) {%>
                        <div class="alert alert-info" role="alert" style="margin-bottom: 0">
                            Reservado
                        </div>
                        <% } else {%>
                        <button type="button" class="btn btn-primary reservar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarReservaModal">
                            Reservar
                        </button>
                        <% } %>
                    </div>
                </div>

                </div>
                <% }%>
                </div>              
            <!-- Modal confirmar reserva -->
            <div class="modal fade" id="confirmarReservaModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarReservaModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmarReservaModalLabel">Reservar</h5>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea reservar este automóvil?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary confirmar">Reservar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal reserva confirmada -->
            <div class="modal fade" id="reservaConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="reservaConfirmadaModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p>Reserva confirmada</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="aceptarReservaButton">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.html" %>
    </body>
</html>

<script>
    $(document).on("click", ".reservar", function () {
        let automovilId = $(this).val();
        $('#confirmarReservaModal').val(automovilId);

        $(".confirmar").click(function () {
            $.ajax({
                method: "POST",
                url: "ReservaServlet",
                data: {automovilId: automovilId}
            })
                    .done(function () {
                        $('#aceptarReservaButton').click(function () {
                            $.ajax({
                                method: "GET",
                                url: "AutomovilServlet",
                                data: {comando: "automovilesDisponibles"}
                            })
                                    .done(function () {
                                        location.reload();
                                    });
                        });
                        $('#confirmarReservaModal').modal('toggle');
                        $('#reservaConfirmadaModal').modal('toggle');
                    });
        });
    });
</script>
