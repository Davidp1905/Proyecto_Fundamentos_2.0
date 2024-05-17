<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Personas</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
        }
        h1 {
            color: #007BFF;
            margin-bottom: 20px;
            font-size: 24px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Personas</h1>
        <%
            // Obtener la lista de personas desde la sesión
            List<javeriana.PersonaApp> personas = (List<javeriana.PersonaApp>) session.getAttribute("personas");

            // Verificar si la lista no está vacía
            if (personas != null && !personas.isEmpty()) {
        %>
        <table>
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
        <button onclick="window.location.href='adminScreen.jsp';">Volver al menú de Admin</button>
    </div>
</body>
</html>
