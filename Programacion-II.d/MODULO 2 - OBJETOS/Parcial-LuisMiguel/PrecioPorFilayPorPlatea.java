import java.util.HashMap; 
import java.util.Map;
/**
 * Write a description of class PrecioPorFilayPorPlatea here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class PrecioPorFilayPorPlatea
{
     
    public PrecioPorFilayPorPlatea()
    {

    }

    /**
     * Método para saber el costo de una entrada según fila y platea
     * 
     * @params fila y platea
     * @return double
     */
    public static double obtenerPrecioBaseEntrada(int fila, String platea)
    {
        
        Map<String, double[]> map = new HashMap<String, double[]>();

        double plateasAaD[] = {75000,75000,75000,75000,75000,60000,60000,60000,60000,60000};
        double plateasEaH[]= {55000,55000,55000,55000,55000,40000,40000,40000,40000,40000};
        double plateasIaK[] = {35000,35000,35000,35000,35000,20000,20000,20000,20000,20000};
        map.put("A", plateasAaD);
        map.put("B", plateasAaD);
        map.put("C", plateasAaD);
        map.put("D", plateasAaD);
        map.put("E", plateasEaH);
        map.put("F", plateasEaH);
        map.put("G", plateasEaH);
        map.put("H", plateasEaH);
        map.put("I", plateasIaK);
        map.put("J", plateasIaK);
        map.put("K", plateasIaK);
        
        return map.get(platea)[fila-1];
    }
}
