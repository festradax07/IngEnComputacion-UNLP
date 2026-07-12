
public class Editorial{
    private String nombre;
    private int cantPremios;
    private Libro[]libros;
    private double total;
    public Editorial(String nombre, int cantPremios){
        this.nombre=nombre;
        this.cantPremios=cantPremios;
        libros= new Libro[5];
        for (int i=0; i<libros.length;i++){
            libros[i]= null;
        }
        total=0;
    }
    public Editorial(){
        
    }
    public Libro[] getLibros(){
        return libros;
    }
    public void setLibro(Libro libro, int diml){
        this.libros[diml]= libro;
    }
    public void Totalizar(){
        for ( int i=0; i<libros.length; i++){
            total+= libros[i].getPrecio();
        }
    }
    public String toString(){
        String aux="\n Editorial " + nombre  + " cantidad de premios: " + cantPremios + " 5 libros más vendidos: ";
        for (int i= 0; i < libros.length; i++){
          aux+= libros[i].toString();  
        }
        return aux + "\n MONTO TOTAL DE SUS 5 MEJORES LIBROS: " + total;
    }
}