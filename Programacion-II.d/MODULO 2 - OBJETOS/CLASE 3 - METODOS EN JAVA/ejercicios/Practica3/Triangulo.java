public class Triangulo {
    double lado1;
    double lado2;
    double lado3;
    String colorRelleno;
    String colorLinea;
    
    public Triangulo(){   
    }
    public void setLado1(double lado1){
        this.lado1 = lado1;
        
    }
    public void setLado2(double lado2){
        this.lado2= lado2;
    }
    public void setLado3( double lado3){
        this.lado3=lado3;
    }
    public void setColorRelleno(String colorRelleno){
        this.colorRelleno= colorRelleno;
    }
    public void setColorLinea(String colorLinea){
        this.colorLinea= colorLinea;
    }
    public double getLado1(){
        return lado1;
    }
    public double getLado2(){
        return lado2;
    }
    public double getLado3(){
        return lado3;
    }
    public String getColorRelleno(){
        return colorRelleno;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public double calcularArea(){
        double a;
        double s = (this.getLado1() + this.getLado2() + this.getLado3())/2;
        double arg= s*((s-this.getLado1())*(s-this.getLado2())*(s-this.getLado3()));
        a = Math.sqrt(arg);
        return a;
    }
    public double calcularPerimetro(){
        double p = this.getLado1() + this.getLado2() + this.getLado3();
        return p;
    }
    public String toString(){
        return ( "lado1" + this.getLado1() + "lado2" + this.getLado2() + "lado3" + this.getLado3() + "color de relleno" + this.getColorRelleno() + " color de Linea " + this.getColorLinea()); 
    }

}