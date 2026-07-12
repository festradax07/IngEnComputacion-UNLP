public class Entrenador extends Empleado{
    private int campeonatos;
    public Entrenador(int dni,String nombre,int edad,double sueldo, int campeonatos){
     super(dni,nombre,edad,sueldo);
     this.campeonatos=campeonatos;
    }
    public int getCampeonatos(){
        return campeonatos;
    }
    public void setCampeonatos( int campeonatos){
        this.campeonatos=campeonatos;
    }
    public double calcularSueldoACobrar (){
        double tot = super.getSueldo(); 
        if (( campeonatos >= 1 ) && (campeonatos <= 4)){
            tot+=5000;
        } else if (( campeonatos >= 5) && ( campeonatos <=10)){
            tot+=30000;
        } else if ( campeonatos > 10){
            tot+=50000;
        } 
        return tot;
    }
    public String toString(){
        return super.toString();
    }
}