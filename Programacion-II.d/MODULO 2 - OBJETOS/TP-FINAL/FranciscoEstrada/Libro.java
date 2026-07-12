public abstract class Libro{
    private String ISBN; 
    private String titulo; //uso
    private int cantPaginas;
    private double precio; //uso
    private String fechaPublicacion; //uso
    private Autor autor;
    public Libro(){
        
    }
    public Libro(String ISBN, String titulo, int cantPaginas, double precio, String fechaPublicacion, Autor autor ){
        this.ISBN=ISBN;
        this.titulo=titulo;
        this.cantPaginas=cantPaginas;
        this.precio=precio;
        this.fechaPublicacion=fechaPublicacion;
        this.autor=autor;
    }
    public String getTitulo(){
        return titulo;
    }
    public void setTitulo( String titulo){
        this.titulo=titulo;
    }
    public double getPrecio(){
        return precio;
    }
    public void setPrecio(double precio){
        this.precio=precio;
    }
   public String getFechaPublicacion(){
       return fechaPublicacion;
   }
   public void setFechaPublicacion( String fecha){
       this.fechaPublicacion=fechaPublicacion;
   }
   public void setAutor(Autor autor){
       this.autor=autor;
   }
   public Autor getAutor(){
       return autor;
   }
   public abstract double calculoDescuento();
       public String toString(){
        return  "\n titulo : " + titulo + " \n ISBN: " + ISBN + " \n cantidad de paginas: " + cantPaginas + " precio: "+ precio + " \n fechaPublicacion: " + fechaPublicacion + " \n DATOS DEL AUTOR " + autor.toString();
    }
}
