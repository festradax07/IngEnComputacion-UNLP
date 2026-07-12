public class Comprador{
    private int DNI;
    private String nomApe;
    public Comprador(){
        
    }
    public Comprador(int DNI, String nomApe){
        this.DNI= DNI;
        this.nomApe=nomApe;
    }
    public String toString(){
        return " DNI: "+DNI +" nombre y apellido: " + nomApe;
    }
}