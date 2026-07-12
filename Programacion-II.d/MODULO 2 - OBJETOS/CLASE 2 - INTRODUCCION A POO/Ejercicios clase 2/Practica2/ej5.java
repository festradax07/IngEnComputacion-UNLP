import java.util.Scanner;
public class ej5{
    public static void main (String[]args){
        String[]vector= new String[4];
        Scanner in =new Scanner(System.in);
        for (int i=0; i < vector.length; i++){
            System.out.println("escriba su String");
            vector[i]= in.next(); // debe tener un mensaje oculto
            in.nextLine();
        }
        System.out.println("El mensaje oculto fué ");
        for (int i= 0; i<vector.length; i++){
            System.out.print(vector[i].charAt(0));
        }
    }
}