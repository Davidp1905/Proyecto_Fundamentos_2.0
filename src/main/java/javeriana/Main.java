/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;

/**
 *
 * @author Orlando
 */
import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

class Persona {

    private int id;
    private String nombre;
    private String direccion;
    private String telefono;

    public Persona(int id, String nombre, String direccion, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}

class PersonaFacade {

    private PersonaDAO personaDAO;

    public PersonaFacade() {
        this.personaDAO = new PersonaDAO();
    }

    public List<Persona> obtenerTodasLasPersonas() {
        return personaDAO.obtenerPersonas();
    }

    public void insertarPersona(Persona persona) {
        personaDAO.insertarPersona(persona);
    }

    public void actualizarPersona(Persona persona) {
        personaDAO.actualizarPersona(persona);
    }

    public void eliminarPersona(int idPersona) {
        personaDAO.eliminarPersona(idPersona);
    }

    public void cerrarConexion() {
        personaDAO.cerrarConexion();
    }
}

class PersonaDAO {

    private Connection connection;

    public PersonaDAO() {
        // Inicializar la conexión a la base de datos
        String url = "jdbc:mysql://localhost:3306/pruebasxd";
        String username = "root";
        String password = "";
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void cerrarConexion() {
        try {
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List<Persona> obtenerPersonas() {
        List<Persona> personas = new ArrayList<>();
        try {
            // Ejecutar consulta para obtener todas las personas
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM personas");

            // Procesar resultados y crear objetos Persona
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String direccion = resultSet.getString("direccion");
                String telefono = resultSet.getString("telefono");
                Persona persona = new Persona(id, nombre, direccion, telefono);
                personas.add(persona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return personas;
    }

    public void insertarPersona(Persona persona) {
        try {
            // Preparar la consulta para insertar un nuevo persona
            String query = "INSERT INTO personas (id,nombre, direccion, telefono) VALUES (?, ?, ?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, persona.getId());
            preparedStatement.setString(2, persona.getNombre());
            preparedStatement.setString(3, persona.getDireccion());
            preparedStatement.setString(4, persona.getTelefono());

            // Ejecutar la consulta
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarPersona(Persona persona) {
        try {
            // Preparar la consulta para actualizar un persona existente
            String query = "UPDATE personas SET nombre = ?, direccion = ?, telefono = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, persona.getNombre());
            preparedStatement.setString(2, persona.getDireccion());
            preparedStatement.setString(3, persona.getTelefono());
            preparedStatement.setInt(4, persona.getId());

            // Ejecutar la consulta
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarPersona(int idPersona) {
        try {
            // Preparar la consulta para eliminar un persona por su ID
            String query = "DELETE FROM personas WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idPersona);

            // Ejecutar la consulta
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Otros métodos según sea necesario
}

public class Main {

    public static void main(String[] args) {
        // Crear instancia de PersonaFacade
        PersonaFacade personaFacade = new PersonaFacade();
        personaFacade.eliminarPersona(1);
        personaFacade.eliminarPersona(2);
        personaFacade.eliminarPersona(3);
        // Insertar tres personas ficticios
        Persona persona1 = new Persona(1, "Persona 1", "Dirección 1", "123456789");
        Persona persona2 = new Persona(2, "Persona 2", "Dirección 2", "987654321");
        Persona persona3 = new Persona(3, "Persona 3", "Dirección 3", "111222333");
        personaFacade.insertarPersona(persona1);
        personaFacade.insertarPersona(persona2);
        personaFacade.insertarPersona(persona3);

        // Mostrar todos los personas
        System.out.println("Personas antes de modificar/borrar:");
        List<Persona> personasAntes = personaFacade.obtenerTodasLasPersonas();
        for (Persona persona : personasAntes) {
            System.out.println(persona.getId() + ": " + persona.getNombre() + ", " + persona.getDireccion() + ", "
                    + persona.getTelefono());
        }

        // Modificar un persona (por ejemplo, el primero)
        persona1.setNombre("Persona 1 Modificado01");
        personaFacade.actualizarPersona(persona1);

        // Eliminar un persona (por ejemplo, el segundo)
        personaFacade.eliminarPersona(persona2.getId());

        // Mostrar todos los personas después de modificar/borrar
        System.out.println("\nPersonas después de modificar/borrar:");
        List<Persona> personasDespues = personaFacade.obtenerTodasLasPersonas();
        for (Persona persona : personasDespues) {
            System.out.println(persona.getId() + ": " + persona.getNombre() + ", " + persona.getDireccion() + ", "
                    + persona.getTelefono());
        }
        personaFacade.cerrarConexion();
    }
}
