import java.util.Scanner;
public class ej2{
    public static void main (String[]args){
        Persona [] Personas = new Persona[3];
        Scanner in = new Scanner(System.in);
        int dni,edad; String nombre;
        for ( int i=0; i<=2; i++){
        System.out.println("nombre:");
        nombre= in.next();
        System.out.println("dni");
        dni= in.nextInt();
        System.out.println("edad");
        edad= in.nextInt();
        Persona pepe = new Persona(nombre,dni,edad);
        Personas[i]= pepe;
    }
    for ( int i=0; i<=2; i++){
        System.out.println(Personas[i].toString());
    }
    System.out.println("Cantidad de personas meyores de 65 años" + Mayores65(Personas));
    System.out.println("datos de la persona con menor dni" + (menorDni(Personas)).toString());
}
public static int Mayores65(Persona [] Personas){
   int contador=0;
    for ( int i=0; i<=2; i++){
        if( Personas[i].getEdad() > 65){
            contador++;
        }
    } 
    return contador;
}
public static Persona menorDni(Persona [] Personas){
   int menor= 9999; Persona menorP= new Persona();
    for ( int i=0; i<=2; i++){
        if( Personas[i].getDNI() < menor){
            menor = Personas[i].getDNI();
            menorP= Personas[i];
    } 
    }
    return menorP;
}
}