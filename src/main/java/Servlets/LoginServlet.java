package Servlets;

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
    System.out.println("Documento: " + documento + ", Password: " + password);

            PersonaAppFacade personaAppFacade = new PersonaAppFacade(); 

            List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

            boolean valido = false;
            String cargo =""; 
           // Recorre la lista de personas que obtuvo de la base de datos 
            // Busca al usuario y contraseña que se trata de loguear
            for(PersonaApp persona : personas){
                if(persona.getDocumento() == documentoLong && persona.getPassword().equals(password)){
                    valido = true;
                    cargo = persona.getCargo();
                    System.out.println("Persona: " +persona.getDocumento()+  "Contrseña: " +persona.getPassword() + " CARGO: " + cargo);
                    break;
                }
            }

            for(PersonaApp p: personas){
                System.out.println("Nombre " + p.getNombre() + " Apellido " + p.getApellido() + " Cargo " + p.getCargo()  );
            }
            if (valido) {
                // Si las credenciales son correctas
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogueado", true);
                session.setAttribute("documento", documento);
                
                
                if ("User".equalsIgnoreCase(cargo)){
                    System.out.println("El cargo de hoy es:" + cargo);
                    response.sendRedirect("interfazUsuario.jsp"); // Redirigir a la interfaz del ususario
                    
                } else {    
                    System.out.println("El cargo de hoy es:" + cargo);
                    response.sendRedirect("adminDashboard.jsp"); // Redirigir a la interfaz del admin
                    
                }
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
