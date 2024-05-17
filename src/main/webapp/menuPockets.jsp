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
        <style>
            button {
                padding: 8px 16px;
                text-decoration: none;
                color: white;
                background-color: #007BFF;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Menú Pockets</h1>

        <%
            String documento = (String) session.getAttribute("documento");
            if (documento == null) {
                response.sendRedirect("login.jsp");
            }
        %>

        <form action="VerPockets" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Revisa tus Pockets</button>
        </form>

        <form action="CreaTuPocketServlet" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Crea tu Pocket</button>
        </form>

        <form action="AgregaPlataPocketServlet" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Agrega Plata a tu Pocket</button>
        </form>

        <form action="RetiraPlataPocketServlet" method="GET">
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Retira Plata de tu Pocket</button>
        </form>
<br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </body>
</html>