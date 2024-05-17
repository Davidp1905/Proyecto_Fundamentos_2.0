<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitar Nuevo Crédito</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        
        <script>
            function calcularInteres() {
                var monto = document.getElementById("monto").value;
                var interes = 0;

                if (monto <= 100000) {
                    interes = 2;
                } else if (monto <= 1000000) {
                    interes = 3.5;
                } else if (monto <= 10000000) {
                    interes = 5;
                } else {
                    interes = 8;
                }

                document.getElementById("interes").value = interes;
            }

            function calcularFechaVencimiento() {
                var fechaActual = new Date();
                var mes = fechaActual.getMonth();
                var año = fechaActual.getFullYear();

                // Añadir 6 meses
                mes += 6;

                // Ajustar el año si el mes es mayor que 11 (diciembre)
                if (mes > 11) {
                    mes -= 12;
                    año += 1;
                }

                // Formatear la fecha como YYYY-MM-DD
                var fechaVencimiento = new Date(año, mes, fechaActual.getDate());
                var dia = fechaVencimiento.getDate();
                var mes = fechaVencimiento.getMonth() + 1; // Los meses en JavaScript son 0-11
                var año = fechaVencimiento.getFullYear();

                if (dia < 10) {
                    dia = '0' + dia;
                }
                if (mes < 10) {
                    mes = '0' + mes;
                }

                var fechaFormateada = año + '-' + mes + '-' + dia;
                document.getElementById("fechaVencimiento").value = fechaFormateada;
            }

            window.onload = function() {
                calcularFechaVencimiento();
            };
        </script>
    </head>
    <body>
        <%
            var documento = session.getAttribute("documento");
            
        %>
        <div class="container">
            <h1>Solicitar Nuevo Crédito</h1>
            <form action="TomaCreditoServlet" method="POST">
                <label for="monto">Monto:</label>
                <input type="number" id="monto" name="monto" required oninput="calcularInteres()">
                
                <label for="interes">Interés (%):</label>
                <input type="text" id="interes" name="interes" readonly>
                
                <input type="hidden" name="documento" value="<%= documento %>">
                 
                <label for="fechaVencimiento">Fecha de Vencimiento:</label>
                <input type="date" id="fechaVencimiento" name="fechaVencimiento" readonly>
                
                <button type="submit">Solicitar Crédito</button> <br>
                <button onclick="window.location.href='menuCreditos.jsp';">Volver al menú de créditos</button>
            </form>
        </div>
    </body>
</html>
