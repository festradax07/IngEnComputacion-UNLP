import java.util.Scanner;
public class ProgramaArba{
    public static void main (String[]args){
        Vehiculo[]vehiculos= new Vehiculo[3];
        Scanner in = new Scanner(System.in);
        int diml=0; String sigo;
        System.out.println("Desea agregar un nuevo vehiculo (SI/NO)?");
        sigo= in.next();
        while ((diml < vehiculos.length) && (sigo.toUpperCase().equals("SI"))){
            vehiculos[diml]= LeerVehiculo(in);
            diml++;
            System.out.println();
            System.out.println("Desea agregar un nuevo Vehiculo(SI/NO)?");
            sigo=in.next();
        }
        if(diml == vehiculos.length){
            System.out.println("se guardaron los " + vehiculos.length + " Vehiculos. ");
        }
        algo(vehiculos,diml);// algo que hacer de modulo
        
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void algo(Vehiculo[]vehiculos, int diml){
        for ( int j= 0; j< diml; j++){
            System.out.println ("\n vehiculo " + (j+1) + " de tipo: " +vehiculos[j].getClass().getName() + " deberá pagar  un total de "+ vehiculos[j].calcularCostoImpuestos() + "$");
        }
    }
    public static Vehiculo LeerVehiculo(Scanner in ){
        Vehiculo vehiculo = null;    
         // de superclase;
         // de  clase v.i ;
        int opcion;// selector.
        
        // propietario= new Propietario(nombre,apellido,CIT);
        System.out.println( "elija el tipo de VEHICULO 1- ; 2- ");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- ; 2- )");
                    opcion= in.nextInt();
            }
        switch(opcion){
                case 1: // variables para subclase
                        System.out.println("patente: ");
                        patente= in.next();
                        in.nextLine();
                        System.out.println("Desripcion: ");
                        descripcion= in.next();
                        vehiculo= new Automotor(año,importe,propietario,patente,descripcion);
                        System.out.println("AUTOMOTOR CREADO Y GUARDADO");
                        break;
                case 2:  // variables para subclase
                        System.out.println("REY: ");
                        REY=in.nextInt();
                        System.out.println("nombre Embarcacion: ");
                        nombree=in.next();
                        in.nextLine();
                        System.out.println("tipo de embarcacion: ");
                        tipo = in.next();
                        System.out.println("valor: ");
                        valor= in.nextDouble();
                        vehiculo= new Embarcacion(año,importe,propietario,REY,nombree,tipo,valor);
                        System.out.println("EMBARCACION CREADA Y GUARDADA");
                        break;
            }
            return vehiculo;
    }