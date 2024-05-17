package javeriana;

public class Cuenta {
    private float saldo;
    private int documento;

    public Cuenta(float saldo, int documento) {
        this.saldo = saldo;
        this.documento = documento;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public int getDocumento() {
        return documento;
    }

    public void setDocumento(int documento) {
        this.documento = documento;
    }
    
    
}
