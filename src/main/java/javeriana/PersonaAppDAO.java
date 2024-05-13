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
import java.sql.SQLException;

public class PersonaAppDAO {

    private Connection connection;

    public PersonaAppDAO() {

    }

    public void insertarPersona(PersonaApp persona) {
        try {
            // Preparar la consulta para insertar un nuevo persona
            String query = "INSERT INTO personas (id,nombre, direccion, telefono) VALUES (?, ?, ?,?)";
            PreparedStatement preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1, persona.getId());
            preparedStatement.setString(2, persona.getNombre());
            preparedStatement.setString(3, persona.getDireccion());
            preparedStatement.setString(4, persona.getTelefono());

            // Ejecutar la consulta
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
            e.printStackTrace();
        }
    }

    public void abrirConexion() {

        // Inicializar la conexión a la base de datos
        String url = "jdbc:mysql://localhost:3306/pruebasxd";
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
