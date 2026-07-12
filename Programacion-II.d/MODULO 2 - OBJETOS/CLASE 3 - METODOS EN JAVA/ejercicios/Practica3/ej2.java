import java.util.Scanner;
public class ej2{
    public static void main (String[]args){
        Scanner in = new Scanner (System.in);
        balanza verduleria = new balanza();
        verduleria.iniciarCompra();
        double peso, precioKg;
        System.out.println("peso");
        peso= in.nextDouble();
        System.out.println("Precio por kg");
        precioKg= in.nextDouble();
        while( peso!= 0){
            verduleria.registrarProducto(peso,precioKg);
            System.out.println(" producto registrado. Siguiente producto:");
            System.out.println("peso:");
            peso= in.nextDouble();
            if ( peso!=0){
            System.out.println("Precio por kg: ");
            precioKg= in.nextDouble();
        }
    }
    System.out.println(verduleria.devolverResumen());
}
}