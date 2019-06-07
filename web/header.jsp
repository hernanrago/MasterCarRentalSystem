<%@page import="net.ifts16.dao.SedeDAO"%>
<%@page import="net.ifts16.model.Sede"%>
<%@page import="java.util.List"%>
<%@page import="java.security.Principal"%>
<% Principal usuario = request.getUserPrincipal(); %>

<div>
    <div>
        <a href="index.jsp"><img class="d-block w-100" src="resources/images/logofinal.jpeg"></a>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="/MasterCarRentalSystem/Registro">Registro</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="empresa.jsp">Empresa</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="contacto.jsp">Contacto</a>
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
    </div>
</div>
