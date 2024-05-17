<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu Jefes</title>
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

        .admin-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .admin-container h1 {
            color: var(--color1);
            margin-bottom: 20px;
        }

        .admin-container button, .admin-container a {
            padding: 10px 20px;
            margin: 5px;
            background-color: var(--color2);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .admin-container button:hover, .admin-container a:hover {
            background-color: var(--color3);
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h1>Menu Jefes</h1>
        <h2>Seleccione una opción</h2>
        <form action="VerListadoClientesAdminServlet" method="post" style="display: inline;">
            <button type="submit">Ver listado de clientes</button>
        </form>
        <form action="VerTransaccionesServlet" method="post" style="display: inline;">
            <button type="submit">Ver transacciones realizadas</button>
        </form>
        <form action="LogoutServlet" method="get" style="display: inline;">
            <button type="submit">Cerrar Sesión</button>
        </form>
    </div>
</body>
</html>
