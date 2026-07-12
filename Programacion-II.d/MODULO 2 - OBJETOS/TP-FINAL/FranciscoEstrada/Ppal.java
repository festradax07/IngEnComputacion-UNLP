import java.util.Scanner;
public class Ppal{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("Desea Crear una Editorial? (si/no)");
        String sigo= in.next();
        in.nextLine();
        if(!sigo.toUpperCase().equals("SI")){
            System.out.println("--fin del programa--");
            System.exit(0);
        }
        String nombre; int cantPremios;
        System.out.println("NOMBRE DE EDITORIAL: ");
        nombre= in.next();
        in.nextLine();
        System.out.println("cantidad de premios: ");
        cantPremios= in.nextInt();
        Editorial editorial= new Editorial(nombre,cantPremios);
        System.out.println("Editorial creada. Faltan sus 5 libros.");
        for (int i=0; i< editorial.getLibros().length; i++){
            editorial.setLibro(LeerLibro(in), i);
            System.out.println("Libro " + (i+1) + " agregado. ");
        }
        System.out.println("se guardaron los " + 5 + " libros. ");
        AplicarDescuentos(editorial.getLibros());
        editorial.Totalizar();
        System.out.println("promociones aplicadas y precios totalizados. imprimir? (si/No)");// algo que hacer de modulo
        sigo= in.next();
        if(sigo.toUpperCase().equals("SI")){
            System.out.println(editorial.toString());
        }
        System.out.println("--fin del programa--");
        in.close();
    }
    public static void AplicarDescuentos(Libro [] libros){
        double  dato= 0;
        for (int i=0; i< libros.length; i++){
            dato= libros[i].getPrecio() - libros[i].calculoDescuento();
            libros[i].setPrecio(dato);
        }
    }
    public static Libro LeerLibro(Scanner in ){
        Libro libro = null;    
        String ISBN,titulo; int cantPaginas; double precio; 
        String fechaPublicacion; 
        Autor autor;String name, apellido; int Dni; String nacionalidad;// de superclase;
         System.out.println("ISBN: ");
         ISBN= in.next();
         in.nextLine();
         System.out.println("titulo:");
         titulo= in.next();
         System.out.println("cantidad de paginas: ");
         cantPaginas=in.nextInt();
         System.out.println("precio: ");
         precio=in.nextDouble();
         System.out.println("Fecha de publicacion:(DD/MM/YYYY) ");
         fechaPublicacion= in.next();
         in.nextLine();
         System.out.println("DATOS DEL AUTOR:");
         System.out.println("nombre del autor: ");
         name=in.next();
         in.nextLine();
         System.out.println("apellido: ");
         apellido=in.next();
         in.nextLine();
         System.out.println("dni: ");
         Dni=in.nextInt();
         System.out.println("nacionalidad (ARGENTINO/A, PERUANO/A, COLOMBIANO/A... agregar el /a al final): ");
         nacionalidad= in.next();
         autor= new Autor(name,apellido,Dni,nacionalidad); // obj autor;
    
        int opcion;// selector.
        
        System.out.println( "elija el tipo de LIBRO 1- LITERATURA ; 2- DIVULGATIVO");
        opcion=in.nextInt();
        while (( opcion < 1) || (opcion > 2)){
                    System.out.println("ERROR. Escriba un numero valido (1- LITERATURA; 2- DIVULGATIVO )");
                    opcion= in.nextInt();
            }
        switch(opcion){
                case 1: String genero; boolean debolsillo;// variables para subclase
                        System.out.println("genero: (cuento,poemario,novela) ");
                        genero= in.next();
                        in.nextLine();
                        System.out.println("es de bolsillo?: (true/false) ");
                        debolsillo= in.nextBoolean();
                        libro= new Literatura(ISBN,titulo,cantPaginas,precio,fechaPublicacion,autor,genero,debolsillo);
                        System.out.println("LIBRO DE LITERATURA CREADO Y GUARDADO");
                        break;
                case 2:  String tipo;// variables para subclase
                        System.out.println("tipo: (biografia o divulgacion cientifica) ");
                        tipo=in.next();
                        in.nextLine();
                        libro= new Divulgativo(ISBN,titulo,cantPaginas,precio,fechaPublicacion,autor,tipo);
                        System.out.println("LIBRO DE DIVULGACION  CREADO Y GUARDADO");
                        break;
            }
           return libro;
    }
}