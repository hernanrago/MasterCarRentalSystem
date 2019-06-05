<%@page import="java.security.Principal"%>
<% Principal usuario = request.getUserPrincipal(); %>

<div>
    <div class="jumbotron" id="mjumbo">
       <div class="container">
         <h1 class="display-3">Master Car Rental System</h1>
       </div>
    </div>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="miSectionNav">
            <a class="navbar-brand" href="index.jsp">
            <img src="resources/images/car-logo.png" width="30" height="30" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li class=\"nav-item active\"><a class=\"nav-link\"><text style=\"color:#1bb5ac;\"><strong>" + usuario.getName().toUpperCase() + "</strong></text></a></li>");            
            } else {
                    out.print("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/MasterCarRentalSystem/Ingreso\">Ingreso</a></li>");
                }
            %>

            <li class="nav-item">
                <a class="nav-link" href="/MasterCarRentalSystem/Registro">Registro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="empresa.jsp">Empresa</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contacto.jsp">Contacto</a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li><a href=\"/MasterCarRentalSystem/Usuario?comando=salir\">Salir</a></li>");                   
                }
            %>
            </ul>
            <form class="form-inline my-2 my-lg-0">
            <a <button class="btn btn-outline-success my-2 my-sm-0" href="ingreso.jsp">Ingresa</button></a>
            </form>
        </div>
        </nav>
    </div>
</div>