public class Clasica extends Reserva{
    private Pasajero pasajero;
    public Clasica(int num, String aero, String aeroD, String fecha ,Pasajero pasajero){
        super(num, aero,aeroD,fecha);
        this.pasajero=pasajero;
    }
    public void setPasajero(Pasajero pasajero){
        this.pasajero=pasajero;
    }
    public Pasajero getPasajero(){
        return pasajero;
    }
    public void calcularPromocion(){
         double tot= super.getImporte();
         tot-= super.getImporte()*10/100;
         super.setImporte(tot);
    }
    public String toString(){
        return pasajero.toString() + super.toString();
    }
}