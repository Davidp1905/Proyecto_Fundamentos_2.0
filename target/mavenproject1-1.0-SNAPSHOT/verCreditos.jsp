<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Créditos</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        
    </head>
    <body>
        <%
            var documento = session.getAttribute("documento");
            
        %>
        <h1>Tus Créditos</h1>
        
        <%
            List<javeriana.Credito> creditos = (List<javeriana.Credito>) session.getAttribute("creditos");
            if (creditos != null && !creditos.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID Crédito</th>
                    <th>Monto Total</th>
                    <th>Saldo Pendiente</th>
                    <th>Tasa de Interés</th>
                    <th>Fecha de Vencimiento</th>
                </tr>
                <%
                    for (javeriana.Credito credito : creditos) {
                %>
                <tr>
                    <td><%= credito.getIdentificador() %></td>
                    <td><%= credito.getMontoTotal() %></td>
                    <td><%= credito.getSaldoPendiente() %></td>
                    <td><%= credito.getTasaInteres() %></td>
                    <td><%= credito.getFechaVencimiento() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No tienes créditos.</p>
        <%
            }
        %>
        
        <br><br>
        <button onclick="window.location.href='menuCreditos.jsp';">Volver al menú de créditos</button>
    </body>
</html>
