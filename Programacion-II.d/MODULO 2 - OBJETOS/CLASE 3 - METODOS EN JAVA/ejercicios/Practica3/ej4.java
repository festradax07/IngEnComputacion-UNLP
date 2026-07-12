import java.util.Scanner;
public class ej4{
    public static void main (String[]args){
        Scanner in = new Scanner (System.in);
        Jugador[] jugadores= new Jugador[3];
        String nombre; int DNI, edad, partidos,numGoles;
        for (int i =0; i< jugadores.length; i++){
            System.out.println("datos de jugador " + (i+1));
            System.out.println("nombre:");
            nombre= in.next();
            System.out.println("Dni");
            DNI= in.nextInt();
            System.out.println("Edad");
            edad= in.nextInt();
            System.out.println("cant de partidos jugados");
            partidos= in.nextInt();
            System.out.println("numero de goles");
            numGoles= in.nextInt();
            jugadores[i]= new Jugador(nombre,DNI,edad,partidos,numGoles); // invoco al constructor del objeto dentro del vector.
        }
        System.out.println("cantidad de jugadores con mas de 100 partidos jugados =  " + Masde100(jugadores));
    }
    public static int Masde100(Jugador[]jugadores){
        int tot=0;
        for (int i= 0; i< jugadores.length; i++){
            if (jugadores[i].getPartidos() > 100 ){
                tot++;
            }
        }
        return tot;
    }
}