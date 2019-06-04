<%-- 
    Document   : index
    Created on : May 2, 2019, 12:32:59 AM
    Author     : Hernán Rago
--%>

<%@page import="net.ifts16.dao.SedeDAO"%>
<%@page import="net.ifts16.model.Sede"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="jumbotron">
            <div class="container">
                <form action="Automoviles" method="GET">
                    <input type="hidden" id="comando" name="comando" value="automovilesDisponibles"/>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="fechaAlquiler">Fecha de alquiler</label>
                            <input type="date" class="form-control" id="fechaAlquiler" aria-describedby="fechaAlquiler" placeholder="Escoger fecha">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="fechaDevolucion">Fecha de devolución</label>
                            <input type="date" class="form-control" id="fechaDevolucion" aria-describedby="fechaDevolucion" placeholder="Escoger fecha">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="sede">Sede</label>
                            <select class="form-control custom-select" id="sede" name="sede">
                                <option value="">Todas la sedes</option>
                                <% List<Sede> sedes = new SedeDAO().obtenerTodos();
                                    for (Sede s : sedes) {
                                %>
                                <% out.print("<option value=" + s.getId() +">"+s.getDomicilio() + "</option>"); %>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <button type="submit" class="btn btn-primary">Consultar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="body" class="home">
            <div class="blog">
                <img src="resources/images/house.png" alt="">
                <div>
                    <h3>This is just a place holder</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin enim a nulla mollis, sed pulvinar ipsum efficitur. Nam id massa ut erat eleifend gravida ac id nulla. Nam pharetra purus at magna sodales venenatis. Nunc eget urna turpis. Cras mollis neque ut felis ultricies tempor. Aliquam condimentum erat id augue sollicitudin faucibus. Vestibulum feugiat magna a convallis consectetur. Etiam ut urna at velit tincidunt euismod. Curabitur id metus et eros sollicitudin accumsan.
                    </p>
                </div>
            </div>

            <div class="article">
                <div>
                    <h3>This is just a place holder</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin enim a nulla mollis, sed pulvinar ipsum efficitur. Nam id massa ut erat eleifend gravida ac id nulla. Nam pharetra purus at magna sodales venenatis. Nunc eget urna turpis. Cras mollis neque ut felis ultricies tempor. Aliquam condimentum erat id augue sollicitudin faucibus. Vestibulum feugiat magna a convallis consectetur. Etiam ut urna at velit tincidunt euismod. Curabitur id metus et eros sollicitudin accumsan.
                    </p>
                </div>
                <img src="resources/images/nature-place-photo.png" alt="">
            </div>

            <div class="news">
                <img src="resources/images/eco-park.png" alt="">
                <div>
                    <h3>This is just a place holder</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin enim a nulla mollis, sed pulvinar ipsum efficitur. Nam id massa ut erat eleifend gravida ac id nulla. Nam pharetra purus at magna sodales venenatis. Nunc eget urna turpis. Cras mollis neque ut felis ultricies tempor. Aliquam condimentum erat id augue sollicitudin faucibus. Vestibulum feugiat magna a convallis consectetur. Etiam ut urna at velit tincidunt euismod. Curabitur id metus et eros sollicitudin accumsan.
                    </p>
                </div>
            </div>

        </div>
        <%@include file="footer.html" %>
    </body>
</html>
