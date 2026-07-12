package Octo.Servicios.AppServices;

import Octo.Modelo.DAO.DaoMoneda;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Servicios.ApiServices.CotizacionesFiatRequest;

// utilitario para el manejo de fiat
public class FiatConsumo {
    public static final Moneda ArgFiat = FactoryDao.getMoneda().obtenerPorNomenclatura("ARS");
    public static final Moneda USDFiat = FactoryDao.getMoneda().obtenerPorNomenclatura("USD");
    public static final double ARGCotizacion = CotizacionesFiatRequest.RequestData("ARS").getCotizacion();
    public static final double USDCotizacion = 1.0;
    public static final double getCotizacion(String nomenclatura){
        double res;
        switch(nomenclatura){
            case "ARS": res =ARGCotizacion;
                break;
            case "USD": res = USDCotizacion;
                break;
            default: res=-1;
        }
        return res;
    }
    public static long getFiatId(String nomenclatura){
        long res;
        switch(nomenclatura){
            case "ARS": res =ArgFiat.getIdMoneda();
                break;
            case "USD": res = USDFiat.getIdMoneda();
                break;
            default: res=-1;
        }
        return res;
    }
    public static Moneda getFiat(String nomenclatura){
        Moneda res;
        switch(nomenclatura){
            case "ARS": res =ArgFiat;
                break;
            case "USD": res = USDFiat;
                break;
            default: res=null;
        }
        return res;
    }

}
