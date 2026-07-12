import java.util.Scanner;
public class ppal{
    public static void main (String[]args){
        Reserva[]reservas = new Reserva[3];
        Scanner in = new Scanner(System.in);
        int diml=0; String sigo;
        System.out.println("Desea agregar una nueva reserva (SI/NO)?");
        sigo= in.next();
        if(!sigo.toUpperCase().equals("SI")){
            System.out.println("--fin del programa--");
            System.exit(0);
        }
        while ((diml < reservas.length) && (sigo.toUpperCase().equals("SI"))){
            reservas[diml]= LeerReserva(in);
            diml++;
            System.out.println();
            System.out.println("Desea agregar una nueva reserva (SI/NO)?");
            sigo=in.next();
        }
        if(diml == reservas.length){
            System.out.println("se guardaron las " + reservas.length + " Reservas. ");
        }
        AplicarPromocion(reservas,diml);
        mostrar(reservas,diml);// algo que hacer de modulo    
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void AplicarPromocion(Reserva[]reservas,int diml){
        for (int i=0;i< diml;i++){
            reservas[i].calcularPromocion();
        }
    }
    public static void mostrar(Reserva[]reservas,int diml){
        for ( int i=0; i< diml;i++){
            System.out.println(reservas[i].toString());
        }
    }
    public static void leerPasajeros( Grupal grupo, int dato, Scanner in){
        int dni, numA; Pasajero pasajero;
        for (int i=0; i < dato; i++){
                        System.out.println("dni del pasajero" + (i+1) + " : ");
                        dni= in.nextInt();
                        System.out.println("numero de asiento del pasajero" + (i+1) + ": ");
                        numA= in.nextInt();
                        pasajero = new Pasajero(dni,numA);
                        grupo.agregarPasajero(pasajero);
                        }
    }
    public static Reserva LeerReserva(Scanner in ){   
        Reserva reserva= null;
        int num; String aero,aeroD,fecha; // de superclase;
        int dni, numA; // de  clase v.i ;
        int opcion;// selector.
        System.out.println("numero de reserva:");
        num=in.nextInt();
        System.out.println("aeropuerto de origen:");
        aero= in.next();
        in.nextLine();
        System.out.println("aeropuerto de Destino: ");
        aeroD= in.next();
        in.nextLine();
        System.out.println("fecha de vuelo: ");
        fecha = in.next();
        Pasajero pasajero;// propietario= new Propietario(nombre,apellido,CIT);
        System.out.println( "elija el tipo de VEHICULO 1- Clasica ; 2-Grupal ");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- clasica ; 2-Grupal )");
                    opcion= in.nextInt();
            }    
        switch(opcion){
                case 1: // variables para subclase
                        System.out.println("Datos del pasajero: ");
                        dni= in.nextInt();
                        System.out.println("numero de asiento: ");
                        numA=in.nextInt();
                        pasajero= new Pasajero(dni,numA);
                        reserva = new Clasica(num,aero,aeroD,fecha,pasajero);
                        System.out.println("Reserva CLASICA CREADA Y GUARDADA");
                        break;
                case 2:  // variables para subclase
                        System.out.println("¿cuantos pasajeros serán? ( de 1 hasta 30) ");
                        int opcion2= in.nextInt();
                        while (( opcion2 < 1) || (opcion2 > 30)){
                        System.out.println("ERROR. Escriba un numero valido (de 1 hasta 30)");
                         opcion2= in.nextInt();
                        }  
                        Grupal grupo = new Grupal(num,aero,aeroD,fecha);
                        leerPasajeros(grupo,opcion2,in);
                        reserva= grupo;
                    }
            return reserva;
    }
}
