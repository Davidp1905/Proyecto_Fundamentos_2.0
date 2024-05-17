<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Transacciones</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Listado de Transacciones</h1>
    <%
        // Obtener la lista de transacciones desde la sesión
        List<javeriana.Transaccion> transacciones = (List<javeriana.Transaccion>) session.getAttribute("transacciones");

        // Verificar si la lista no está vacía
        if (transacciones != null && !transacciones.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>ID Transacción</th>
            <th>Monto</th>
            <th>Cuenta Origen</th>
            <th>Cuenta Destino</th>
            <th>Fecha</th>
        </tr>
        <%
            // Iterar sobre la lista de transacciones y mostrarlas en la tabla
            for (javeriana.Transaccion transaccion : transacciones) {
        %>
        <tr>
            <td><%= transaccion.getIdentificador() %></td>
            <td><%= transaccion.getMonto() %></td>
            <td><%= transaccion.getDocumentoOrigen() %></td>
            <td><%= transaccion.getDocumentoDestino() %></td>
            <td><%= transaccion.getFecha() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
    <p>No se encontraron transacciones.</p>
    <%
        }
    %>
</body>
</html>
