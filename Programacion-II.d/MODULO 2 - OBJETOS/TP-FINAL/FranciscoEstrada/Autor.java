public class Autor{
    private String nombre;
    private String apellido;
    private int dni;
    private String nacionalidad;
    public Autor(){
        
    }
    public Autor(String nombre,String apellido, int Dni, String nacionalidad){
        this.nombre=nombre;this.apellido=apellido; this.dni=Dni; this.nacionalidad=nacionalidad;
    }
    public String getNombre(){
        return nombre;
    }
    public String getApellido(){
        return apellido;
    }
    public int getDni(){
        return dni;
    }
    public void setDni(){
        this.dni=dni;
    }
    public String getNacionalidad(){
        return nacionalidad;
    }
    public void setNacionalidad(String nacionalidad){
        this.nacionalidad=nacionalidad;
    }
    public void setApellido(String apellido){
        this.apellido=apellido;
    }
    public void setNombre( String nombre){
        this.nombre=nombre;
    }
    public String toString(){
        return "nombre: " + nombre +"  apellido: " + apellido + "dni: " + dni + "  Nacionalidad: " + nacionalidad;
    }
}
