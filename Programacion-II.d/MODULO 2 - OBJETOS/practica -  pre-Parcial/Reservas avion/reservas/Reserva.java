public abstract class Reserva{
    private int numReserva;
    private String aeropuertoO;
    private String aeropuertoD;
    private String fechaVuelo;
    private double importe;
    public Reserva(){
        
    }
    public Reserva(int num, String aero, String aeroD, String fecha){
        numReserva=num;
        aeropuertoO=aero;
        aeropuertoD=aeroD;
        fechaVuelo=fecha;
        importe=10000;
    }
    public void setNumReserva( int num){
        numReserva=num;
    }
    public void setAeropuertoO(String aero){
        aeropuertoO=aero;
    }
    public void setAeropuertoD(String aero){
        aeropuertoD=aero;
    }
    public void setFecha(String fecha){
        fechaVuelo=fecha;
    }
    public void setImporte(double importe){
        this.importe=importe;
    }
    public int getNumReserva(){
        return numReserva;
    }
    public String getAeropuertoO(){
        return aeropuertoO;
    }
    public String getAeropuertoD(){
        return aeropuertoD;
    }
    public String getFecha(){
        return fechaVuelo;
    }
    public double getImporte(){
        return importe;
    }
    public abstract void calcularPromocion();
    public String toString(){
        return "numero de reserva: " + numReserva + " aeropuerto de Origen " + aeropuertoO + " aeropuerto de Destino" + aeropuertoD + "fecha" + fechaVuelo + "\n Importe a pagar: " + importe ;
    }
    
}