/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;

import java.util.*;

/**
 *
 * @author Usuario Autorizado
 */
public class Usuario extends PersonaApp {
     //private ArrayList<Bolsillo> bolsillos;
    //private Cuenta cuenta;
    //private ArrayList<Credito> creditos;

    
    
    public void actualizarContraseña(String nuevaContraseña) {
        super.password = nuevaContraseña;
    } 
    
    public boolean validarLogin(String usuario, String contraseña) {
           return this.email.equals(usuario) && this.password.equals(contraseña);
       } 
    
    public Usuario(String nombre, String apellido, long documento, String password, String email, long telefono) {
        super(nombre, apellido, documento, password, email, telefono);
        // this.bolsillos = new ArrayList<>();
        // this.creditos = new ArrayList<>();
    }
     //private ArrayList<Bolsillo> bolsillos;
    //private Cuenta cuenta;
    //private ArrayList<Credito> creditos;
    
    
    
}
