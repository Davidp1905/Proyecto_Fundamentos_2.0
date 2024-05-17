<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Consigna a tu Cuenta FLAD</h1>
        
        <%
        
        float saldo  = (float) session.getAttribute("saldo");
       //String doc = (String)session.getAttribute("documento");
       //int documento = Integer.parseInt(doc);session.getAttribute("documento");
       int documento = (int)session.getAttribute("documento");
    %>

    <h3>Saldo actual: <%= saldo %></h3>
        
        <form action="ConsignarCuenta" method="POST">
            <p>
                <label for="cantidad">Cantidad a Consignar:</label>
                <input type="text" id="cantidad" name="cantidad" required>
            </p>
            
            <input type="hidden" name="documento" value="<%= documento %>">
            <button type="submit">Consignar a Cuenta</button>
        </form>
            <br><br>
            <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </body>
</html>
