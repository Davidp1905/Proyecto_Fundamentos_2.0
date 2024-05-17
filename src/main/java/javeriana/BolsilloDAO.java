package javeriana;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;


public class BolsilloDAO {
    
    private Connection connection;
    
    public BolsilloDAO (){
        abrirConexion();
    }
    
    
    
    public List<Bolsillo> obtenerBolsillos (int doc){
        List<Bolsillo> bolsillos = new ArrayList<>();
        String query = "CALL obtenerBolsillosUsuario(?);";
        
        try (PreparedStatement preparedStatement = this.connection.prepareStatement(query)) {
            preparedStatement.setInt(1, doc);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

            // int idBolsillo;
            // String nombreBolsillo;
            // double saldoBolsillo
                while (resultSet.next()) { 
                    Bolsillo b = new Bolsillo();
                    b.setIdBolsillo(resultSet.getInt("documentoUSuario"));
                    b.setNombreBolsillo(resultSet.getString("nombre"));
                    b.setSaldoBolsillo(resultSet.getFloat("saldo"));

                    bolsillos.add(b);
                        System.out.println("id" + b.getIdBolsillo() + " nombre: " + b.getNombreBolsillo());
                }
            }
                  
        } catch (SQLException e) {
            System.out.println("Error al recuperar personas: " + e.getMessage());
            e.printStackTrace();
        }
        return bolsillos;
    }
    
    public void nuevoBolsillo (String nombre, double saldo, int documento){
        String query = "{CALL CrearBolsillo(?, ?, ?)}";
        
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(query); 
            
            preparedStatement.setString(1, nombre);
            preparedStatement.setDouble(2, saldo);
            preparedStatement.setInt(3, documento);
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }          
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
