import java.util.Scanner;
public class ProgramaRASE{
    public static void main (String[]args){
        Solicitud[]solicitudes= new Solicitud[5];
        Scanner in = new Scanner(System.in);
        int diml=0; String sigo;
        System.out.println("Desea agregar un nuevo vehiculo (SI/NO)?");
        sigo= in.next();
        while ((diml < solicitudes.length) && (sigo.toUpperCase().equals("SI"))){
            solicitudes[diml]= LeerSolicitud(in);
            diml++;
            System.out.println();
            System.out.println("Desea agregar un nuevo Vehiculo(SI/NO)?");
            sigo=in.next();
        }
        if(diml == solicitudes.length){
            System.out.println("se guardaron los " + solicitudes.length + " Vehiculos. ");
        }
        evaluar(solicitudes,diml);// algo que hacer de modulo
        LeerTodo(solicitudes,diml);
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void evaluar(Solicitud[]solicitudes, int diml){
        for (int i=0; i<diml; i++){
            if(solicitudes[i].accedeAlSubsidio()){
                solicitudes[i].setTarifa(solicitudes[i].calcularGasto());
            } else{
                solicitudes[i].setTarifa(solicitudes[i].getIngresosMensuales()*5/100);
            }
        }
    }
    public static void LeerTodo(Solicitud[]solicitud, int diml){
        for ( int j= 0; j< diml; j++){
            System.out.println ("\n SOLICITUD " + (j+1) + " de tipo: " + solicitud[j].getClass().getName() + "\n : " + solicitud[j].mostrar());
        }
    }
    public static Solicitud LeerSolicitud(Scanner in ){   
        Solicitud solicitud =null; 
        String gestion,fecha; double ingresos; int cantI; String region; Persona persona;// de superclase;
        String nombre, apellido; int Cuit;// de  clase v.i ;
        int opcion;// selector.
        System.out.println("gestion: ");
        gestion= in.next();
        in.nextLine();
        System.out.println("fecha: ");
        fecha=in.next();
        in.nextLine();
        System.out.println("ingresos: ");
        ingresos=in.nextDouble();
        System.out.println("cantidad de integrantes: ");
        cantI=in.nextInt();
        System.out.println("region: ");
        region=in.next();
        in.nextLine();
        System.out.println("Datos de Persona: ");
        System.out.println("Nombre: ");
        nombre=in.next();
        in.nextLine();
        System.out.println("Apellido: ");
        apellido=in.next();
        in.nextLine();
        System.out.println("CUIT: ");
        Cuit=in.nextInt();
        persona= new Persona(nombre,apellido,Cuit);
        System.out.println( "elija el tipo de SOLICITUD 1- GAS ; 2-AGUA ");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- GAS ; 2- AGUA )");
                    opcion= in.nextInt();
            }
        switch(opcion){
                case 1: int numMedidor; double tamañoH; int cantEstufas;// variables para subclase
                        System.out.println("numero de medidor: ");
                        numMedidor= in.nextInt();
                        System.out.println("metros cuadrados:  ");
                        tamañoH= in.nextDouble();
                        System.out.println("cantidad de estufas: ");
                        cantEstufas=in.nextInt();
                        solicitud= new Gas(gestion,fecha,ingresos,cantI,region,persona,numMedidor,tamañoH,cantEstufas);
                        System.out.println("SOLICITUD DE GAS CREADA Y GUARDADA");
                        break;
                case 2: int NIS, cantElectro;// variables para subclase
                        System.out.println("NIS: ");
                        NIS=in.nextInt();
                        System.out.println("cantidad de Electrodomesticos: ");
                        cantElectro=in.nextInt();
                        solicitud = new Electricidad(gestion,fecha,ingresos,cantI,region,persona,NIS,cantElectro);
                        System.out.println("SOLICITUD DE ELECTRICIDAD CREADA Y GUARDADA");
                        break;
                        
            }
        return solicitud;
    }
}