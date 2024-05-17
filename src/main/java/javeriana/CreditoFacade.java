package javeriana;

import java.util.ArrayList;
import java.util.List;

public class CreditoFacade {
    private CreditoDAO creditoDAO;
    
    
    public CreditoFacade() {
        this.creditoDAO = new CreditoDAO();
    }
    
    
    public List<Credito> traerCreditos(int doc){
        creditoDAO.abrirConexion();
        List<Credito> creditos = creditoDAO.traerCreditos(doc);
        creditoDAO.cerrarConexion();
        return creditos;
    }
        
    
    
    
    
    
    
    
}
