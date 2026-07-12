import java.util.HashMap; 
import java.util.Map;
/**
 * Write a description of class TarifasNacionalesPorRegion here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class TarifasNacionalesPorRegion
{
     
    public TarifasNacionalesPorRegion()
    {

    }

    /**
     * Método para saber si un grupo familiar puede acceder, o no, a un subsidio
     * 
     * @params ingresos del grupo familiar y región
     * @return verdadero o falso
     */
    public static boolean puedeAccederAlSubsidio(double ingreso, String region)
    {
        
        Map<String, Double> map = new HashMap<String, Double>();
        
        map.put("Patagonia", 350000.0);
        map.put("PampaHúmeda", 345000.0);
        map.put("PampaSeca", 340000.0);
        map.put("Chaqueña", 280000.0);
        map.put("Mesopotamia", 320000.0);
        map.put("Cuyo", 300000.0);
        map.put("SierrasPampeanas", 305000.0);
        map.put("NOA", 260000.0);
        
        return map.get(region) > ingreso;
    }
}
