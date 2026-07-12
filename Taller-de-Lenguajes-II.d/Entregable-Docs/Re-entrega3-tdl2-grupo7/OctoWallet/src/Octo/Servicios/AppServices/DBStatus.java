package Octo.Servicios.AppServices;

import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.DaoUsuarioImpl;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Servicios.ApiServices.CotizacionesFiatRequest;
import Octo.Servicios.ApiServices.DataRequest;

import java.util.List;

public class DBStatus {
    private boolean DbStatus;
    public DBStatus() {
        DbStatus = verificarEstadoBd();
        iniciarValoresBD();// la bd, si no existiera, se crearia en verificar por el bloque static.
    }
    private void iniciarValoresBD() {
        if (!DbStatus) {
            List<Moneda> criptos = DataRequest.RequestData();
            criptos.forEach(moneda -> FactoryDao.getMoneda().crear(moneda));
            Moneda argenta = CotizacionesFiatRequest.RequestData("ARS");
            argenta.setStock(ActivosService.darCantidad());
            argenta.setImagen("https://scontent.faep9-1.fna.fbcdn.net/v/t39.30808-6/271654337_5148545781830887_7074237913089211857_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE4CtHLW37uynii_dJtZ5kTcz5tWa10oL1zPm1ZrXSgvfMg0fsqhU5UqCmrgoWNjEPTB5Gbk8oixsN0KcIHuZxx&_nc_ohc=fA6Ic61vRLUQ7kNvgFZ2R3X&_nc_oc=AdjcaFJ-aUH0TcCWnWQoCdYjJ42cWp0nmKfjZ3lQbqVBnSqor-qlLFR1X9SOqEL8-70&_nc_zt=23&_nc_ht=scontent.faep9-1.fna&_nc_gid=AnlIc29-OhDs7x-HaNH5flX&oh=00_AYAQ__wZ8SK7aCDsG9LIMu9SdUqzVgxDtrGgb2c099KYBw&oe=67A714A2");
            Moneda dolarYankee = new Moneda(0, "F", "USD", "USD", 1, 0, ActivosService.darCantidad(), "https://previews.123rf.com/images/putracetol/putracetol1805/putracetol180505700/101702994-dise%C3%B1o-de-icono-de-logotipo-de-dinero.jpg");
            FactoryDao.getMoneda().crear(argenta);
            FactoryDao.getMoneda().crear(dolarYankee);
            DbStatus = true;
        }
    }
    private boolean verificarEstadoBd() {
        return !FactoryDao.getMoneda().listar().isEmpty();
    }
}
