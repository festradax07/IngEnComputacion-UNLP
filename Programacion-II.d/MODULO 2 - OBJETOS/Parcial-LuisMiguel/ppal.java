public class ppal{
    public static void main (String[]args){
        // creo objeto show
        Show movistar= new Show(666,"3/08/2023",true); 
        // creo objs localidades especificas y obj comprador;
        Comprador fan = new Comprador(666,"gaston argeri");
        Localidad local= new Vip(777,3,7,"A","tarjeta de credito",fan);// caso donde el vip no es especial
        movistar.agregarLocalidad(local);
        local= new Vip(777,3,7,"A","tarjeta de credito",fan,true,4000);// caso con exp especial
        movistar.agregarLocalidad(local);
        local= new Comunes(777,3,7,"A","tarjeta de credito",fan,"fisica",1500);
        movistar.agregarLocalidad(local);
        local=new Comunes(777,9,9,"H","tarjeta de debito", fan, "digital");
        movistar.agregarLocalidad(local);
        local= new Vip(777,3,7,"A","tarjeta de debito",fan,true,4000);
        movistar.agregarLocalidad(local);
        local= new Vip(777,3,7,"A","tarjeta de credito",fan);// caso donde el vip no es especial
        movistar.agregarLocalidad(local);
        local= new Vip(777,3,7,"A","tarjeta de credito",fan,true,4000);// caso con exp especial
        movistar.agregarLocalidad(local);
        local= new Comunes(777,3,7,"A","tarjeta de credito",fan,"fisica",1500);
        movistar.agregarLocalidad(local);
        local=new Comunes(777,9,9,"H","tarjeta de debito", fan, "digital");
        movistar.agregarLocalidad(local);
        local= new Vip(777,3,7,"A","tarjeta de debito",fan,true,4000);
        movistar.agregarLocalidad(local);
        System.out.println("monto total del show: " + movistar.totalizar());
        System.out.println("DATOS DEL SHOW: \n" + movistar.toString());
    }
}