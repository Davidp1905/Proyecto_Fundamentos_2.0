
package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javeriana.*;


/**
 *
 * @author Usuario Autorizado
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
       /*  <p><label>Documento: </label><input type="text" name="documento"></p>
            <p><label>Nombre: </label><input type="text" name="nombre"></p>
            <p><label>Apellido: </label><input type="text" name="apellido"></p>
            <p><label>Password: </label><input type="password" name="password"></p>
            <p><label>Email: </label><input type="email" name="email"></p>
            <p><label>Teléfono: </label><input type="text" name="telefono"></p>
        */
       
        String documento = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String password = request.getParameter("password");
        String email = request.getParameter("correo");  
        String telefono = request.getParameter("telefono"); 
        
        long documentoLong = Integer.parseInt(documento);
        long telefonoLong = Integer.parseInt(telefono);
        //String cargo = "Cliente";
        
        
        //Toca convertir a long el telefono xd
        // String nombre, String apellido, long documento, String password, String email, long telefono
        PersonaApp persona1 = new PersonaApp(nombre, apellido, documentoLong, password, email, telefonoLong);
        PersonaAppFacade personaAppFacade = new PersonaAppFacade(); 
        personaAppFacade.insertarPersona(persona1);
        
        response.sendRedirect("inicio.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
