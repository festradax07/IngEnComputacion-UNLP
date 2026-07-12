package Octo.Servicios.ApiServices;

import Octo.Modelo.Entidad.Moneda;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Collections;
import java.util.List;

public class DataRequest {
    private static final String URL_API =
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1";
    public  static List<Moneda> RequestData(){
        HttpClient cliente = HttpClient.newHttpClient();
        HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(URL_API)).GET().build();
        HttpResponse<String> respuesta = null;
        List<Moneda> lista = null;
        try {
            respuesta = cliente.send(solicitud, HttpResponse.BodyHandlers.ofString());
            if (respuesta.statusCode() == 200) {
                System.out.println("entré");
                 lista = parsearDatos(respuesta.body());
            } else {
                System.out.println("Error al obtener los precios. Código de estado: " + respuesta.statusCode());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
    private static List<Moneda> parsearDatos(String cuerpoRespuesta) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            // creo una lista con todos los precios.
           List<Moneda>lista = objectMapper.readValue(cuerpoRespuesta, new TypeReference<List<Moneda>>() {});
            lista.forEach(moneda -> moneda.setTipo("C"));
            return lista;
        } catch (Exception e) {
            System.out.println("Error al parsear el JSON: " + e.getMessage());
            return Collections.emptyList();
        }
    }
}
