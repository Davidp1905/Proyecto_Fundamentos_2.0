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
import javeriana.PersonaAppFacade;

@WebServlet(name = "VerListadoClientesAdminServlet", urlPatterns = {"/VerListadoClientesAdminServlet"})
public class VerListadoClientesAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.
        
        //String password = request.getParameter("contraseña");
        
        try {
            
           /* PersonaAppFacade personaAppFacade = new PersonaAppFacade();
        List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

        request.setAttribute("personas", personas); // Pasar la lista de personas al JSP
        request.getRequestDispatcher("verListadoPersonas.jsp").forward(request, response);
        */
            PersonaAppFacade personaAppFacade = new PersonaAppFacade();
            List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

            HttpSession session = request.getSession(true);
            session.setAttribute("personas", personas);
            

            response.sendRedirect("verListadoPersonas.jsp");
            
//request.getRequestDispatcher("verListadoPersonas.jsp").forward(request, response);
       
        
        
        
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
        
        
        
    }
}
