package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javeriana.PersonaApp;
import javeriana.PersonaAppFacade;

@WebServlet(name = "VerListadoClientesAdminServlet", urlPatterns = {"/VerListadoClientesAdminServlet"})
public class VerListadoClientesAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PersonaAppFacade personaAppFacade = new PersonaAppFacade();
        List<PersonaApp> personas = personaAppFacade.obtenerPersonas();

        request.setAttribute("personas", personas);
        request.getRequestDispatcher("verListadoPersonas.jsp").forward(request, response);
    }
}
