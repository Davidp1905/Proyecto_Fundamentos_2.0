<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crea tu Pocket</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
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
