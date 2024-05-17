<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login to Banco FLAD</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
            }
            .login-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .login-container h1 {
                color: var(--color1);
                margin-bottom: 20px;
            }
            .login-container label {
                display: block;
                text-align: left;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .login-container button {
                padding: 10px 20px;
                background-color: var(--color2);
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            .login-container button:hover {
                background-color: var(--color3);
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Login to Banco FLAD</h1>
            <form action="LoginServlet" method="POST">
                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Iniciar sesión</button>
            </form>
        </div>
    </body>
</html>
