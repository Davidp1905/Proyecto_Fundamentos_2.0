/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javeriana;


import java.util.Date;

public class Transaccion {
    private int documento;
    private int identificador;
    private double monto;
    private int documentoOrigen;
    private int documentoDestino;
    private Date fecha; // LA base la genera

    public Transaccion(int documento, int identificador, double monto, int documentoOrigen, int documentoDestino, Date fecha) {
        this.documento = documento;
        this.identificador = identificador;
        this.monto = monto;
        this.documentoOrigen = documentoOrigen;
        this.documentoDestino = documentoDestino;
        this.fecha = fecha;
    }

    public Transaccion() {
    }

    public Transaccion(double monto, int documentoOrigen, int documentoDestino) {
        this.monto = monto;
        this.documentoOrigen = documentoOrigen;
        this.documentoDestino = documentoDestino;
    }

    
    public int getDocumento() {
        return documento;
    }

    public void setDocumento(int documento) {
        this.documento = documento;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getDocumentoOrigen() {
        return documentoOrigen;
    }

    public void setDocumentoOrigen(int documentoOrigen) {
        this.documentoOrigen = documentoOrigen;
    }

    public int getDocumentoDestino() {
        return documentoDestino;
    }

    public void setDocumentoDestino(int documentoDestino) {
        this.documentoDestino = documentoDestino;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}

