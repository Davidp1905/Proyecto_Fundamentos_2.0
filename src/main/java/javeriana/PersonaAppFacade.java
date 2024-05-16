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
    
    public void cerrarConexion() {
        personaDAO.cerrarConexion();
    }
}


