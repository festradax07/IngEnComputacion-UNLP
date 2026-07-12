import java.util.Scanner;
public class ej4{
    public static void main(String[]args){
        Scanner in= new Scanner(System.in);
        Flota flechabus= new Flota();String patente,destino,horaSalida;
        System.out.println("Patente:");
        patente = in.next();
        System.out.println("destino:");
        destino= in.next();
        in.nextLine();
        System.out.println("hora de salida:");
        horaSalida=in.next();
        in.nextLine();
        Micro micro;
        while(!(patente.toUpperCase().equals("ZZZ000")) && (!flechabus.FlotaLlena())){
            micro = new Micro (patente.toUpperCase(),destino.toUpperCase(),horaSalida.toUpperCase());
            flechabus.agregarMicro(micro);
            System.out.println("MICRO AGREGADO");
             System.out.println("Patente (ponga ZZZ000 para terminar):");
            patente = in.next();
            in.nextLine();
            if(!patente.toUpperCase().equals("ZZZ000")&& (!flechabus.FlotaLlena())){
                System.out.println("destino:");
                destino= in.next();
                System.out.println("hora de salida:");
                horaSalida=in.next();
            }
      }
      System.out.println("diml" + flechabus.getDiml() + "dimf " + flechabus.getLongitud());
      flechabus.Mostrar();
      System.out.println("patente a buscar:");
      patente= in.next();
      micro = flechabus.buscarMicroPatente(patente.toUpperCase());
      System.out.println("sali y está todo bien");
      if ( micro == null){
          System.out.println("no se encontró el micro con la patente solicitada");
      } else{
          System.out.println("Entre al else");
          flechabus.eliminarMicro(patente.toUpperCase());
          System.out.println("Se eliminó exitosamente el micro");
      }
      System.out.println("destino a buscar:");
      destino= in.next();
      micro = flechabus.buscarMicroDestino(destino.toUpperCase());
      if ( micro == null){
          System.out.println("no se encontró el micro con el destino solicitado");
      } else{
          System.out.println("PATENTE DEL MICRO CON EL DESTINO A : " + destino + " , " + micro.getPatente());
      }
        in.close();
    }
}
