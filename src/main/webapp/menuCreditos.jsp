<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Créditos</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 300px;
                margin: 0 auto;
                text-align: center;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            button {
                padding: 10px 20px;
                margin: 10px 0;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
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
            
            <form action="PagaCreditoServlet" method="POST">
                <input type="hidden" name="documento" value="<%= documento %>">
                <button type="submit">Paga tu Crédito</button>
            </form>
                
                <br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
        </div>
    </body>
</html>
