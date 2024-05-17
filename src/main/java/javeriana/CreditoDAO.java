package javeriana;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;

public class CreditoDAO {
    private Connection connection;
     
    public CreditoDAO (){
        abrirConexion();
    }
     
    public void tomarCredito(double monto, int documento, float interes){
        String query = "{CALL CrearCredito(?, ?, ?)}";
         // CrearCredito(monto, doc, interes)
        
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(query); 
            
            preparedStatement.setDouble(1, monto);
            preparedStatement.setInt(2, documento);
            preparedStatement.setFloat(3, interes);
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }   
       
    }
    
    public List<Credito> traerCreditos(int doc){
        List<Credito> creditos = new ArrayList<>();
        String query = "CALL VerCreditosUsuario(?);";
        
        try (PreparedStatement preparedStatement = this.connection.prepareStatement(query)) {
            preparedStatement.setInt(1, doc);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) { 
                    Credito c = new Credito();
                    c.setIdentificador(resultSet.getInt("identificador"));
                    c.setMontoTotal(resultSet.getDouble("MontoTotal"));
                    c.setSaldoPendiente(resultSet.getDouble("SaldoPendiente"));
                    c.setTasaInteres(resultSet.getFloat("TasaInteres"));
                    c.setFechaVencimiento(resultSet.getDate("fechaVencimiento"));
                    
                    creditos.add(c);
                        
                }
            }
                  
        } catch (SQLException e) {
            System.out.println("Error al recuperar personas: " + e.getMessage());
            e.printStackTrace();
        }
        
        
        
        
        
        return creditos;
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
