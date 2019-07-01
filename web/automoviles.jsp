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
        <div class="container">
            <div class="jumbotron">
                <h1>Consultar vehículos disponibles</h1>
                <form action="Automoviles" method="GET">
                <input type="hidden" id="comando" name="comando" value="automovilesDisponibles"/>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="fechaAlquiler"><p class="lead">Fecha de alquiler</p></label>
                            <!--<input type="date" class="form-control" id="fechaAlquiler" aria-describedby="fechaAlquiler" placeholder="Escoger fecha">-->
                            <input id="fechaAlquiler" name="fechaAlquiler" placeholder="Escoger fecha"/>

                        </div>
                        <div class="form-group col-md-4">
                            <label for="fechaDevolucion"><p class="lead">Fecha de devolución</p></label>
                            <!--<input type="date" class="form-control" id="fechaDevolucion" aria-describedby="fechaDevolucion" placeholder="Escoger fecha">-->
                            <input id="fechaDevolucion" name="fechaDevolucion" placeholder="Escoger fecha"/>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="sede"><p class="lead">Sede</p></label>
                            <select class="form-control custom-select" id="sede" name="sede">
                                <option value="todas">Todas la sedes</option>
                                <% List<Sede> sedes = new SedeDAO().obtenerTodos();
                                    for (Sede s : sedes) {
                                %>
                                <% out.print("<option value=" + s.getId() + ">" + s.getDomicilio() + "</option>"); %>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <button type="submit" class="btn btn-lg btn-primary">Consultar</button>
                        </div>
                    </div>
            </form>
            </div>
            <hr class="featurette-divider">
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
                            <% } else if(usuario != null) { %>
                            <button type="button" class="btn btn-primary" reservar="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarReservaModal">
                                Reservar
                            </button>
                            <% } else { %>
                            <a type="button" class="btn btn-primary" href="ingreso.jsp">Ingresa Para Reservar</a>
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
                            <h3>Elija la Fecha de Reserva</h3>
                            <label for="fechaAlquiler2"><p>Fecha de alquiler</p></label>
                            <!--<input type="date" class="form-control" id="fechaAlquiler" aria-describedby="fechaAlquiler" placeholder="Escoger fecha">-->
                            <input id="fechaAlquiler2" name="fechaAlquiler2" placeholder="Escoger fecha"/>
                            <br>
                            <label for="fechaDevolucion2"><p>Fecha de devolución</p></label>
                            <!--<input type="date" class="form-control" id="fechaDevolucion" aria-describedby="fechaDevolucion" placeholder="Escoger fecha">-->
                            <input id="fechaDevolucion2" name="fechaDevolucion2" placeholder="Escoger fecha" fechaDevolucion2/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" confirmar>Reservar</button>
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
    let reservas = document.querySelectorAll('[reservar]');
    let automovilId;
    let usuarioId = <%= usuario.getId() %>;
    
    reservas.forEach((e) => {
            e.onclick = function() {          
               automovilId = this.getAttribute('reservar');
           };
    });
    
    document.querySelector('[confirmar]').onclick = function () {
        let fechaEntrega = $('#fechaAlquiler2').val();
        let fechaDevolucion = $('#fechaDevolucion2').val();
            $.ajax({
                method: "POST",
                url: "Reserva",
                data: {
                    comando: 'reservar',
                    automovilId: automovilId,
                    usuarioId : usuarioId,
                    fechaEntrega: fechaEntrega,
                    fechaDevolucion: fechaDevolucion
                }
            })
                    .done(function () {
                        $('#aceptarReservaButton').click(function () {
                            location.reload();
                        });
                    $('#confirmarReservaModal').modal('toggle');
                    $('#reservaConfirmadaModal').modal('toggle');
                    });
        };

</script>
<script type="text/javascript" >
    $(document).ready(function () {
        let today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
        $('#fechaAlquiler2').datepicker({
            uiLibrary: 'bootstrap4',
            locale: 'es-es',
            minDate: today,
            format: 'yyyy-mm-dd',
            footer: true,
            modal: true,
            header: true,
            maxDate: function () {
                return $('#fechaDevolucion2').val();
            }
        });
        $('#fechaDevolucion2').datepicker({
            uiLibrary: 'bootstrap4',
            locale: 'es-es',
            format: 'yyyy-mm-dd',
            footer: true,
            modal: true,
            header: true,
            minDate: function () {
                return $('#fechaAlquiler2').val();
            }
        });
    });
</script>