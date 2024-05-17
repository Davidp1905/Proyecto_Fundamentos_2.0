<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Notificaciones FLAD</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
        }
        h1, h2 {
            color: #007BFF;
            margin-bottom: 20px;
            font-size: 24px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Estas son tus Notificaciones FLAD!</h1>

        <h2>Transacciones Realizadas</h2>
        <%
            List<javeriana.Transaccion> transaccionesHechas = (List<javeriana.Transaccion>) session.getAttribute("transaccionesHechas");
            if (transaccionesHechas != null && !transaccionesHechas.isEmpty()) {
        %>
            <table>
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
            List<javeriana.Transaccion> transaccionesRecibidas = (List<javeriana.Transaccion>) session.getAttribute("transaccionesRecibidas");
            if (transaccionesRecibidas != null && !transaccionesRecibidas.isEmpty()) {
        %>
            <table>
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

        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </div>
</body>
</html>
