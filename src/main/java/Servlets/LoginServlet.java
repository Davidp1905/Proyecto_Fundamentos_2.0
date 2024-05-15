import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import javeriana.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String documento = request.getParameter("documento");
        String password = request.getParameter("password");
        
        try {
            // Casteamos el documento a long
            long documentoLong = Integer.parseInt(documento);

            PersonaAppFacade personaAppFacade = new PersonaAppFacade(); 

            List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

            boolean valido = false;
            // Recorre la lista de personas que obtuvo de la base de datos 
            // Busca al usuario y contraseña que se trata de loguear
            for(PersonaApp persona : personas){
                if(persona.getDocumento() == documentoLong && persona.getPassword().equals(password)){
                    valido = true;
                    break;
                }
            }

         
            if (valido) {  
                
                // preguntar si es usuario
                // Si las credenciales son correctas
       
                HttpSession session = request.getSession();
                session.setAttribute("documento", documento);
                response.sendRedirect("interfazUsuario.jsp"); // Redirigir a la interfaz del ususario
                
                
                // Si no es usuario mandar al menu de ADMIN ->toca crearlo
            } else {
                // Si las credenciales son incorrectas
                response.sendRedirect("login.jsp?error=true"); // Volver al login y mostrar error
            }
        } catch (NumberFormatException e) {
        // Manejar la excepción de formato de número
        response.sendRedirect("login.jsp?error=true");
        }
    }
}
