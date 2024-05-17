<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        
        <%
        // Obtener la lista de transacciones desde la sesión
        List<javeriana.Transaccion> transaccionesHechas = (List<javeriana.Transaccion>) session.getAttribute("transaccionesHechas");
        List<javeriana.Transaccion> transaccionesRecibidas = (List<javeriana.Transaccion>) session.getAttribute("transaccionesRecibidas");
        
    %>
        <h1>Estas son tus Notificaciones FLAD!</h1>
        
        <h2>Transacciones Realizadas</h2>
        <%
            if (transaccionesHechas != null && !transaccionesHechas.isEmpty()) {
        %>
            <table border="1">
                <tr>
                    <th>ID Transacción</th>
                    <th>Monto</th>
                    <th>Cuenta Origen</th>
                    <th>Cuenta Destino</th>
                    <th>Fecha</th>
                </tr>
                <%
                    for (javeriana.Transaccion transaccion : transaccionesHechas) {
                %>
                <tr>
                    <td><%= transaccion.getIdentificador() %></td>
                    <td><%= transaccion.getMonto() %></td>
                    <td><%= transaccion.getDocumentoOrigen() %></td>
                    <td><%= transaccion.getDocumentoDestino() %></td>
                    <td><%= transaccion.getFecha() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No has realizado ninguna transacción.</p>
        <%
            }
        %>

        <h2>Transacciones Recibidas</h2>
        <%
            if (transaccionesRecibidas != null && !transaccionesRecibidas.isEmpty()) {
        %>
            <table border="1">
                <tr>
                    <th>ID Transacción</th>
                    <th>Monto</th>
                    <th>Cuenta Origen</th>
                    <th>Cuenta Destino</th>
                    <th>Fecha</th>
                </tr>
                <%
                    for (javeriana.Transaccion transaccion : transaccionesRecibidas) {
                %>
                <tr>
                    <td><%= transaccion.getIdentificador() %></td>
                    <td><%= transaccion.getMonto() %></td>
                    <td><%= transaccion.getDocumentoOrigen() %></td>
                    <td><%= transaccion.getDocumentoDestino() %></td>
                    <td><%= transaccion.getFecha() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No has recibido ninguna transacción.</p>
        <%
            }
        %>
        <br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </body>
</html>
