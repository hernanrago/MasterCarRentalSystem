<% String usuario = (String) request.getSession().getAttribute("usuario"); %>

<div id="header">
    <div>
        <a href="/MasterCarRentalSystem" id="logo"><img src="resources/images/mcr-logo.png" alt="logo"></a>
        <ul>
            <li class="selected">
                <a href="/MasterCarRentalSystem/">Home</a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li><a><text style=\"color:#1bb5ac;\"><strong>" + usuario.toUpperCase() + "</strong></text></a></li>");            
            } else {
                    out.print("<li><a href=\"/MasterCarRentalSystem/Ingreso\">Ingreso</a></li>");
                }
            %>

            <li>
                <a href="/MasterCarRentalSystem/Registro">Registro</a>
            </li>
            <li>
                <a href="about.html">La Empresa</a>
            </li>
            <li>
                <a href="contact.html">Contacto</a>
            </li>
            <%
                if (usuario != null) {
                    out.print("<li><a href=\"/MasterCarRentalSystem/Salir\">Salir</a></li>");
                }
            %>
        </ul>
    </div>
</div>
