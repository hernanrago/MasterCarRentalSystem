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
                        <button type="submit" class="btn btn-primary">Consultar</button>
                    </div>
                </div>
            </form>
                        
        <hr class="featurette-divider">                    
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="resources/images/ford.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="resources/images/fiat.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="resources/images/mondeo.png" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div> 
        <hr class="featurette-divider">
    </div>
    <%@include file="footer.html" %>
</body>
</html>
