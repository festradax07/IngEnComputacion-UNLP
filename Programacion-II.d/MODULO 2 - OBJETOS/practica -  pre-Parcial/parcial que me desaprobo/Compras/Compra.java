public  abstract class Compra{
    private int num;
    private int categoria;
    private String nombreEstadio;
    private Fecha fecha;
    private double importe;
    public Compra(){
        
    }
    public Compra(int num, int categoria, String nombreEstadio, Fecha fecha, double importe){
        this.num=num;
        this.categoria=categoria;
        this.nombreEstadio=nombreEstadio;
        this.fecha=fecha;
        this.importe=importe;
    }
    public int getNum(){
        return num;
    }
    public double getImporte(){
        return importe;
    }
    public int getCategoria(){
    return categoria;
    }
    public String getNombreEstadio(){
        return nombreEstadio;
    }
    public Fecha getFechaPartido(){
        return fecha;
    }
    public void setNum( int num){
        this.num=num;
    }
    public void setCategoria(int categoria){
        this.categoria=categoria;
    }
    public void setNombreEstadio( String nombreEstadio){
        this.nombreEstadio=nombreEstadio;
    }
    public void setImporte(double importe){
        this.importe=importe;
    }
    public void setFechaPartido(Fecha fecha){
        this.fecha=fecha;
    }
    public abstract double darPromo();
    public String toString(){
        return "numero " + num + " categoria" + categoria + "nombre del estadio " + "fecha: " + fecha.toString() + "\n IMPORTE A PAGAR: " + importe;
    }
    
}