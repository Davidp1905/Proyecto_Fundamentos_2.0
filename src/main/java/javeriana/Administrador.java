/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;

/**
 *
 * @author Usuario Autorizado
 */
public class Administrador extends PersonaApp{
     private String cargo;
    
    public Administrador(String nombre, String apellido, long documento, String password, String email, long telefono, String cargo) {
        super(nombre, apellido, documento, password, email, telefono);
        this.cargo = cargo;
    }
     public boolean validarLogin(String usuario, String contraseña) {
           return this.email.equals(usuario) && this.password.equals(contraseña);
       } 

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
     
     
}
