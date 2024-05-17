<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Realizar Transacción</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
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
        
        <br><br>
        <button onclick="window.location.href='interfazUsuario.jsp';">Volver al menú usuario</button>
    </form>
</body>
</html>
