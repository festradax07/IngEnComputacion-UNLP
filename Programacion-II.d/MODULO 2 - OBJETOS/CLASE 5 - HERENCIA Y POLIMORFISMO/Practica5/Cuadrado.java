public class Cuadrado extends Figura{
    private double lado;
    public Cuadrado(String colorR, String colorL, Punto p, double lado){
        super(colorR,colorL,p);
        this.lado=lado;
    }
    public Cuadrado(){
        
    }
    public void setLado(double lado){
        this.lado=lado;
    }
    public double getLado(){
        return lado;
    }
    public double calcularArea(){
        return lado*lado;
    }
    public double calcularPerimetro(){
        return 4*lado;
    }
    public void dibujar(){
     System.out.println("Cuadrado: " );
     super.dibujar();
     System.out.println("lado (*4): " + lado);
    }
}