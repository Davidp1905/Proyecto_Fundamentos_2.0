<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Realizar Transacción</title>
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
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #007BFF;
            margin-bottom: 20px;
            font-size: 24px;
        }
        form {
            width: 100%;
        }
        p {
            text-align: left;
        }
        label {
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
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
        <h1>Realizar Transacción</h1>
        <form action="HacerTransaccion" method="POST">
            <p>
                <label for="documentoOrigen">Confirme su documento:</label>
                <input type="text" id="documentoOrigen" name="documentoOrigen" required>
            </p>
            <p>
                <label for="monto">Monto:</label>
                <input type="text" id="monto" name="monto" required>
            </p>
            <p>
                <label for="documentoDestino">Documento Destinatario:</label>
                <input type="text" id="documentoDestino" name="documentoDestino" required>
            </p>
            <button type="submit">Enviar</button>
        </form>
        <div class="back-button">
            <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
        </div>
    </div>
</body>
</html>
