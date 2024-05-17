<%-- 
    Document   : menuPockets
    Created on : 17/05/2024, 1:23:57 a. m.
    Author     : Usuario Autorizado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Pockets</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Menú Pockets</h1>

        <%
            var documento = session.getAttribute("documento");
            
        %>

        <form action="VerPockets" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Revisa tus Pockets</button>
        </form>

        <form action="crearPocket.jsp" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Crea tu Pocket</button>
        </form>

        <form action="VerParaAgregarPockets" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Agrega Plata a tu Pocket</button>
        </form>

        <form action="VerParaRetirarPlataDePocket" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Retira Plata de tu Pocket</button>
        </form>
<br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </body>
</html>