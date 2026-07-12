import java.util.Scanner;
public class ppal{
    public static void main (String[]args){
        Empleado[] employer= new Empleado[2];
        Scanner in = new Scanner (System.in);int campeonatos; int numPartidos; int cantGoles;int dni; String nombre; int edad; double sueldo; String opcion;
        for (int i=0; i< employer.length; i++){
            System.out.println ("dni: ");
            dni= in.nextInt();
            System.out.println ("nombre: ");
            nombre= in.next();
            in.nextLine();
            System.out.println ("edad: ");
            edad= in.nextInt();
            System.out.println ("sueldo: ");
            sueldo= in.nextDouble();
            System.out.println (" Entrenador o Jugador?");
            opcion = in.next();
            in.nextLine();
            if (opcion.toUpperCase().equals("ENTRENADOR")){
                System.out.println ("campeonatos: ");
                campeonatos= in.nextInt();
                employer[i]= new Entrenador(dni,nombre,edad,sueldo,campeonatos);
            } else if (opcion.toUpperCase().equals("JUGADOR")){
                System.out.println ("numero de partidos jugados: ");
                numPartidos= in.nextInt();
                System.out.println ("Cantidad de goles: ");
                cantGoles= in.nextInt();
                employer[i]= new Jugador(dni,nombre,edad,sueldo,numPartidos,cantGoles);
            }
        }
        for (int i=0; i<employer.length; i++){
             System.out.println(employer[i].toString());
            }
        in.close();
    }
}