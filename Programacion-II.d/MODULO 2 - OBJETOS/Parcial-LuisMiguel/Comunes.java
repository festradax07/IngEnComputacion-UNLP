public class Comunes extends Localidad{
    private String tipo;
    private double costoImp;
    public Comunes(){
        
    }
    public Comunes(int id,int butaca,int fila,String platea,String pago,Comprador comprador, String tipo){
        super(id,butaca,fila,platea,pago,comprador);
        this.tipo=tipo;
        this.costoImp=0;
    }
    public Comunes(int id,int butaca,int fila,String platea,String pago,Comprador comprador,String tipo, double costoImp){
        this(id,butaca,fila,platea,pago,comprador,tipo);
        this.costoImp=costoImp;
    }
    public String getTipo(){
        return tipo;
    }
    public double getCostoImp(){
        return costoImp;
    }
    public void setTipo(String tipo){
        this.tipo=tipo;
    }
    public void setCostoImp(double costoImp){
        this.costoImp=costoImp;
    }
    public double calcularTotal(){
        double tot, preciobase= PrecioPorFilayPorPlatea.obtenerPrecioBaseEntrada(super.getFila(),super.getPlatea());
        tot= preciobase;
        if(tipo.equalsIgnoreCase("fisica")){
            tot+= costoImp;
        }else if(tipo.equalsIgnoreCase("digital")){
            tot+= 2400;
        }
        if(super.getPago().equalsIgnoreCase("tarjeta de credito")){
            tot+= (tot*8/100);
        } else if(super.getPago().equalsIgnoreCase("tarjeta de debito")){
            tot-= (tot*2.5/100);
        }
        return tot;
    }
    public String toString(){
        return super.toString() + " tipo: " + tipo + " costo de impresion: " + costoImp;
    }
}