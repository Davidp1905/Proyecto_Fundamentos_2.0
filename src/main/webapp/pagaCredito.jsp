<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Créditos</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 300px;
                margin: 0 auto;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-top: 10px;
            }
            input[type="text"], input[type="number"] {
                padding: 8px;
                margin-top: 5px;
            }
            button {
                padding: 10px;
                margin-top: 20px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
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
        
        
        <div class="container">
            <h1>Pagar Crédito</h1>
            <form action="PagaCreditoServlet" method="POST">
                <label for="idCredito">ID del Crédito:</label>
                <input type="text" id="idCredito" name="idCredito" required>
                
                <label for="cantidad">Cantidad a Pagar:</label>
                <input type="number" id="cantidad" name="cantidad" required>
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Pagar Crédito</button>
            </form>
        </div>
        
        <br><br>
        <button onclick="window.location.href='menuCreditos.jsp';">Me arrepentí, No Hay Plata</button>
    </body>
</html>
