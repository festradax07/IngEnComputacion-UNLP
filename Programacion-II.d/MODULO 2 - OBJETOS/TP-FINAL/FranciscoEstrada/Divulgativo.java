public class Divulgativo extends Libro{
    private String tipo;
    public Divulgativo(){
        
    }
    public Divulgativo(String ISBN, String titulo, int cantPaginas, double precio, String fechaPublicacion, Autor autor, String tipo){
        super(ISBN,titulo,cantPaginas,precio,fechaPublicacion,autor);
        this.tipo=tipo;
    }
    public String getTipo(){
        return tipo;
    }
    public void setTipo(String tipo){
        this.tipo=tipo;
    }
    public double calculoDescuento(){
       double desc=0; String date= super.getFechaPublicacion(); String fecha1="15/4/2020", fecha2 = "15/11/2022";
       if((date.compareTo(fecha1) >= 0) && (date.compareTo(fecha2) <= 0)){
           desc+= super.getPrecio()*6.5/100;
        }
        if((( tipo.toUpperCase().equals("DIVULGACION")) || (tipo.toUpperCase().equals("DIVULGACION CIENTIFICA"))) && (super.getAutor().getNacionalidad().toUpperCase().equals("ARGENTINO/A"))){ // divulgacion implementado de esa forma ya que el in.next() puede llegar a solo recibir "divulgacion", ingorando lo que hay despues del espacio en blanco.
            desc+= super.getPrecio()*10/100;
       }
       return desc;
    }
    public String toString(){
        return super.toString() +" \n tipo: " + tipo;
    }
}