<%-- 
    Document   : adminDashboard
    Created on : 16/05/2024, 2:57:05 p. m.
    Author     : Usuario Autorizado


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pantalla de Administración</title>
    </head>
    <body>
        <form action="VerListadoClientesAdminServlet" method="post">
            <button type="submit">Ver listado de clientes</button>
        </form>
        
       // <button onclick="window.location.href='verListadoPersonas.jsp';">Ver Clientes</button>


        <p><a href="VerTransacciones">Ver transacciones realizadas</a></p>  <!-- Asumiendo que también deseas un enlace para esto -->
    
        <form action="LogoutServlet" method="GET">
            <button type="submit">Cerrar Sesión</button>
        </form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pantalla de Administración</title>
</head>
<body>
     
    <button onclick="window.location.href='verificarAdminListado.jsp';">Ver listado de clientes</button>

    <p><a href="VerTransacciones">Ver transacciones realizadas</a></p>  <!-- Asumiendo que también deseas un enlace para esto -->

    <form action="LogoutServlet" method="get">
        <button type="submit">Cerrar Sesión</button>
    </form>
</body>
</html>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pantalla de Administración</title>
</head>
<body>
    <form action="VerListadoClientesAdminServlet" method="post">
        <button type="submit">Ver listado de clientes</button>
    </form>

    <form action="VerTransacciones" method="post">
        <button type="submit">Ver transacciones realizadas</button>
    </form>
    
    <form action="LogoutServlet" method="get">
        <button type="submit">Cerrar Sesión</button>
    </form>
</body>
</html>
