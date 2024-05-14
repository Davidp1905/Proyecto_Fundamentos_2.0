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
            long documentoLong = Integer.parseInt(documento);

              System.out.println("Docuemnto leido: " + documentoLong + " contraseña: " + password);

            PersonaAppFacade personaAppFacade = new PersonaAppFacade(); 

            List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

            for(PersonaApp persona : personas){
                System.out.println("\nPersonas: " + persona.getNombre() + "Apellido" + persona.getApellido() + "Telefono" + persona.getTelefono());
            }
            boolean valido = false;
            for(PersonaApp persona : personas){
                if(persona.getDocumento() == documentoLong && persona.getPassword().equals(password)){
                    valido = true;
                    persona.toString();
                    break;
                }
            }

            // Aquí se debe implementar la lógica de validación de las credenciales
            // Por ejemplo, verificar contra una base de datos
            if (valido) {  
                // Si las credenciales son correctas
                System.out.println("Si sirve");
                HttpSession session = request.getSession();
                session.setAttribute("documento", documento);
                response.sendRedirect("interfazUsuario.jsp"); // Redirigir al dashboard
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
