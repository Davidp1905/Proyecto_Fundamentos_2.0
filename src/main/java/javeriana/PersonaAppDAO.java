package javeriana;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Orlando
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class PersonaAppDAO {

    private Connection connection;

    public PersonaAppDAO() {
        abrirConexion();

    }
// Esta recibe es de tipo Cliente
    public void insertarPersona(PersonaApp persona) {
        try {
            
            /* ASí es la tabla de PERSONA en la base de datos
            Documento INT PRIMARY KEY,
            Nombre VARCHAR(50) NOT NULL,
            Apellido VARCHAR(50) NOT NULL,
            Contraseña VARCHAR(50) NOT NULL,
            Telefono VARCHAR(20),
            Correo VARCHAR(50),
            Cargo VARCHAR(50)            
            */
            // Preparar la consulta para insertar un nuevo cliente
            String query = "INSERT INTO persona (documento ,nombre, apellido,contraseña, telefono, correo, cargo) VALUES (?, ?, ?,?,?,?,?)";
            PreparedStatement preparedStatement = this.connection.prepareStatement(query); 
            // long telefonoLong = Integer.parseInt(telefono);
            int documento = (int)persona.getDocumento();
            preparedStatement.setLong(1, documento);
            preparedStatement.setString(2, persona.getNombre());
            preparedStatement.setString(3, persona.getApellido());
            preparedStatement.setString(4, persona.getPassword()); 
            preparedStatement.setLong(5,persona.getTelefono());
            preparedStatement.setString(6,persona.getEmail());
            preparedStatement.setString(7,"User"); 
          //  preparedStatement.setString(6, persona.getCargo());

            // Ejecutar la consulta
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<PersonaApp> obtenerPersonas() {
        List<PersonaApp> personas = new ArrayList<>();
        String query = "SELECT * FROM PERSONA";

        try (Statement statement = this.connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) { 
                long documento = resultSet.getLong("documento");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String contraseña = resultSet.getString("contraseña");
                long telefono = resultSet.getLong("telefono");
                String correo = resultSet.getString("correo");
                String cargo = resultSet.getString("cargo");
                
                //String nombre, String apellido, long documento, String password, String email, long telefono, String cargo
                PersonaApp persona = new PersonaApp(nombre, apellido, documento, contraseña, correo, telefono, cargo);
                personas.add(persona);
               
            }


        } catch (SQLException e) {
            System.out.println("Error al recuperar personas: " + e.getMessage());
            e.printStackTrace();
        }
        
        return personas;
    }
    
    public void abrirConexion() {

        // Inicializar la conexión a la base de datos
        String url = "jdbc:mysql://localhost:3306/banco";
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("Error Class:" + e.getMessage());
            e.printStackTrace();
        }
    }

    public void cerrarConexion() {
        try {
            connection.close();
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            e.printStackTrace();
        }

    }

}
