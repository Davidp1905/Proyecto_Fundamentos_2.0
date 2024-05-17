package javeriana;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;



public class TransaccionDAO {
    
    private Connection connection;
    
    public TransaccionDAO (){
        abrirConexion();
    }
    
    public void hacerTransaccion(Transaccion transaccion) {
        String query = "{CALL CrearTransaccion(?, ?, ?)}";
        try {
            PreparedStatement preparedStatement = this.connection.prepareStatement(query); 
            
            preparedStatement.setInt(1, transaccion.getDocumentoOrigen());
            preparedStatement.setDouble(2, transaccion.getMonto());
            preparedStatement.setLong(3, transaccion.getDocumentoDestino());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Transaccion> obtenerTransacciones(){
        List<Transaccion> transacciones = new ArrayList<>();
        String query = "SELECT * FROM TRANSACCION";
        
        try (Statement statement = this.connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) { 
                Transaccion t = new Transaccion();
                t.setDocumento(resultSet.getInt("documento"));
                t.setIdentificador(resultSet.getInt("idTransaccion"));
                t.setMonto(resultSet.getDouble("monto"));
                t.setDocumentoOrigen(resultSet.getInt("documentoOrigen"));
                t.setDocumentoDestino(resultSet.getInt("documentoDestino"));
                t.setFecha(resultSet.getDate("fecha"));
                transacciones.add(t);
               
            }

        } catch (SQLException e) {
            System.out.println("Error al recuperar personas: " + e.getMessage());
            e.printStackTrace();
        }
        
     
        return transacciones;
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
