package javeriana;

import java.util.List;


public class TransaccionFacade {
    
    private  TransaccionDAO transaccionDAO;
    
    public TransaccionFacade() {
        this.transaccionDAO = new TransaccionDAO();
    }
    
    public void hacerTransaccion(Transaccion transaccion) {
        transaccionDAO.abrirConexion();
        transaccionDAO.hacerTransaccion(transaccion);
        transaccionDAO.cerrarConexion();
    }
    
    public List<Transaccion> obtenerTransacciones(){
        transaccionDAO.abrirConexion();
        List<Transaccion> transacciones = transaccionDAO.obtenerTransacciones();
        transaccionDAO.cerrarConexion();
        return transacciones;
    }
    
}
