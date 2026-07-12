public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatos; 
    
    public Entrenador(String unNombre, double sueldo, int campeonatos){
        nombre = unNombre;
        sueldoBasico = sueldo;
        cantCampeonatos = campeonatos; 
    }
    
    public Entrenador(){
     
    }

    public double getSueldo() {
        return sueldoBasico;
    }

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldo(double sueldo) {
        sueldoBasico = sueldo;
    }

    public void setCantCampeonatos(int campeonatos) {
        cantCampeonatos = campeonatos;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public double calcularSueldoACobrar(){
        int campeonatos= this.getCantCampeonatos();
        double sueldoTotal = -1;
        if ( (campeonatos >= 1) && (campeonatos <=4)){
            sueldoTotal= (this.getSueldo() + 5000);
        }else if (( campeonatos >=5 ) && (campeonatos <= 10)){
            sueldoTotal = (this.getSueldo() + 30000);
        } else if( campeonatos > 10) {
            sueldoTotal= this.getSueldo() + 50000;
        }
        return sueldoTotal;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", sueldo basico " + sueldoBasico + " y tengo ganados " + cantCampeonatos;
        return aux;
    }
    
    
    
    
}
