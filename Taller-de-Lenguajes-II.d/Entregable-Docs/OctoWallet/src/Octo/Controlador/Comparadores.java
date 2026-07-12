package Octo.Controlador;

import Octo.Modelo.Entidad.Moneda;

import java.util.Comparator;
/* method reference Clase::metodo -> es una forma implicita de decirle que metodo debe ser llamado,
 en particular comparing es un metodo que necesita especificarle un metodo de la clase con la cual va a comparar
devuelve una instancia de Comparator bajo el generico de la Clase indicada. */

public class Comparadores {
    // el uso será de la forma. monedas.sort(Comparadores.compararPorValorDolar)

    public static Comparator<Moneda> compararPorValorDolar() { // para tener el comparador listo para cuando se le llame
        return Comparator.comparingDouble(Moneda::getCotizacion);
    }

    public static Comparator<Moneda> compararPorNomenclatura() {
        return Comparator.comparing(Moneda::getNomenclatura);
    }

    // realizar lo mismo con stock y así...
}
