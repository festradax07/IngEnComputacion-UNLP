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
        mostrarCalculo(vehiculos,diml);
        
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void mostrarCalculo(Vehiculo[]vehiculos, int diml){
        for ( int j= 0; j< diml; j++){
            System.out.println ("\n vehiculo " + (j+1) + " de tipo: " +vehiculos[j].getClass().getName() + " deberá pagar  un total de "+ vehiculos[j].calcularCostoImpuestos() + "$");
        }
    }
    public static Vehiculo LeerVehiculo(Scanner in ){
        Vehiculo vehiculo = null;    
        int año; double importe; Propietario propietario; // de vehiculo;
        String nombre; String apellido; int CIT; // de propietario;
        int opcion;// selector.
        System.out.println("año de fabricacion: ");
        año= in.nextInt();
        System.out.println("importe a cobrar:");
        importe= in.nextDouble();
        System.out.println("DATOS DEL PROPIETARIO: ");
        nombre= in.next();
        in.nextLine();
        apellido=in.next();
        in.nextLine();
        CIT = in.nextInt();
        propietario= new Propietario(nombre,apellido,CIT);
        System.out.println( "elija el tipo de VEHICULO 1- Automotor; 2- Embarcacion");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- Automotor; 2- Embarcacion)");
                    opcion= in.nextInt();
            }
        switch(opcion){
                case 1: String patente,descripcion; // variables para automotor
                        System.out.println("patente: ");
                        patente= in.next();
                        in.nextLine();
                        System.out.println("Desripcion: ");
                        descripcion= in.next();
                        vehiculo= new Automotor(año,importe,propietario,patente,descripcion);
                        System.out.println("AUTOMOTOR CREADO Y GUARDADO");
                        break;
                case 2: int REY; String nombree, tipo; double valor; // variables para embarcacion
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
    }
