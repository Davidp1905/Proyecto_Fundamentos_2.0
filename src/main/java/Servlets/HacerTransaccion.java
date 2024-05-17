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
@WebServlet(name = "HacerTransaccion", urlPatterns = {"/HacerTransaccion"})
public class HacerTransaccion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) 
            throws jakarta.servlet.ServletException, IOException {
       
        String documentoOrigen = request.getParameter("documentoOrigen");
        String monto = request.getParameter("monto");
        String documentoDestino = request.getParameter("documentoDestino");
        
        
        int documentoOrigenLong = Integer.parseInt(documentoOrigen);
        int documentoDestinoLong = Integer.parseInt(documentoDestino);
        double montoLong = Integer.parseInt(monto);
        
        
       // double monto, int documentoOrigen, int documentoDestino
        Transaccion transaccion = new Transaccion(montoLong,documentoOrigenLong, documentoDestinoLong);
        TransaccionFacade tf = new TransaccionFacade(); 
        tf.hacerTransaccion(transaccion);
        
        response.sendRedirect("interfazUsuario.jsp");
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
//Haz el jsp que me pida los 3 datos: documento origen, documento final y monto y que envíe el resultado al servlet
}
