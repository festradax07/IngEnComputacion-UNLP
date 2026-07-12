import java.util.Scanner;
public class Ej3{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese un numero:");
        int num= in.nextInt(); int factorial=1;
        System.out.println("factorial de " + num + ":  ");
        while( num != 0 ){
            factorial *= num;
            num--;
        }
        System.out.println(factorial);
    }
}