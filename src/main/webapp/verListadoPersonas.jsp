<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Personas</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Listado de Personas</h1>
    <%
        // Obtener la lista de personas desde la sesión
        List<javeriana.PersonaApp> personas = (List<javeriana.PersonaApp>) session.getAttribute("personas");

        // Verificar si la lista no está vacía
        if (personas != null && !personas.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>Documento</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
        </tr>
        <%
            // Iterar sobre la lista de personas y mostrarlas en la tabla
            for (javeriana.PersonaApp persona : personas) {
        %>
        <tr>
            <td><%= persona.getDocumento() %></td>
            <td><%= persona.getNombre() %></td>
            <td><%= persona.getApellido() %></td>
            <td><%= persona.getEmail() %></td>
            <td><%= persona.getTelefono() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
    <p>No se encontraron personas.</p>
    <%
        }
    %>
</body>
</html>
