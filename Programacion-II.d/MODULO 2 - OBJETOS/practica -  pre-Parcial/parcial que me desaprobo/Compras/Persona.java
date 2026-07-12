public class Persona {
    private String nombre;
    private int DNI;
    private String apellido; 
    private int numAsiento;
    
    public Persona(String unNombre, int unDNI,String apellido, int numAsiento){
        nombre = unNombre;
        DNI = unDNI;
        this.apellido=apellido; 
        this.numAsiento=numAsiento;
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public String getApellido() {
        return apellido;
    }

    public String getNombre() {
        return nombre;
    }
    public int getNumAsiento(){
        return numAsiento;
    }
    
    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public void setNumAsiento(int numAsiento){
        this.numAsiento=numAsiento;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + " apellido: " + apellido + " mi DNI es " + DNI + " numero de asiento: " + numAsiento;
        return aux;
    }
    
    
    
    
}
