import java.util.Scanner;
public class Ej2{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("PATENTE: "); 
        int patente = in.nextInt();
        while( patente != 0){
        
        if (patente % 2 == 0) {
            System.out.println("Puede pasar");
        }else {
            System.out.println("NO puede pasar");
        }
         System.out.println("PATENTE: ");
         patente = in.nextInt();
        }
}
}