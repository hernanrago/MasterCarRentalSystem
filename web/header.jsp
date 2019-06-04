<%@page import="java.security.Principal"%>
<% Principal usuario = request.getUserPrincipal(); %>

<div id="header">
    <div>
        <a href="/MasterCarRentalSystem" id="logo"><img src="resources/images/mcr-logo.png" alt="logo"></a>
        <ul>
            <li class="selected">
                <a href="/MasterCarRentalSystem/">Home</a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li><a><text style=\"color:#1bb5ac;\"><strong>" + usuario.getName().toUpperCase() + "</strong></text></a></li>");            
            } else {
                    out.print("<li><a href=\"/MasterCarRentalSystem/Ingreso\">Ingreso</a></li>");
                }
            %>

            <li>
                <a href="/MasterCarRentalSystem/Registro">Registro</a>
            </li>
            <li>
                <a href="#">La Empresa</a>
            </li>
            <li>
                <a href="#">Contacto</a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li><a href=\"/MasterCarRentalSystem/Usuario?comando=salir\">Salir</a></li>");
                    
                }
            %>
        </ul>
    </div>
</div>
