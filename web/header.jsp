<%@page import="net.ifts16.dao.SedeDAO"%>
<%@page import="net.ifts16.model.Sede"%>
<%@page import="java.util.List"%>
<%@page import="java.security.Principal"%>
<% Principal usuario = request.getUserPrincipal(); %>

<div>
    <div>
        <a href="Index"><img class="d-block w-100" src="resources/images/logofinal.jpeg"></a>
    </div>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="miSectionNav">
            <a class="navbar-brand">
                <img src="resources/images/car-logo.png" width="30" height="30" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Index">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Registro">Registro</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Empresa">Empresa</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Contacto">Contacto</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Administrador
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Usuarios</a>
                            <a class="dropdown-item" href="#">Sedes</a>
                            <a class="dropdown-item" href="#">Automóviles</a>
                            <a class="dropdown-item" href="#">Reservas</a>
                        </div>
                    </li>
                </ul>
                <%
                    if (usuario != null) {
                        out.print("<li class=\"nav-item active\"><a class=\"nav-link\"><text style=\"color:#1bb5ac;\"><strong>" + usuario.getName().toUpperCase() + "</strong></text></a></li>");
                    } else {
                        out.print("<form class=\"form-inline my-2 my-lg-0\"><a <button class=\"btn btn-outline-success my-2 my-sm-0\" href=\"ingreso.jsp\">Ingresa</button></a></form>");
                    }
                %>
                <%
                    if (usuario != null) {
                        //out.print("<li><a href=\"/MasterCarRentalSystem/Usuario?comando=salir\">Salir</a></li>");
                        out.print("<form class=\"form-inline my-2 my-lg-0\"><a <button class=\"btn btn-outline-success my-2 my-sm-0\" href=\"/MasterCarRentalSystem/Usuario?comando=salir\">Salir</button></a></form>");
                    }
                %>
            </div>
        </nav>              
    </div>
</div>
