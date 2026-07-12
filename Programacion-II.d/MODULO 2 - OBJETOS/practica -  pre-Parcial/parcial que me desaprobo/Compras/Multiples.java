public class Multiples extends Compra{
    private int [] numAsientos;
    private int cantAsientos;
    public Multiples(int num, int categoria, String nombreEstadio, Fecha fecha,double importe){
        super(num,categoria, nombreEstadio, fecha,importe);
        numAsientos= new int[20];
        cantAsientos=0;
        for (int i=0; i<numAsientos.length; i++){
            numAsientos[i]=(i+1);
        }
    }
    public void setCantAsientos(){
        cantAsientos++;
    }
    public int getCantAsientos(){
        return cantAsientos;
    }
    public double darPromo(){
         double desc=0; Fecha fecha1= new Fecha(20,11,2022), fecha2=new Fecha(2,12,2022);
         Fecha date=super.getFechaPartido(); String estadio=super.getNombreEstadio();
         if(( cantAsientos < 6) && ((estadio.toUpperCase().equals("INTERNATIONAL KHALIFA")) || (estadio.toUpperCase().equals("EDUACTION CITY")))){
             desc= super.getImporte()*7.5/100;
         } else if(( cantAsientos > 10) && ((date.compararFechas(fecha1)) && (date.compararFechas(fecha2)))){
            int dec = cantAsientos/10;
            while( cantAsientos !=0){
                desc+= (double) super.getImporte()/cantAsientos;
                dec--;
            }
         }
         return desc;
    }
    public String toString(){
        String aux= super.toString() + "\n compra por los asientos: ";
        for (int i=0; i<cantAsientos; i++){
            aux+= (i+1) + " , " ;
            }
        return aux;   
    }
    }
