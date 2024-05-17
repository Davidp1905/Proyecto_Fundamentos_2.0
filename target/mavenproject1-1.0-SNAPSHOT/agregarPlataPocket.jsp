<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Plata a tu Pocket</title>
    <style>
        :root {
            --color1: #6CBEEB;
            --color2: #6C6EEB;
            --color3: #6199EA;
            --color4: #3DEEF5;
            --color5: #76EAE0;
        }

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: var(--color1);
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid var(--color2);
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: var(--color3);
            color: white;
        }

        tr:nth-child(even) {
            background-color: var(--color4);
        }

        tr:nth-child(odd) {
            background-color: var(--color5);
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 50%;
            text-align: center;
        }

        .container label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }

        .container input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid var(--color2);
            border-radius: 5px;
        }

        .container button {
            padding: 10px 20px;
            background-color: var(--color2);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .container button:hover {
            background-color: var(--color3);
        }

        button {
            padding: 10px 20px;
            background-color: var(--color2);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: var(--color3);
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
