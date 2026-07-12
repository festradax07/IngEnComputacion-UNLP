public class Responsable{
    private String nombreApellido;
    private int dni;
    public Responsable(){
        
    }
    public Responsable(String nombreApellido, int Dni){
        this.nombreApellido=nombreApellido; this.dni=Dni;
    }
    public String getNombreApellido(){
        return nombreApellido;
    }
    public int getDni(){
        return dni;
    }
    public void setDni(){
        this.dni=dni;
    }
    public void setNombreApellido( String nombreApellido){
        this.nombreApellido=nombreApellido;
    }
    public String toString(){
        return "nombre y apellido " + nombreApellido + "dni" + dni;
    }
}
