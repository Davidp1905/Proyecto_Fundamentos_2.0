<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Consigna a tu Cuenta FLAD</title>
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

        h3 {
            color: var(--color2);
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 50%;
            text-align: center;
        }

        .container form {
            margin-top: 20px;
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
    <h1>Consigna a tu Cuenta FLAD</h1>

    <%
        float saldo = (float) session.getAttribute("saldo");
        int documento = (int) session.getAttribute("documento");
    %>

    <h3>Saldo actual: <%= saldo %></h3>

    <div class="container">
        <form action="ConsignarCuenta" method="POST">
            <label for="cantidad">Cantidad a Consignar:</label>
            <input type="text" id="cantidad" name="cantidad" required>

            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Consignar a Cuenta</button>
        </form>
    </div>

    <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
</body>
</html>
