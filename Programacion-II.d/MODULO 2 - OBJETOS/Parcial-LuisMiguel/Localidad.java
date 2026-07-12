public abstract class Localidad{
    private int id;
    private int butaca;
    private int fila;
    private String platea;
    private String pago;
    private Comprador comprador;
    public Localidad(){
        
    }
    public Localidad(int id,int butaca,int fila,String platea,String pago,Comprador comprador){
      this.id=id;
      this.butaca=butaca;
      this.fila=fila;
      this.platea=platea;
      this.pago=pago;
      this.comprador= comprador;
    }
    public int getFila(){
        return fila;
    }
    public String getPago(){
        return pago;
    }
    public String getPlatea(){
        return platea;
    }
    public int getButaca(){
        return butaca;
    }
    public Comprador getComprador(){
        return comprador;
    }
    public abstract double calcularTotal();
    public String toString(){
        return " id: "+ id + " butaca: "+ butaca + " fila: " + fila + " platea: " + platea + " pago: "  + pago + " \n \t datos del comprador: " + comprador.toString();
    }
}