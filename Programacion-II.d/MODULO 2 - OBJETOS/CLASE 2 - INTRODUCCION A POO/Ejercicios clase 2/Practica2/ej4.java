import java.util.Scanner;
// declaracion de mi constante
public class ej4{
    public static void main (String[] args){
        Partido[] partidos= new Partido[3];
        Scanner in= new Scanner(System.in);
        int i;String local,visitante; int golesLocal, golesVisitante;
        for (i=0; i<= (partidos.length-1); i++){
            System.out.println("nombre local");
            local = in.next();
            in.nextLine();
            System.out.println("nombre visitante");
            visitante = in.next();
            System.out.println("goles del local");
            golesLocal= in.nextInt();
            System.out.println("goles del visitante");
            golesVisitante= in.nextInt();
            partidos[i]= new Partido(local,visitante,golesLocal,golesVisitante);
        }
        System.out.println("Partidos ganados por river " + partidosRover(partidos));
        System.out.println(" goles de boca jugando de local " + localBoca(partidos));
        System.out.println("porcentaje de empates " + porcentaje(partidos)); 
    }
    public static int partidosRover(Partido[]partidos){
        int cont=0;
        for( int i=0; i<=partidos.length-1; i++){
            if (partidos[i].getGanador().toUpperCase().equals("RIVER")){
                cont++;
            }
        }
        return cont;
    }
    public static int localBoca(Partido[] partidos){
        int cont=0;
        for ( int i= 0; i<=partidos.length-1; i++){
            if( partidos[i].getLocal().toUpperCase().equals("BOCA")){
                cont+= partidos[i].getGolesLocal();
            }
        }
        return cont;
    }
    public static double porcentaje (Partido[]partidos){
        double porcentaje; int cont=0;
        for (int i=0; i<=partidos.length-1; i++){
            if( partidos[i].hayEmpate()){
                cont++;
            }
        }
        porcentaje = (double)(cont*100)/partidos.length;
        return porcentaje;
    }
}