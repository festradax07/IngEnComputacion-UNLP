public abstract class Solicitud{
    private String gestion;
    private String fecha;
    private double ingresosMensuales;
    private int cantIntegrantes;
    private String region;
    private Persona persona;
    private double tarifa;
    public Solicitud(){
        
    }
    public Solicitud(String gestion,String fecha, double ingresos, int cantI, String region, Persona persona){
        this.gestion=gestion;
        this.fecha=fecha;
        this.ingresosMensuales=ingresos;
        this.cantIntegrantes=cantI;
        this.region=region;
        this.persona= persona;
        tarifa=0;
    }
    public String getGestion(){
        return gestion;
    }
    public double getTarifa(){
        return tarifa;
    }
    public void setTarifa(double tarifa){
        this.tarifa=tarifa;
    }
    public String getFecha(){
        return fecha;
    }
    public String getRegion(){
        return region;
    }
    public double getIngresosMensuales(){
        return ingresosMensuales;
    }
    public int getCantIntegrantes(){
        return cantIntegrantes;
    }
    public Persona getPersona(){
        return persona;
    }
    public void setGestion(String gestion){
        this.gestion=gestion;
    }
    public void setFecha(String fecha){
        this.fecha=fecha;
    }
    public void setRegion(String region){
        this.region=region;
    }
    public void setIngresosMensuales(double ingresos){
        ingresosMensuales=ingresos;
    }
    public void setCantIntegrantes(int cant){
        cantIntegrantes=cant;
    }
    public void setPersona(Persona persona){
        this.persona=persona;
    }
    public abstract double calcularGasto();
    public abstract boolean accedeAlSubsidio();
    public String mostrar(){
        String aux="";
        if(this.accedeAlSubsidio()){
            aux= "ACCEDE AL SUBSIDIO";
        } else{
            aux= "NO ACCEDE AL SUBSIDIO";
        }
        aux+= "\n numero de Gestion:  " + gestion + "fecha: "+  fecha + " region " + region + " ingresos mensuales " + ingresosMensuales + "  cantidad de integrantes " + cantIntegrantes + " DATOS DE LA PERSONA : " + persona.toString();
        return aux;
    }
}