import java.util.Scanner;
public class ej3{
    public static void main (String[]args){
      Micro micro= new Micro("ABC123", "MAR DEL PLATA", "5:00AM");
      Scanner in = new Scanner(System.in);
      System.out.println("digame el asiento que quiere (-1 para terminar): ");
      int asiento= in.nextInt();
      while( asiento != -1){ 
          if( !(micro.validarAsiento(asiento))){
              System.out.println ("Numero de asiento no disponible. intente otro");
        
          } 
          else{
              if( micro.estadoAsiento(asiento)){
                  micro.ocuparAsiento(asiento);
                  System.out.println("ASIENTO EXITOSAMENTE RESERVADO. MUCHAS GRACIAS!");
              }
              else{
                  System.out.println("El asiento ya fué ocupado. Pruebe con otro");
                  System.out.println( "El primer asiento disponible es:" + micro.asientoLibre());
              }
          }
          System.out.println("digame el asiento que quiere (-1 para terminar): ");
          asiento= in.nextInt();
      }
      System.out.println("la cantidad de  asientos ocupados: " + micro.getOcupados());
      in.close();
    }
}