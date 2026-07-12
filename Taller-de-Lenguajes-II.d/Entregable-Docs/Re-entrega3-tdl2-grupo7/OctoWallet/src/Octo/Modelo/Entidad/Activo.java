package Octo.Modelo.Entidad;

public class Activo {
    private long id;
    private Moneda moneda;
    private double saldo;

    public Activo(long id, Moneda moneda, double saldo) {
        this.id = id;
        this.moneda = moneda;
        this.saldo = saldo;
    }

    public Activo() {
    }
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public Moneda getMoneda() {
        return moneda;
    }
    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public String toString() {
        return "Activo{" +
                "Moneda =" + moneda.toString() +
                ", saldo=" + saldo +
                '}';
    }
}
