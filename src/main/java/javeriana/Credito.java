/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;


import java.util.Date;

public class Credito {
    private int identificador;
    private double montoTotal;
    private double saldoPendiente;
    private float tasaInteres;
    private Date fechaVencimiento;

    public Credito(int identificador, double montoTotal, double saldoPendiente, float tasaInteres, Date fechaVencimiento) {
        this.identificador = identificador;
        this.montoTotal = montoTotal;
        this.saldoPendiente = saldoPendiente;
        this.tasaInteres = tasaInteres;
        this.fechaVencimiento = fechaVencimiento;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public double getSaldoPendiente() {
        return saldoPendiente;
    }

    public void setSaldoPendiente(double saldoPendiente) {
        this.saldoPendiente = saldoPendiente;
    }

    public float getTasaInteres() {
        return tasaInteres;
    }

    public void setTasaInteres(float tasaInteres) {
        this.tasaInteres = tasaInteres;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
}

