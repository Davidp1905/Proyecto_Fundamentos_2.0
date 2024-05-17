/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javeriana.*;
import javeriana.PersonaAppFacade;

/**
 *
 * @author Usuario Autorizado
 */
@WebServlet(name = "VerTransaccionesServlet", urlPatterns = {"/VerTransaccionesServlet"})
public class VerTransaccionesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
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
        
        response.sendRedirect("verTransacciones.jsp");
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
