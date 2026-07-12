package Octo.Modelo.JDBC;

import Octo.Modelo.DAO.*;

public class FactoryDao {
    private static DaoMoneda moneda = new DaoMonedaImpl(); ;
    private static DaoPersonaImpl persona= new DaoPersonaImpl();
    private static DaoUsuarioImpl usuario= new DaoUsuarioImpl();
    private static DaoTransaccionImpl transaccion = new DaoTransaccionImpl();
    private static DaoActivoCrypto crypto = new DaoActivoCrypto();
    private static DaoActivoFiat fiat = new DaoActivoFiat();

    public static DaoMoneda getMoneda() {
        return moneda;
    }
    public static DaoUsuario getUsuario() {
        return usuario;
    }
    public static DaoPersona getPersona() {
        return persona;
    }
    public static DaoActivoCrypto getCrypto() {
        return crypto;
    }
    public static DaoActivoFiat getFiat() {
        return fiat;
    }
    public static DaoTransaccionImpl getTransaccion() {
        return transaccion;
    }
}
