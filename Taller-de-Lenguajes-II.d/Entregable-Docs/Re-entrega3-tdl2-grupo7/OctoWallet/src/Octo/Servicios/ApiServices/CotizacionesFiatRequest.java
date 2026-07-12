package Octo.Servicios.ApiServices;

import Octo.Modelo.Entidad.Moneda;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class CotizacionesFiatRequest {
    private static String URL_API =
            "https://v6.exchangerate-api.com/v6/dd7d3ba16824901d7d78b4fd/pair/?/USD";
    public  static Moneda RequestData(String nombre){
        HttpClient cliente = HttpClient.newHttpClient();
        HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(URL_API.replace("?",nombre))).GET().build();
        HttpResponse<String> respuesta = null;
        try {
            respuesta = cliente.send(solicitud, HttpResponse.BodyHandlers.ofString());
            if (respuesta.statusCode() == 200) {
                return parsearDatos(respuesta.body());
            } else {
                System.out.println("Error al obtener los precios. Código de estado: " + respuesta.statusCode());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    private static Moneda parsearDatos(String cuerpoRespuesta) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            // creo una lista con todos los precios.
            JsonNode raiz = objectMapper.readTree(cuerpoRespuesta);
            String base = raiz.get("base_code").asText();
            double cotizacion = raiz.get("conversion_rate").asDouble();
            return new Moneda(0,"F", base, base,cotizacion,0.0,0.0,"");
        } catch (Exception e) {
            System.out.println("Error al parsear el JSON: " + e.getMessage());
            return null;
        }
    }
}
