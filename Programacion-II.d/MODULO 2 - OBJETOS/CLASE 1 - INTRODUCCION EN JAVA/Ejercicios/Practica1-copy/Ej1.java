import java.util.Scanner;
public class Ej1{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        double a,b,c;
        System.out.println("Lado 1: ");
        a= in.nextDouble();
        System.out.println("Lado 2: ");
        b= in.nextDouble();
        System.out.println("Lado 3: ");
        c= in.nextDouble();
        if ((a< b+c) && ( b< a + c) && (c<a+b)){
            double perimetro= a+b+c;
            System.out.println("perimetro del triangulo: " + perimetro);
        } else{
           System.out.println("el triangulo no es VALIDO"); 
        }
    }
}