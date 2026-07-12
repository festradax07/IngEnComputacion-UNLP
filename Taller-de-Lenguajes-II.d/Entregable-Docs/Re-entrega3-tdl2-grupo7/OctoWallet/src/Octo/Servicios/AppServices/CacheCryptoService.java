package Octo.Servicios.AppServices;

import Octo.Controlador.Utilitario.Comparadores;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Servicios.ApiServices.CotizacionesRequest;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

public class CacheCryptoService {
    private static CacheCryptoService instancia;
    private static List<Moneda> cacheMonedas;
    private static String ids;
    private CacheCryptoService(){
        cargarCache();
        criptosOrdenadas();
        ActivosService.darStock(cacheMonedas);
        this.cacheMonedas = monedasMVP();
    } public static List<Moneda> MonedasMVP() {
        List<String> monedasMVP = Arrays.asList("btc", "eth", "usdc", "usdt", "doge");
        System.out.println(cacheMonedas);
        return cacheMonedas.stream()
                .filter(moneda -> monedasMVP.contains(moneda.getNomenclatura().toLowerCase()))
                .collect(Collectors.toList());
    }
    public static CacheCryptoService getInstancia(){
        if(instancia==null){
            instancia= new CacheCryptoService();
        }
        return instancia;
    }
    public List<Moneda> getCacheMonedas() {
        return cacheMonedas;
    }
    private List<Moneda> monedasMVP() {
        List<String> monedasMVP = Arrays.asList("btc", "eth", "usdc", "usdt", "doge");
        System.out.println(cacheMonedas);
        return cacheMonedas.stream()
                .filter(moneda -> monedasMVP.contains(moneda.getNomenclatura().toLowerCase()))
                .collect(Collectors.toList());
    }
    private void cargarCache() {
        cacheMonedas = FactoryDao.getMoneda().listar();
    }
    private CompletableFuture<Map<String, Map<String, Double>>> obtenerCotizaciones() {
        // obtengo solo las monedas de tipo C sin crear casos de where en las queries
        if (ids.equals("")) {
            ids = cacheMonedas.stream().map(Moneda::getNombre).collect(Collectors.joining(","));
        }
        return CotizacionesRequest.RequestAsync(ids); // quiero que retorne un mapa
    }
    public void ActualizarCotizaciones() {
        obtenerCotizaciones()
                .thenAccept(cotizaciones -> {
                    // Verificamos si la respuesta no está vacía
                    if (!cotizaciones.isEmpty()) {
                        // por cada moneda
                        cacheMonedas.forEach(moneda -> {
                            String nombreMoneda = moneda.getNombre().toLowerCase();
                            if (cotizaciones.containsKey(nombreMoneda)) {
                                // Obtengo la cotización
                                Double cotizacion = cotizaciones.get(nombreMoneda).get("usd");
                                moneda.setCotizacion(cotizacion); // Asignamos la cotización al objeto Moneda
                            }
                        });
                        // Después de actualizar las cotizaciones,ya puedo actualizar la vista
                        //actualizarVistaConCotizaciones(listaMonedas);
                    }
                })
                .exceptionally(e -> {
                    System.out.println("Error al obtener las cotizaciones: " + e.getMessage());
                    return null;
                });
    }
    private void criptosOrdenadas() {
        cacheMonedas = cacheMonedas.stream().filter(moneda ->
                moneda.getTipo().equals("C")).sorted(Comparadores.compararMonedaPorValorDolar().reversed()).toList();
    }
}
