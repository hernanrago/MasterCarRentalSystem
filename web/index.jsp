<%-- 
    Document   : index
    Created on : May 2, 2019, 12:32:59 AM
    Author     : Hernán Rago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.html"%>
        <form action="AutomovilServlet" method="GET">
            <input type="hidden" id="comando" name="comando" value="automovilesDisponibles"/>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="exampleInputEmail1">Fecha de alquiler</label>
                    <input type="date" class="form-control" id="fechaAlquiler" aria-describedby="fechaAlquiler" placeholder="Escoger fecha">
                    <small id="fechaAlquiler" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group col-md-2">
                    <label for="exampleInputEmail1">Fecha de devolución</label>
                    <input type="date" class="form-control" id="fechaDevolucion" aria-describedby="fechaDevolucion" placeholder="Escoger fecha"">
                    <small id="fechaDevolucion" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group col-md-2">
                    <label for="sede">Sede</label>
                    <select class="form-control" id="sel1">
                        <option>Monte Castro</option>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <div></div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>

        <div id="body" class="home">
            <div class="blog">
                <img src="resources/images/house.png" alt="">
                <div>
                    <img src="resources/images/mcr-logo.png" alt="">
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
