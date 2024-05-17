<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu Usuario</title>
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
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .user-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .user-container h1 {
            color: var(--color1);
            margin-bottom: 20px;
        }

        .user-container button, .user-container a {
            padding: 10px 20px;
            margin: 10px;
            background-color: var(--color2);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .user-container button:hover, .user-container a:hover {
            background-color: var(--color3);
        }

        .hidden-input {
            display: none;
        }
    </style>
</head>
<body>
    <div class="user-container">
        <h1>Hola, Bienvenido a tu Menú FLAD</h1>
        
        <%
            // Verificar si el usuario está logueado y obtener el documento
            var documento = session.getAttribute("documento");
        %>
        
        <form action="VerCuenta" method="POST">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Tu Cuenta</button>
        </form>
        
        <form action="menuCreditos.jsp" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Tus Créditos</button>
        </form>
        
        <button onclick="window.location.href='menuTransacciones.jsp';">Transacciones</button>
        
        <form action="menuPockets.jsp" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Menú Pockets</button>
        </form>
        
        <form action="Notificaciones" method="post">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Notificaciones</button>
        </form>
        
        <form action="LogoutServlet" method="GET">
            <button type="submit">Cerrar Sesión</button>
        </form>
    </div>
</body>
</html>
