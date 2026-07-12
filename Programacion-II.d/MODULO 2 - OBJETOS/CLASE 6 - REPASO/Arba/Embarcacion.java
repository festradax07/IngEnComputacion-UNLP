public class Embarcacion extends Vehiculo{
    private int REY;
    private String nombreE;
    private String tipo;
    private double valor;
    public Embarcacion(){
        
    }
    public Embarcacion(int año, double importe, Propietario propietario, int REY, String nombre, String tipo, double valor ){
        super(año,importe,propietario);
        this.REY=REY;
        nombreE=nombre;
        this.tipo=tipo;
        this.valor=valor;
    }
    public int  getRey(){
        return REY;
    }
    public String getNombreE(){
        return nombreE;
    }
    public String getTipo(){
        return tipo;
    }
    public double getValor(){
        return valor;
    }
    public void setRey(int REY){
        this.REY=REY;
    }
    public void setNombreE(String nombre){
        nombreE=nombre;
    }
    public void setValor(double valor){
        this.valor=valor;
    }
    public void setTipo(String tipo){
        this.tipo=tipo;
    }
    public double calcularCostoImpuestos(){
        double costo=this.getImporte();
        if( valor < 6000){
            costo+= valor*4/100;
        } else if (( valor >= 6000) && (valor <=180000)){
            costo+= valor*2/100;
        } else if( valor > 180000){
            costo+=valor*5/100;
        }
        return costo;
    }
}