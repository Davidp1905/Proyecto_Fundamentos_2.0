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
        // Establecer las cabeceras para evitar caché
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.
        
        String documento = request.getParameter("documento");
        String password = request.getParameter("password");
       
        try {
            // Casteamos el documento a long
            long documentoLong = Integer.parseInt(documento);


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

           
            if (valido) {
                // Si las credenciales son correctas
                HttpSession session = request.getSession(true);
                session.setAttribute("usuarioLogueado", true);
                session.setAttribute("documento", documento);
                session.setAttribute("cargo", cargo);
                 
                if ("User".equalsIgnoreCase(cargo)){
                    System.out.println("El cargo de hoy es:" + cargo);
                    response.sendRedirect("interfazUsuario.jsp"); 
                    
                } else if ("CEO".equalsIgnoreCase(cargo)){    
                    System.out.println("El cargo de hoy es:" + cargo);
                    response.sendRedirect("adminScreen.jsp"); 
                    
                }  
            } else {
                HttpSession session = request.getSession(false);
                if(session != null){
                    session.invalidate();
                }
                // Si las credenciales son incorrectas
                response.sendRedirect("login.jsp?error=true"); // Volver al login y mostrar error
            }
        } catch (NumberFormatException e) {
        // Manejar la excepción de formato de número
        response.sendRedirect("login.jsp?error=true");
        }
    }
}
