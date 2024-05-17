/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;

/**
 *
 * @author Usuario Autorizado
 */
public class Bolsillo {
     private int idBolsillo;
    private String nombreBolsillo;
    private double saldoBolsillo;

    public Bolsillo(int idBolsillo, String nombreBolsillo, double saldoBolsillo) {
        this.idBolsillo = idBolsillo;
        this.nombreBolsillo = nombreBolsillo;
        this.saldoBolsillo = saldoBolsillo;
    }

    public Bolsillo() {
    }

    public int getIdBolsillo() {
        return idBolsillo;
    }

    public void setIdBolsillo(int idBolsillo) {
        this.idBolsillo = idBolsillo;
    }

    public String getNombreBolsillo() {
        return nombreBolsillo;
    }

    public void setNombreBolsillo(String nombreBolsillo) {
        this.nombreBolsillo = nombreBolsillo;
    }

    public double getSaldoBolsillo() {
        return saldoBolsillo;
    }

    public void setSaldoBolsillo(double saldoBolsillo) {
        this.saldoBolsillo = saldoBolsillo;
    }
}
