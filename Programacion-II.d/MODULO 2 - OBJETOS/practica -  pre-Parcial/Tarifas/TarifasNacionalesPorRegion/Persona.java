public class Persona {
    private String nombre;
    private String apellido;
    private int CUIT; 
    
    public Persona(String unNombre, String apellido, int Cuit){
        nombre = unNombre;
        this.apellido = apellido;
        CUIT=Cuit; 
    }
    
    public Persona(){
     
    }

    public int getCUIT() {
        return CUIT;
    }

    public String getApellido() {
        return apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setCUIT(int CUIT) {
        this.CUIT= CUIT;
    }

    public void setApellido(String apellido) {
        this.apellido=apellido;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "nombre  " + nombre + ", apellido  " + apellido + " CUIT  " + CUIT ;
        return aux;
    }
}
