<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
        <style>
            :root {
                --color1: #6CBEEB;
                --color2: #6C6EEB;
                --color3: #6199EA;
                --color4: #3DEEF5;
                --color5: #76EAE0;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
            }

            .register-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            .register-container h1 {
                color: var(--color1);
                margin-bottom: 20px;
            }

            .register-container label {
                display: block;
                text-align: left;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .register-container input[type="text"],
            .register-container input[type="password"],
            .register-container input[type="email"],
            .register-container input[type="tel"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .register-container button {
                padding: 10px 20px;
                background-color: var(--color2);
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                margin-top: 10px;
            }

            .register-container button:hover {
                background-color: var(--color3);
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <h1>Registro de Usuario</h1>
            <form action="SvUsuarios" method="POST"> 
                <p><label>Documento: </label> <input type="text" name="documento" required></p> 
                <p><label>Nombre: </label> <input type="text" name="nombre" required></p> 
                <p><label>Apellido: </label> <input type="text" name="apellido" required></p> 
                <p><label>Teléfono: </label> <input type="tel" name="telefono" required></p> 
                <p><label>Correo: </label> <input type="email" name="correo" required></p> 
                <p><label>Contraseña: </label> <input type="password" name="password" required></p> 
                <button type="submit">Registrar</button> 
            </form> 
        </div>
    </body>
</html>
