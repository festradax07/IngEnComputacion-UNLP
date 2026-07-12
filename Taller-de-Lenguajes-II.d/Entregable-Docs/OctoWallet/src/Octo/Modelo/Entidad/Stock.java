package Octo.Modelo.Entidad;
// consultar stock y moneda relacion y dao
public class Stock {
    String nomenclaturaMoneda;
    double monto;

    public Stock() {
    }

    public String getNomenclaturaMoneda() {
        return nomenclaturaMoneda;
    }

    public void setNomenclaturaMoneda(String nomenclaturaMoneda) {
        this.nomenclaturaMoneda = nomenclaturaMoneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
}
