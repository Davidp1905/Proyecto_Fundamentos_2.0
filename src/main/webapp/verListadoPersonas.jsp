<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Personas</title>
</head>
<body>
    <h1>Listado de Personas</h1>
    <table border="1">
        <tr>
            <th>Documento</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
        </tr>
        <c:forEach var="persona" items="${personas}">
            <tr>
                <td>${persona.documento}</td>
                <td>${persona.nombre}</td>
                <td>${persona.apellido}</td>
                <td>${persona.email}</td>
                <td>${persona.telefono}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
