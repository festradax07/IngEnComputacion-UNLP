public class Gas extends Solicitud{
    private int numMedidor;
    private double tamañoH;
    private int cantEstufas;
    public Gas(){
        
    }
    public Gas(String gestion,String fecha, double ingresos, int cantI, String region, Persona persona,int numMedidor, double tamañoH, int cantEstufas){
        super(gestion,fecha,ingresos,cantI,region, persona);
        this.numMedidor=numMedidor;
        this.tamañoH=tamañoH;
        this.cantEstufas=cantEstufas;
    }
    public int getNumMedidor(){
        return numMedidor;
    }
    public double getTamañoH(){
        return tamañoH;
    }
    public int getCantEstufas(){
        return cantEstufas;
    }
    public void setNumMedidor(int numMedidor){
        this.numMedidor=numMedidor;
    }
    public void setTamañoH( double tamañoH){
        this.tamañoH=tamañoH;
    }
    public void setCantEstufas(int cantEstufas){
        this.cantEstufas=cantEstufas;
    }
    public double calcularGasto(){
        double dato= super.getIngresosMensuales();
        double dev=0;
        if( dato > 300000){
            dev= 250*(tamañoH/2) + 750*cantEstufas;
        } else if((dato <= 300000) && (dato >= 150000)){
            dev=100*(tamañoH/3) + 500*cantEstufas;
        } else if (dato < 150000){
            dev= (dato*2/100) + 1000; 
        } else{
            dev=0;
        }
        return dev;
    }
    public boolean accedeAlSubsidio(){
        double ingresos= super.getIngresosMensuales();
        int integrantes= super.getCantIntegrantes();
        if ((( ingresos/integrantes + cantEstufas) <=  (integrantes*40/100)) && ( TarifasNacionalesPorRegion.puedeAccederAlSubsidio(ingresos,super.getRegion()))){
            return true;
        } else{ 
            return false;
            
        }
    }
    public String mostrar(){
           return super.mostrar() + "numero de medidor: " +  numMedidor + " metros cuadrados de la vivienda: " + tamañoH + " cantidad de Estufas: " + cantEstufas + "\n Total a pagar: " + super.getTarifa();
        }
    }

