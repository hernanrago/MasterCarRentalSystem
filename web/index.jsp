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
        <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Master Car Rental System.</h2>
                    <p class="lead">Renta tu vehiculo con las mejores opciones de mercado. Somos una empresa con mas de 30 años en el negocio de alquiler de automoviles.</p>
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
                </div>
        </div> 
        <hr class="featurette-divider">
        <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Master Car Rental System.</h2>
                    <p class="lead">Renta tu vehiculo con las mejores opciones de mercado. Somos una empresa con mas de 30 años en el negocio de alquiler de automoviles.</p>
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
                </div>
        </div> 
        <hr class="featurette-divider">
        <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Master Car Rental System.</h2>
                    <p class="lead">Renta tu vehiculo con las mejores opciones de mercado. Somos una empresa con mas de 30 años en el negocio de alquiler de automoviles.</p>
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
                </div>
        </div> 
        <hr class="featurette-divider">
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
