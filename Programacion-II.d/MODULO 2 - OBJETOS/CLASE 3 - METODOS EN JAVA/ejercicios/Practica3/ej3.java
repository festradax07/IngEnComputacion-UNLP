import java.util.Scanner;
public class ej3{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        Entrenador entrenador = new Entrenador();
        System.out.println (" nombre de entrenador");
        String nombre = in.next();
        entrenador.setNombre(nombre);
        System.out.println( " sueldo basico");
        double sueldo= in.nextDouble();
        entrenador.setSueldo(sueldo);
        System.out.println(" cantidad de campeonatos ganados");
        int cant= in.nextInt();
        entrenador.setCantCampeonatos(cant);
        System.out.println (entrenador.toString());
        System.out.println(" total de sueldo a cobrar: " + entrenador.calcularSueldoACobrar());
        in.close();
    }
}