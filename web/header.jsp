<div id="header">
    <div>
        <a href="/MasterCarRentalSystem" id="logo"><img src="resources/images/mcr-logo.png" alt="logo"></a>
        <ul>
            <li class="selected">
                <a href="index.jsp">Home</a>
            </li>
            <li>
                <a href="/MasterCarRentalSystem/Ingreso">Ingresar</a>
            </li>
            <li>
                <a href="/MasterCarRentalSystem/Registro">Registrar</a>
            </li>
            <li>
                <a href="about.html">La Empresa</a>
            </li>
            <li>
                <a href="contact.html">Contacto</a>
            </li>
            <%
                String usuario = (String)request.getSession().getAttribute("usuario");
                if(usuario != null) out.print("<li><a>" + usuario.toUpperCase() + "</a></li>");
            %>
        </ul>
    </div>
</div>
