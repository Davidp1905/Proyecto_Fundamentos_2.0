<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pantalla de Administración</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Menu Jefes</h1>
    <h3>Seleccione una opción</h3>
    <form action="VerListadoClientesAdminServlet" method="post">
        <button type="submit">Ver listado de clientes</button>
    </form>
    <br>
    <form action="VerTransaccionesServlet" method="post">
        <button type="submit">Ver transacciones realizadas</button>
    </form>
    <br><br>
    <form action="LogoutServlet" method="get">
        <button type="submit">Cerrar Sesión</button>
    </form>
</body>
</html>
