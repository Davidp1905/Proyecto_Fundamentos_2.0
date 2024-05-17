<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Plata a tu Pocket</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        
    </head>
    <body>
        <h1>Tus Pockets</h1>
        <% 
            var documento = session.getAttribute("documento");
        %>
        <%
            List<javeriana.Bolsillo> bolsillos = (List<javeriana.Bolsillo>) session.getAttribute("bolsillos");
            if (bolsillos != null && !bolsillos.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>ID Bolsillo</th>
                    <th>Nombre</th>
                    <th>Saldo</th>
                </tr>
                <%
                    for (javeriana.Bolsillo bolsillo : bolsillos) {
                %>
                <tr>
                    <td><%= bolsillo.getIdBolsillo() %></td>
                    <td><%= bolsillo.getNombreBolsillo() %></td>
                    <td><%= bolsillo.getSaldoBolsillo() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else {
        %>
            <p>No tienes bolsillos.</p>
        <%
            }
        %>
        
        <br><br>
        
        <div class="container">
            <h1>Agregar Plata a tu Pocket</h1>
            <form action="AgregaPlataPocketServlet" method="POST">
                <label for="nombre">Nombre del Pocket:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="monto">Monto a agregar:</label>
                <input type="number" id="monto" name="monto" required>
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Agregar Plata</button>
            </form>
        </div>
        
        <br><br>
        <button onclick="window.location.href='menuPockets.jsp';">Volver al Menú Pockets</button>
    </body>
</html>

