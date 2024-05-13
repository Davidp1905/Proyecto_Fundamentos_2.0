package javeriana;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



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

    
    public void cerrarConexion() {
        personaDAO.cerrarConexion();
    }
}


