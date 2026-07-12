public class Producto{
    private String nombre;
    private String descripcion;
    private String marca;
    private int unidades;
    public Producto(String nombre, String descripcion, String marca, int unidades){
        this.nombre=nombre;
        this.descripcion= descripcion;
        this.marca=marca;
        this.unidades=unidades;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setDescripcion(String descripcion){
        this.descripcion=descripcion;
    }
    public void setMarca(String marca){
        this.marca=marca;
    }
    public void setUnidades(int unidades){
        this.unidades=unidades;
    }
    public String getNombre(){
        return nombre;
    }
    public String getDescripcion(){
        return descripcion;
    }
    public String getMarca(){
        return marca;
    }
    public int getUnidades(){
        return unidades;
    }
    public String toString(){
        return "nombre de producto: " + nombre + " descripcion: " + descripcion + " Marca: " + marca + "cantidad de unidades disponibles: " + unidades; 
    }
}