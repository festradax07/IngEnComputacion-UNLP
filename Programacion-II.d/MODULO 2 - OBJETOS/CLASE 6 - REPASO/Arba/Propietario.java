

public class Propietario
{
   private int cit;
   private String nombre;
   private String apellido;
    public Propietario()
    {
    }
    public Propietario(String nombre, String apellido, int CIT){
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setCIT(cit);
    }
    public void setNombre(String nombre){
    this.nombre=nombre;
    }
    public void setApellido(String apellido){
    this.apellido=apellido;
    }
    public void setCIT(int cit){
    this.cit=cit;
    }
    public String getNombre (){
    return nombre;
    }
    public String getApellido (){
    return apellido;
    }
    public int getCIT (){
    return cit;
    }
    
}
