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
            <br>
            
            <hr class="featurette-divider">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="resources/images/auto1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="resources/images/auto2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="resources/images/auto3.jpg" alt="Third slide">
                    </div>
                </div>
            </div>
            <br>
            <h1>MASTERCAR RENTAL</h1>
            <p class="text-justify">
                Alquilá tu vehículo con las mejores opciones de mercado. Somos una empresa con mas de 30 años en el negocio de alquiler de automóviles.<br>
                En nuestras oficinas el proceso de check-in es fácil y rápido. Al llegar nuestros operadores te dan toda la información que necesitás para alquilar vehículos: 
                requisitos, retiro y devolución, cruce de fronteras, servicios adicionales al vehículo, medios de pago disponibles, asesoramiento sobre cuál es el mejor vehículo 
                y tarifa disponible según destino, condiciones y cualquier otra consulta que tengas sobre nuestro servicio.
            </p>
            <hr class="featurette-divider">
            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Disfrutá de los mejores centros turísticos</h2>
                    <p class="text-justify">
                        Cerca de los centros urbanos de la provincia de Buenos Aires existen diversidad de paisajes perfectos para viajar por un día o por un fin de semana 
                        y encontrar el descanso, la aventura, el conocimiento, el placer o simplemente escapar de la rutina; delta y campos, ríos y lagunas, playas y sierras, ciudades y 
                        pueblos forman un conjunto de opciones turísticas para disfrutar todo el año.
                    </p>
                </div>
                <div class="col-md-5 order-md-1">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="resources/images/buenos-aires.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="resources/images/turista.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="resources/images/turista2.jpg" alt="Third slide">
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
                </div>
            </div> 
            <hr class="featurette-divider">
            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Pedí el servicio <i>puerta a puerta</i></h2>
                    <p class="text-justify">
                        Retirá tu vehículo desde cualquier sede, ubicadas en lugares estratégicos de la ciudad, o también podés utilizar nuestro novedoso sistema de puerta a puerta
                        en el que te llevamos el automóvil a donde desees. Nuestros operarios se encargaran de coordinar todo.
                    </p>
                </div>
                <div class="col-md-5 order-md-1">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="resources/images/familia.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="resources/images/familia2.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="resources/images/familia3.jpg" alt="Third slide">
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
                </div>
            </div> 
            <hr class="featurette-divider">
        </div>
        <%@include file="footer.html" %>
        
    </body>
</html>
