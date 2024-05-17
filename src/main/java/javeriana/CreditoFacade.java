package javeriana;

import java.util.ArrayList;
import java.util.List;

public class CreditoFacade {
    private CreditoDAO creditoDAO;
    
    
    public CreditoFacade() {
        this.creditoDAO = new CreditoDAO();
    }
    
    public void tomarCredito(double monto, int documento, float interes){
        creditoDAO.abrirConexion();
        creditoDAO.tomarCredito(monto, documento, interes);
        creditoDAO.cerrarConexion();
    }
    public void pagarCredito(int idCredito, int documento, double cantidad){
        creditoDAO.abrirConexion();
        creditoDAO.pagarCredito(idCredito, documento, cantidad);
        creditoDAO.cerrarConexion();
    }
    public List<Credito> traerCreditos(int doc){
        creditoDAO.abrirConexion();
        List<Credito> creditos = creditoDAO.traerCreditos(doc);
        creditoDAO.cerrarConexion();
        return creditos;
    }
        
    
    
    
    
    
    
    
}
