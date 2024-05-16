<%-- 
    Document   : adminDashboard
    Created on : 16/05/2024, 2:57:05 p. m.
    Author     : Usuario Autorizado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Interfaz ADmin UwU hola2</h1>
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
    </body>
</html>
