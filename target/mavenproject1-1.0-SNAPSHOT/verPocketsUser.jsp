<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Pockets</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <h1>Tus Bolsillos</h1>
        
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
        <button onclick="window.location.href='menuPockets.jsp';">Volver al Menú Pockets</button>
    </body>
</html>

