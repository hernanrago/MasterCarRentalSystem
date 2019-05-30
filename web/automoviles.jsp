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
        <%@include file="header.html"%>
        <div id="body" class="home">
            <div class="card-deck">
                <div class="row">
                    <%List<Automovil> automoviles = (ArrayList<Automovil>) request.getAttribute("automoviles");
                        for (Automovil a : automoviles) {
                    %>
                    <div class="col-sm-6">
                        <div class="card border-dark">
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
                            <div class="card-footer">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    Reservar
                                </button>
                            </div>
                        </div>

                    </div>
                    <% }%>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea reservar este automóvil?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.html" %>
    </body>
</html>
