package Octo.Controlador;

import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.Entidad.User;

import java.util.List;

// Singleton de Sesion, para poder mantener la informacion del usuario durante su uso.
//
public class Sesion {
    private static Sesion instancia;
    private User user;
    private String criptoCompra;
    private List<Activo> misActivos;
    private List<Moneda> monedasDisponibles;

    private Sesion() {
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public static Sesion getInstance() {
        if(instancia == null) {
            instancia = new Sesion();
        }
        return instancia;
    }
    public void setCriptoCompra(String compra){

        this.criptoCompra= compra;
    }
    public String getCriptoCompra(){
        return criptoCompra;
    }
    public void setMisActivos(List<Activo> lista){
        misActivos= lista;
    }

    public List<Moneda> getMonedasDisponibles() {

        return monedasDisponibles;
    }

    public void setMonedasDisponibles(List<Moneda> monedasDisponibles) {

        this.monedasDisponibles = monedasDisponibles;
    }

    public void cerrarSesion() {
        instancia = null;
    }
    public long getIdCriptotByNom(String criptoNombre) {
        for (Moneda moneda : monedasDisponibles) {
            if (moneda.getNomenclatura().equalsIgnoreCase(criptoNombre)) {
                return moneda.getIdMoneda();
            }
        }
        throw new IllegalArgumentException("Criptomoneda desconocida: " + criptoNombre);
    }

    public long getIdFiatById(String fiatNombre) {
        for (Moneda moneda : monedasDisponibles) {
            if (moneda.getNombre().equalsIgnoreCase(fiatNombre)) {
                return moneda.getIdMoneda();
            }
        }
        throw new IllegalArgumentException("Fiat desconocido: " + fiatNombre);
    }
    public double getCotizacionByNom(String cripto) {
        for (Moneda moneda : monedasDisponibles) {
            if (moneda.getNomenclatura().equalsIgnoreCase(cripto)) {
                return moneda.getCotizacion();
            }
        }
        throw new IllegalArgumentException("Criptomoneda desconocida: " + cripto);
    }

    public double getStockByNom(String cripto) {
        System.out.println("mis monedas son" + monedasDisponibles);
        for (Moneda moneda : monedasDisponibles) {
            if (moneda.getNomenclatura().equalsIgnoreCase(cripto)) {
                return moneda.getStock();
            }
        }
        throw new IllegalArgumentException("Criptomoneda desconocida: " + cripto);
    }
}