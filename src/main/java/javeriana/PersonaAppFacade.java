package javeriana;


import java.util.List;

/**
 *
 * @author Orlando
 */
public class PersonaAppFacade {

    private  PersonaAppDAO personaDAO;

    public PersonaAppFacade() {
        this.personaDAO = new PersonaAppDAO();
    }

    
    public void insertarPersona(PersonaApp persona) {
        personaDAO.abrirConexion();
        personaDAO.insertarPersona(persona);
        personaDAO.cerrarConexion();
    }
    
    public List<PersonaApp> obtenerPersonas(){
        personaDAO.abrirConexion();
        List<PersonaApp> personas = personaDAO.obtenerPersonas();
        personaDAO.cerrarConexion();
        return personas;
    }
    
    public float traerCuentas(int doc){
        personaDAO.abrirConexion();
        float cuenta = personaDAO.traerCuentas(doc);
         personaDAO.cerrarConexion();
         return cuenta;
    }
    public void agregarSaldoCuenta(int doc, float saldo){
         personaDAO.abrirConexion();
        personaDAO.agregarSaldoCuenta(doc, saldo);
         personaDAO.cerrarConexion();
    }
    public void cerrarConexion() {
        personaDAO.cerrarConexion();
    }
}


