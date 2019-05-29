<%-- 
    Document   : automoviles
    Created on : May 29, 2019, 11:08:49 AM
    Author     : Hernán Rago
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="net.ifts16.model.Automovil"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Automóviles</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% List<Automovil> automoviles = (ArrayList<Automovil>)request.getAttribute("automoviles");
            for(Automovil a : automoviles){
                out.println(a.getPatente());
                out.println(a.getModelo().getNombre());
                out.println(a.getModelo().getMarca().name());
                out.println(a.getPasajeros());
                out.println(a.getPuertas());
                out.println(a.getPrecio());
                out.println(a.getCambios().name());
                out.println(a.getSedeRadicacion().getDomicilio());
                out.println(a.getSedeUbicacion().getDomicilio());
                String reserva = a.isReservado() ? "Reservado" : "Disponible";
                out.println(reserva);
                String alquiler = a.isAlquilado()? "Alquilado" : "Disponible";
                out.println(alquiler);
            }
        
        %>
    </body>
</html>
