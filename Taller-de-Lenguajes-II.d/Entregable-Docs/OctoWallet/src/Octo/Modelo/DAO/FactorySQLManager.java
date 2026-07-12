package Octo.Modelo.DAO;

public class FactorySQLManager {
    private DaoMoneda moneda;
    private DaoTransaccion transaccion;
    private DaoStock stock;
    private static FactorySQLManager instancia;
    //private DaoActivo daoAactivo;
    private FactorySQLManager(){
    }
    public static FactorySQLManager getInstancia(){
        if(instancia ==null){
            instancia = new FactorySQLManager();
        }
        return instancia;
    }
    public DaoMoneda getMoneda() {
        if( moneda == null){
            moneda= new DaoMonedaImpl();
        }
        return moneda;
    }

    public DaoTransaccion getTransaccion() {
        if(transaccion==null){
            transaccion = new DaoTransaccionImpl();
        }
        return transaccion;
    }

    public DaoStock getStock() {
        if(stock == null){
            stock = new DaoStockImpl();
        }
        return stock;
    }
}
