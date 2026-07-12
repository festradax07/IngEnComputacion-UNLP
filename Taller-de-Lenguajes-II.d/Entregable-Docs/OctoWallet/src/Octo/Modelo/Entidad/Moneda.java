package Octo.Modelo.Entidad;

public class Moneda {
    private String tipo; // deberia ser un enum
    private String nombre;
    private String nomenclatura;
    private double cotizacion;
    private double volatilidad;
    private double stock;

    public Moneda(String tipo,String nombre, String nomenclatura, double cotizacion, double volatilidad, double stock) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.nomenclatura = nomenclatura;
        this.cotizacion = cotizacion;
        this.volatilidad = volatilidad;
        this.stock = stock;
    }
    public Moneda(){

    }

    public String getNomenclatura() {
        return nomenclatura;
    }

    public void setNomenclatura(String nomenclatura) {
        this.nomenclatura = nomenclatura;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCotizacion() {
        return cotizacion;
    }

    public void setCotizacion(double cotizacion) {
        this.cotizacion = cotizacion;
    }

    public double getVolatilidad() {
        return volatilidad;
    }

    public void setVolatilidad(double volatilidad) {
        this.volatilidad = volatilidad;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return   "nombre='" + nombre + '\'' +
                ", cotizacion=" + cotizacion +
                ", volatilidad=" + volatilidad +
                ", stock=" + stock +
                '}';
    }
}
