<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestión de Créditos</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #333333;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 15px;
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
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Menú de Créditos</h1>
        <%
            var documento = session.getAttribute("documento");
        %>
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
        
        <div class="back-button">
            <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
        </div>
    </div>
</body>
</html>
