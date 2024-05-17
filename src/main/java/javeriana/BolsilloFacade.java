package javeriana;

import java.util.List;


public class BolsilloFacade {
    private BolsilloDAO bolsilloDAO;
    
     public BolsilloFacade() {
        this.bolsilloDAO = new BolsilloDAO();
    }

     public List<Bolsillo> obtenerBolsillos (int doc){
         bolsilloDAO.abrirConexion();
         List<Bolsillo> bolsillos = bolsilloDAO.obtenerBolsillos (doc);
         bolsilloDAO.cerrarConexion();
         return bolsillos;
     }
}
