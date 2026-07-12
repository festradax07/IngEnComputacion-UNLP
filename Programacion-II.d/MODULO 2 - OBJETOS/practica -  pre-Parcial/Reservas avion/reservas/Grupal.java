public class Grupal extends Reserva{
    private Pasajero[] pasajeros;
    private int diml;
    public Grupal(int num, String aero, String aeroD, String fecha){
        super(num,aero,aeroD,fecha);
        pasajeros = new Pasajero[10];
        for ( int i=0; i < pasajeros.length; i++){
            pasajeros[i] = null;
        }
        diml=0;
    }
    public void agregarPasajero(Pasajero pasajero){
        pasajeros[diml]=pasajero;
        diml++;
    }
    public double totalizar(){
        return super.getImporte()*diml;
    }
    public void calcularPromocion(){
        double dato= totalizar();
        if( diml<=6){
            dato -= (dato*5/100);
        } else if (diml >=10){
            int cont=0;
            for (int i=0; i< diml; i++){
                cont++;
                if( cont==10){
                    dato -= super.getImporte();
                    cont=0;
                }
            }
        }
        super.setImporte(dato);
    }
    public String toString(){
        String aux= "";
        for (int i=0; i<diml;i++){ 
            aux += "\n pasajero numero "+ (i+1) +" : " + pasajeros[i].toString(); 
        }
        aux+= super.toString();
        return aux;
    }
}
