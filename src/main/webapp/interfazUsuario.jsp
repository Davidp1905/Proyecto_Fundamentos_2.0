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
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
<body>
        <h1>Hola, Bienvenido a tu Menú FLAD</h1>
        
    <%
        // Verificar si el usuario está logueado y obtener el documento
        /*
        if (documento == null) {
            // No hay sesión de usuario o el documento no está en la sesión, redirigir al login
            response.sendRedirect("login.jsp");
        } else {
            out.println("<p>Tu documento es: " + documento + "</p>"); // Mostrar el documento del usuario
        }*/
        var documento = session.getAttribute("documento");
    %>
    
    
   
    <br> 
     <form action="VerCuenta" method="POST">
         <input type="hidden" name="documento" value="<%= documento %>">
        <button type="submit">Tu Cuenta</button>
    </form>
    
    
    
   <br>
    <form action="menuCreditos.jsp" method="GET">
        <input type="hidden" name="documento" value="<%= documento %>">
        <button type="submit">Tus Créditos</button>
    </form>
    <br>
    
    <button onclick="window.location.href='menuTransacciones.jsp';">Transacciones</button>
   
    
    <br><br>
    <form action="menuPockets.jsp" method="GET">
        <input type="hidden" name="documento" value="<%= documento %>">
        <button type="submit">Menú Pockets</button>
    </form>
    <br>

     <form action="Notificaciones" method="post">
         <input type="hidden" name="documento" value="<%= documento %>">
        <button type="submit">Notificaciones</button>
    </form>
    <br>
    
    
    
    <form action="LogoutServlet" method="GET">
        <button type="submit">Cerrar Sesión</button>
    </form>
    


    </body>
</html>
