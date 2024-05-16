<%-- 
    Document   : interfazUsuario
    Created on : 13/05/2024, 5:42:22 p. m.
    Author     : Usuario Autorizado
--%>

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
        <title>JSP Page</title>
        <style>
    button, a {
        padding: 8px 16px;
        text-decoration: none;
        color: white;
        background-color: #007BFF;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    a {
        display: inline-block;
    }
</style>
    </head>
    <body>
        <h1>Bienvenido a tu Interfaz de Usuario hola</h1>
        
    <%
        // Verificar si el usuario está logueado y obtener el documento
        String documento = (String)session.getAttribute("documento");
        if (documento == null) {
            // No hay sesión de usuario o el documento no está en la sesión, redirigir al login
            response.sendRedirect("login.jsp");
        } else {
            out.println("<p>Tu documento es: " + documento + "</p>"); // Mostrar el documento del usuario
        }
    %>
    <br>
    
    <form action="LogoutServlet" method="GET">
        <button type="submit">Cerrar Sesión</button>
    </form>
    


    </body>
</html>
