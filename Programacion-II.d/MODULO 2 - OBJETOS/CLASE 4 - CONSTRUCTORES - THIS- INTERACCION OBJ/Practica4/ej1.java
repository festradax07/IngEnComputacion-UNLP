import java.util.Scanner;
public class ej1{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("lado1: ");
        double lado1= in.nextDouble();
        System.out.println("lado2: ");
        double lado2= in.nextDouble();
        System.out.println("lado3: ");
        double lado3= in.nextDouble();
        System.out.println("color relleno: ");
        String colorR= in.next();
        in.nextLine();
        System.out.println("color Linea: ");
        String coloL=in.next();
        Triangulo triangulo= new Triangulo(lado1,lado2,lado3,colorR,coloL);
        Triangulo [] triangulos= new Triangulo [10];
        triangulos[1] = new Triangulo(lado1,lado2,lado3,colorR,coloL);
    }
}