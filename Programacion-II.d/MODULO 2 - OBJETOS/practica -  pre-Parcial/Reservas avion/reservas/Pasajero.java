public class Pasajero{
    private int dni;
    private int numAsiento;
    public Pasajero(){
        
    }
    public Pasajero(int dni, int num){
        this.dni=dni;
        numAsiento=num;
    }
    public void setDni(int dni){
        this.dni=dni;
    }
    public void setNumAsiento(int num){
        numAsiento=num;
    }
    public int getDni(){
        return dni;
    }
    public int getNumAsiento(){
        return numAsiento;
    }
    public String toString(){
        return "dni del pasajero: " + dni + " numero de asiento " + numAsiento;
    }
}