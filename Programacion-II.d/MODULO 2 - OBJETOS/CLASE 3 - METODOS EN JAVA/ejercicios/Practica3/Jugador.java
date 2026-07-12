public class Jugador {
    private String nombre;
    private int DNI;
    private int edad;
    int partidos;
    int numGoles;
    
    public Jugador(String unNombre, int unDNI, int unaEdad, int partidos, int numGoles){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;
        this.partidos= partidos;
        this.numGoles= numGoles;
    }
    
    public Jugador(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }
    public int getPartidos(){
        return partidos;
    }
    public int getNumGoles(){
        return numGoles;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public void setPartidos(int partidos){
        this.partidos= partidos;
    }
    public void setNumGoles(int goles){
        this.numGoles=goles;
    }
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años." + "cantidad de partidos jugados " + partidos + " cantidad de goles hechos " + numGoles;
        return aux;
    }
    
    
    
    
}
