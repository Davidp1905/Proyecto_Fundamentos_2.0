<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Créditos</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
         <%
            var documento = session.getAttribute("documento");
            
        %>
        <div class="container">
            <h1>Menú de Créditos</h1>
            
            <form action="VerCreditosServlet" method="POST">
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Mira tus Créditos</button>
            </form>
            
            <form action="tomarCredito.jsp" method="GET">
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Toma un Crédito</button>
            </form>
            
            <form action="VerCreditosParaPagar" method="POST">
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Paga tu Crédito</button>
            </form>
                
                <br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
        </div>
    </body>
</html>
