import java.util.Scanner;
public class ej5{
    public static void main (String[]args){
        Scanner in= new Scanner(System.in);
        double [] alturas= new double[15]; int i; double suma=0;
        for ( i = 0; i<=14; i++){
            System.out.println("altura de jugador " + ( i+1));
            alturas[i] = in.nextDouble();
            suma+= alturas[i];
        }
        double promedio= suma/15;
        System.out.println("promedio: " + promedio);
        for ( i = 0; i<=14; i++){
            if( alturas[i] >= promedio) {
            System.out.println("altura de jugador " + ( i+1));
            System.out.println(alturas[i]);
        }
    }
}
}