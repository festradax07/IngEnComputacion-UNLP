import java.util.Scanner;
public class ProgramaEditorial{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        Ejemplar [] ejemplares = new Ejemplar[3];
        int i=0; String sigo;
        System.out.println("Desea agregar un nuevo ejemplar(SI/NO)?");
        sigo= in.next();
        while ((i < ejemplares.length) && (sigo.toUpperCase().equals("SI"))){
            ejemplares[i]= LeerEjemplar(in);
            i++;
            System.out.println();
            System.out.println("Desea agregar un nuevo ejemplar(SI/NO)?");
            sigo=in.next();
        }
        if(i == ejemplares.length){
            System.out.println("se guardaron los " + ejemplares.length + " Ejemplares. ");
        }
        imprimirListado(ejemplares);
        PublicarEjemplares(ejemplares);
        imprimirListado(ejemplares);
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void imprimirListado(Ejemplar [] ejemplares){
        System.out.println("LISTADO DE EJEMPLARES: ");
        for (int i=0; i<ejemplares.length; i++){
            System.out.println( ejemplares[i].mostrar());
        
        }
        System.out.println("-- fin del Listado--");
    }
    public static void PublicarEjemplares(Ejemplar[]ejemplares){
        System.out.println("Publicando... ");
        for (int i=0; i<ejemplares.length; i++){
            ejemplares[i].publicar();
        
        }
        System.out.println("-- fin de la publicación--");
    }
    
    public static Ejemplar LeerEjemplar( Scanner in ){
        Ejemplar ejemplar = null;    
        int id, cantPag; String resumen; Responsable responsable; String titulo; int cantCapitulos; boolean deBolsillo; String nombre; int cantArticulos; String nombreApellido; int dni;
        int opcion;
        System.out.println("numero de id: ");
        id= in.nextInt();
        System.out.println("cant de paginas");
        cantPag= in.nextInt();
        System.out.println("resumen: ");
        resumen= in.next();
        in.nextLine();
        System.out.println("Datos del responsable: ");
        System.out.println("nombre y apellido (junto)");
        nombreApellido = in.next();
        in.nextLine();
        System.out.println("dni: ");
        dni = in.nextInt();
        responsable= new Responsable(nombreApellido,dni);
        System.out.println( "elija el tipo de ejemplar 1- libro; 2- revista");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- libro; 2- revista)");
                    opcion= in.nextInt();
            }
        switch(opcion){
                case 1: System.out.println("titulo:");
                        titulo= in.next();
                        in.nextLine();
                        System.out.println("cantidad de capitulos");
                        cantCapitulos= in.nextInt();
                        System.out.println("es un libro debolsillo?");
                        deBolsillo= in.nextBoolean();
                        ejemplar= new Libro(id,cantPag,resumen,responsable,titulo,cantCapitulos,deBolsillo);
                        System.out.println("LIBRO CREADO Y GUARDADO");
                        break;
                case 2: System.out.println("Nombre de la revista");
                        nombre= in.next();
                        in.nextLine();
                        System.out.println(" cantidad de articulos: ");
                        cantArticulos= in.nextInt();
                        ejemplar= new Revista(id,cantPag,resumen,responsable, nombre,cantArticulos);
                        System.out.println("REVISTA CREADA Y GUARDADA");
                        break;
            }
            return ejemplar;
        }
    }