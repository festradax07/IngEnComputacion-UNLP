public class Show{
    private int numShow;
    private String fecha;
    private boolean soldOut;
    private Localidad localidades[];
    private int diml;
    public Show(int numSHow, String fecha, boolean soldOut){
        this.numShow= numSHow;
        this.fecha=fecha;
        this.soldOut=soldOut;
        this.localidades= new Localidad[10]; // creo el vector de localidades, no un obj localidades, por eso es valido.
        diml=0;
    }
    public Show(){
        
    }
    public int getNumShow(){
        return numShow;
    }
    public String getFecha(){
        return fecha;
    }
    public boolean getSoldOut(){
        return soldOut;
    }
    public void agregarLocalidad(Localidad local){
        if (diml !=localidades.length){
            localidades[diml]=local;
            diml++;
        }
    }
    public double totalizar(){
        double total=0,temp;
        for(int i=0;i<diml;i++){
            temp=localidades[i].calcularTotal(); // para no invocar al metodo dos veces.
            total+=temp;
            if(fecha.equalsIgnoreCase("3/08/2023")|| fecha.equalsIgnoreCase("4/08/2023")){
             total-= (temp*3.5/100);  
            }
        }
        return total;
    }
    public String toString(){
        String aux;
        aux= " numero de show: " + numShow + " fecha: " + fecha + " SoldOut? " + soldOut + "\n lista de Localidades: \n"; ;
        for(int i=0;i<diml;i++){
            aux+= localidades[i].toString() + "\n"; 
        }
        return aux;
    }
}