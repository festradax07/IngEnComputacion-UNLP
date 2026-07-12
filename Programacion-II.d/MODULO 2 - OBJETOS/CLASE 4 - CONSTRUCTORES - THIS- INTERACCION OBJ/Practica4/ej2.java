import java.util.Scanner;
public class ej2{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        String nombre= in.next();
        double sueldo= in.nextDouble();
        int cantcampeonatos= in.nextInt();
        Entrenador trainer= new Entrenador(nombre,sueldo,cantcampeonatos);
        trainer.toString();
    }
}