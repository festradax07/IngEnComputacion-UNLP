public class Jugador extends Empleado{
    private int numPartidos;
    private int cantGoles;
    public Jugador (int dni,String nombre,int edad,double sueldo,int numPartidos, int cantGoles){
        super(dni,nombre,edad,sueldo);
        this.numPartidos=numPartidos;
        this.cantGoles=cantGoles;
    }
    public int getPartidos(){
        return numPartidos;
    }
    public int getCantGoles(){
        return cantGoles;
    }
    public void setPartidos(int partidos){
        numPartidos= partidos;
    }
    public void setCantGoles(int cantGoles){
        this.cantGoles=cantGoles;
    }
    public double calcularSueldoACobrar(){
      double prom = cantGoles/numPartidos; double tot= super.getSueldo(); 
      if (prom > 0.5){
         tot+= super.getSueldo();    
     }
     return tot;
    }
    public String toString(){
     return super.toString();
    }
    }
