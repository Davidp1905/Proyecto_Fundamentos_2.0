
package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import javeriana.*;


@WebServlet(name = "ConsignarCuenta", urlPatterns = {"/ConsignarCuenta"})
public class ConsignarCuenta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String documento = request.getParameter("documento");
        
        int doc = Integer.parseInt(documento);
        float cantidad = Float.parseFloat(request.getParameter("cantidad"));

        PersonaAppFacade p = new PersonaAppFacade(); 
        p.agregarSaldoCuenta(doc, cantidad);
        HttpSession session = request.getSession(true);
        session.setAttribute("documento", doc);

        response.sendRedirect("interfazUsuario.jsp");
        
        
    }



}
