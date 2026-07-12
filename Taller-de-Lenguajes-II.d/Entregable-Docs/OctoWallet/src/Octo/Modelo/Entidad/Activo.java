package Octo.Modelo.Entidad;

public class Activo {
    private Moneda tipo; // deberia cambiar por moneda
    private double saldo;

    public Activo(Moneda tipo, double saldo) {
        this.tipo = tipo;
        this.saldo = saldo;
    }

    public Moneda getTipo() {
        return tipo;
    }

    public void setTipo(Moneda tipo) {
        this.tipo = tipo;
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
                "tipo=" + tipo +
                ", saldo=" + saldo +
                '}';
    }
}
