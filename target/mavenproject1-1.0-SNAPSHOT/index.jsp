<%-- 
    Document   : index
    Created on : 12/05/2024, 10:32:10 p. m.
    Author     : Usuario Autorizado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Datos de cliente</h1>
        <form action="SvUsuarios" method="POST"> 
             <p><label>Documento: </label><input type="text" name="documento"></p>
            <p><label>Nombre: </label><input type="text" name="nombre"></p>
            <p><label>Apellido: </label><input type="text" name="apellido"></p>
            <p><label>Password: </label><input type="password" name="password"></p>
            <p><label>Email: </label><input type="email" name="email"></p>
            <p><label>Teléfono: </label><input type="text" name="telefono"></p>
            <button type="submit" >Enviar</button> 
        </form> 
        
    
    </body>
</html>
