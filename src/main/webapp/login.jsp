<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login to Banco FLAD</h1>

    <% if ("true".equals(request.getParameter("error"))) { %>
        <p style="color:red;">Documento o contraseña incorrecta, por favor intente de nuevo.</p>
    <% } %>

    <form action="LoginServlet" method="POST">
        <label for="documento">Documento:</label>
        <input type="text" id="documento" name="documento" required><br><br>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Iniciar sesión">
    </form>
</body>
</html>
