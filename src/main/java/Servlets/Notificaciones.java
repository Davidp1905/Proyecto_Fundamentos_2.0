package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javeriana.*;


@WebServlet(name = "Notificaciones", urlPatterns = {"/Notificaciones"})
public class Notificaciones extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.
        try {
            TransaccionFacade transaccionF = new TransaccionFacade();
            List<Transaccion> transacciones = transaccionF.obtenerTransacciones();
            String documento = request.getParameter("documento");
        
            int doc = Integer.parseInt(documento);
            List<Transaccion> transaccionesHechas = new ArrayList<Transaccion>();
            List<Transaccion> transaccionesRecibidas = new ArrayList<Transaccion>();

            TransaccionFacade tr = new TransaccionFacade();
            
            transaccionesHechas = tr.transaccionesHechas(doc);
            transaccionesRecibidas = tr.transaccionesRecibidas(doc); 
            
            HttpSession session = request.getSession(true);
            session.setAttribute("transaccionesHechas", transaccionesHechas);
            session.setAttribute("transaccionesRecibidas", transaccionesRecibidas);
            
            response.sendRedirect("verNotificaciones.jsp");
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
