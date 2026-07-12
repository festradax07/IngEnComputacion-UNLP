import java.util.Scanner;
public class hipermercado{
    public static void main (String[] args){
        Scanner in = new Scanner(System.in);
        System.out.println("BIENVENIDO AL HIPERMERCADO 'GOKU'");
        System.out.println("Que desea hacer? 1- ingresar producto. 2- mostrar el contenido del mismo.");
        int opcion = in.nextInt(); int opcionv;
        int i= 0;
        Producto[] productos = new Producto[3];
         while( opcion != 0){
             if( opcion == 1) {
                 if ( i < productos.length){
                 productos[i]= agregarProducto(in);
                 i++;
                } else{
                    System.out.println("NO SE PUEDEN AGREGAR MAS PRODUCTOS. DEPOSITO LLENO.");
                }
            } else if ( opcion == 2){
                 System.out.println("1- para mostrar el ultimo producto registrado. 2- para mostrar todos los productos registrados");
                  opcionv= in.nextInt();
                   if( opcionv == 1){
                 System.out.println(productos[i-1].toString()) ;
                } else if (opcionv==2){
                    for (int j = 0; j < i; j++){
                        System.out.println(productos[j].toString());
                    }
                }
            }
         System.out.println("Accion hecha, que desea hacer ahora? 0-fin. 1- ingresar producto. 2- mostrar el contenido del mismo.");
         opcion= in.nextInt();
    }
    System.out.println("-- FIN DE LA APLICACION--");
    in.close();
}
public static Producto agregarProducto(Scanner in){
    System.out.println("nombre del producto: ");
    String nombre = in.next();
    in.nextLine();
    System.out.println("descripcion del producto: ");
    String descripcion= in.next();
    in.nextLine();
    System.out.println("marca del producto: ");
    String marca= in.next();
    System.out.println("cantidad de unidades en Stock: ");
    int unidades= in.nextInt();
    return new Producto(nombre,descripcion,marca,unidades);
}
}