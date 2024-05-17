package javeriana;

import java.util.List;


public class BolsilloFacade {
    private BolsilloDAO bolsilloDAO;
    
     public BolsilloFacade() {
        this.bolsilloDAO = new BolsilloDAO();
    }

      public void nuevoBolsillo (String nombre, double saldo, int documento){
        bolsilloDAO.abrirConexion();
        bolsilloDAO.nuevoBolsillo (nombre, saldo, documento);
        bolsilloDAO.cerrarConexion();
      }
      
     public void agregarABolsillo(String nombre, double saldo, int documento){
        bolsilloDAO.abrirConexion();
        bolsilloDAO.agregarABolsillo (nombre, saldo, documento);
        bolsilloDAO.cerrarConexion();
     }
     public List<Bolsillo> obtenerBolsillos (int doc){
         bolsilloDAO.abrirConexion();
         List<Bolsillo> bolsillos = bolsilloDAO.obtenerBolsillos (doc);
         bolsilloDAO.cerrarConexion();
         return bolsillos;
     }
}
