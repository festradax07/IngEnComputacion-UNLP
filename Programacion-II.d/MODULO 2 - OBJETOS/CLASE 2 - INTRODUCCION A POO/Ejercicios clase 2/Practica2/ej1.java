import java.util.Scanner;
public class ej1{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("nombre:");
        String nombre= in.next();
        System.out.println("dni");
        int dni= in.nextInt();
        System.out.println("edad");
        int edad= in.nextInt();
        Persona pepe = new Persona(nombre,dni,edad);
        System.out.println(pepe.toString());
    }
}