<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crea tu Pocket</title>
        <style>
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
        <div class="container">
            <h1>Crea tu Pocket</h1>
            <form action="CreaTuPocketServlet" method="POST">
                <label for="nombre">Nombre del Pocket:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="saldo">Saldo a ponerle:</label>
                <input type="number" id="saldo" name="saldo" required>
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Crear Pocket</button>
            </form>
        </div>
                <br><br>
        <button onclick="window.location.href='menuPockets.jsp';">Volver al Menú Pockets</button>
    </body>
</html>
