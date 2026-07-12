public class Vip extends Localidad{
    private boolean especial;
    private double costo;
    public Vip(){
        
    }
    public Vip(int id,int butaca,int fila,String platea,String pago,Comprador comprador,boolean especial, double costo){
        super(id,butaca,fila,platea,pago,comprador);
        this.especial=especial;
        this.costo=costo;
    }
    public Vip(int id,int butaca,int fila,String platea,String pago,Comprador comprador){
        this(id,butaca,fila,platea,pago,comprador,false,0.0);
    }
    public boolean getEspecial(){
        return especial;
    }
    public double getCosto(){
        return costo;
    }
    public void setEspecial(boolean especial){
        this.especial=especial;
    }
    public void setCosto(double costo){
        this.costo=costo;
    }
    public double calcularTotal(){
        double tot, preciobase= PrecioPorFilayPorPlatea.obtenerPrecioBaseEntrada(super.getFila(),super.getPlatea());
        tot= preciobase;
        if(especial){
            tot+= costo;
        }
        if(super.getButaca() <=5){
            tot+= (preciobase*15/100);
        }
        if(super.getPago().equalsIgnoreCase("tarjeta de credito")){ // equalsignorecase no distingue MAYUSCULAS de minusculas ej: EsTO "es igual a "==> esto 
            tot+= (tot*10/100);
        } else if(super.getPago().equalsIgnoreCase("tarjeta de debito")){
            tot-= (tot*5/100);
        }
        return tot;
    }
    public String toString(){
        return super.toString() + " exp especial?: " + especial + " costo: "+ costo;
    }
}