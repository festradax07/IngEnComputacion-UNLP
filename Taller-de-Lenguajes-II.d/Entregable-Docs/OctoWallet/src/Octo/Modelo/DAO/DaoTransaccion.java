package Octo.Modelo.DAO;

import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.Entidad.Transaccion;

public interface DaoTransaccion extends Crud<Transaccion>{
    void comprarCriptoMonedas(String cripto, String fiat, double cantidad );
    void swap(Moneda criptoOriginal, double cantidad, Moneda criptoEsperada);

}
