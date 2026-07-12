import java.util.Scanner;
public  class ej1{
    public static void main (String []args){
       Scanner in = new Scanner(System.in);
       Triangulo tri= new Triangulo();
       System.out.println("lado1:");
       double lado = in.nextDouble(); 
       tri.setLado1(lado);
       System.out.println("lado2:");
       lado= in.nextDouble();
       tri.setLado2(lado);
       System.out.println("lado3:");
       lado= in.nextDouble();
       tri.setLado3(lado);
       System.out.println("color de Relleno:");
       String color = in.next();
       in.nextLine();
       tri.setColorRelleno(color);
       System.out.println("color de linea:");
       color= in.next();
       tri.setColorLinea(color);
       System.out.println("perimetro del triangulo" + tri.calcularPerimetro());
       System.out.println("Area del traingulo " + tri.calcularArea());
       System.out.println( "datos del triangulo: " + tri.toString());
       
    }
}
