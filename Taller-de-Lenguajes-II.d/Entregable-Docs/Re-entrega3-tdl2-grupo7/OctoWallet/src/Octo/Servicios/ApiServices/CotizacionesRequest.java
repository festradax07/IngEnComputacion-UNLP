package Octo.Servicios.ApiServices;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

public class CotizacionesRequest {
    private static String URL_API =
            "https://api.coingecko.com/api/v3/simple/price?ids=*&vs_currencies=usd";
    public  static CompletableFuture<Map<String, Map<String,Double>>> RequestAsync(String ids){
        HttpClient cliente = HttpClient.newHttpClient();
        HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(URL_API.replace("*",ids))).GET().build();
        // completableFuture para hacer solicitud asuncronica
        CompletableFuture<HttpResponse<String>> respuestaAsync = cliente.sendAsync(solicitud, HttpResponse.BodyHandlers.ofString());
        // manejo la respuesta cuando se complete
        return respuestaAsync.thenApply(respuesta -> {
            if (respuesta.statusCode() == 200) {
                return parsearYMostrarPrecios(respuesta.body());
            } else {
                System.out.println("Error al obtener los precios. Código de estado: " + respuesta.statusCode());
                return null;
            }
        }).exceptionally(e -> {
            System.out.println("Error en la solicitud: " + e.getMessage());
            return Collections.emptyMap();
        });
    }
    private static Map<String, Map<String,Double>> parsearYMostrarPrecios(String cuerpoRespuesta) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            // creo un map con todos los precios.
            return objectMapper.readValue(cuerpoRespuesta, new TypeReference<Map<String, Map<String, Double>>>() {});
        } catch (Exception e) {
            System.out.println("Error al parsear el JSON: " + e.getMessage());
            return Collections.emptyMap();
        }
    }
}
