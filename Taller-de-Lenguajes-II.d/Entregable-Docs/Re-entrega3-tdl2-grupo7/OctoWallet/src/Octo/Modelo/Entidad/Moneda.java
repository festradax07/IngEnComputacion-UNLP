package Octo.Modelo.Entidad;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties (ignoreUnknown = true) // para ignorar los campos que no me sirven.
public class Moneda {
    private String tipo; // deberia ser un enum
    @JsonProperty("id")
    private String nombre;
    @JsonProperty("symbol")
    private String nomenclatura;
    @JsonProperty("current_price")
    private double cotizacion;
    @JsonProperty("price_change_24h")
    private double volatilidad;
    private double stock;
    @JsonProperty("image")
    private String imagen;
    private long idMoneda;

    public Moneda(long idMoneda, String tipo, String nombre, String nomenclatura, double cotizacion, double volatilidad, double stock, String imagen) {
        this.idMoneda = idMoneda;
        this.tipo = tipo;
        this.nombre = nombre;
        this.nomenclatura = nomenclatura;
        this.cotizacion = cotizacion;
        this.volatilidad = volatilidad;
        this.stock = stock;
        this.imagen = imagen;
    }
    public Moneda(){

    }
    public long getIdMoneda() {
        return idMoneda;
    }
    public void setIdMoneda(long idMoneda) {
        this.idMoneda = idMoneda;
    }
    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
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
        return "nombre='" + nombre + '\'' +
                ", cotizacion=" + cotizacion +
                ", volatilidad=" + volatilidad +
                ", stock=" + stock +
                '}';
    }
}
