<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Retirar Plata a tu Pocket</title>
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
            max-width: 600px;
            margin-top: 20px;
        }
        h1 {
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
        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
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
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
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

    <div class="container">
        <h1>Retirar Plata a tu Pocket</h1>
        <form action="RetirarPlataPocketServlet" method="POST">
            <label for="nombre">Nombre del Pocket:</label>
            <input type="text" id="nombre" name="nombre" required>
            
            <label for="monto">Monto a retirar:</label>
            <input type="number" id="monto" name="monto" required>
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Retirar de Pocket</button>
        </form>
    </div>

    <button onclick="window.location.href='menuPockets.jsp';">Volver al Menú Pockets</button>
</body>
</html>
