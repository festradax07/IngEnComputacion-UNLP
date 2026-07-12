import java.util.Scanner;
public class Prueba{
    public static void main (String[] args){
        int a,b;
        Scanner in= new Scanner(System.in);
        double c;
        System.out.println("escribe un numero");
        a= in.nextInt();
        System.out.println("escribe otro numero");
        b= in.nextInt();
        c= (double) a/b;
        System.out.println("su division en decimales es:  " + c);
        
        
    }
}