package Octo.Servicios.AppServices;

import Octo.Controlador.Sesion;
import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.FactoryDao;

import java.util.ArrayList;
import java.util.List;

public class ActivosService {
    public static List<Activo> crearActivosDefault(List<Moneda> monedas) {
        // con el id de usuario Sesion.getInstance().getUserResult().getUserId()
        List<Activo> activos = new ArrayList<>();
        monedas.stream().forEach(moneda ->
                activos.add(new Activo(Sesion.getInstance().getUser().
                        getUserId(), moneda, darCantidad())));

        List<Activo> activosFiat =new ArrayList<>();
        activosFiat.add(new Activo(Sesion.getInstance().getUser().
                getUserId(), FiatConsumo.ArgFiat, darCantidad()));
        activosFiat.add(new Activo(Sesion.getInstance().getUser().
                getUserId(), FiatConsumo.USDFiat, darCantidad()));
        activos.forEach(activo -> FactoryDao.getCrypto().crear(activo));
        activosFiat.forEach(activo -> FactoryDao.getFiat().crear(activo));
        activos.addAll(activosFiat);
        return activos;

    }
    public static void darStock(List<Moneda>cacheMonedas) {
        cacheMonedas.forEach(cacheMoneda ->
        {   cacheMoneda.setStock(darCantidad());
            FactoryDao.getMoneda().
                    actualizar(cacheMoneda);
        });
    }
    public static double darCantidad() { //falta ver realmente donde va a ir esto
        return (Math.random() * 10000) + 1;
    }

}
