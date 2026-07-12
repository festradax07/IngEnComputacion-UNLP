public class Electricidad extends Solicitud{
    private int NIS;
    private int cantElectro;
    public Electricidad(){
        
    }
    public Electricidad(String gestion,String fecha, double ingresos, int cantI, String region, Persona persona, int NIS, int cantElectro){
        super(gestion,fecha,ingresos,cantI,region, persona);
        this.NIS=NIS;
        this.cantElectro=cantElectro;
    }
    public int getNis(){
        return NIS;
    }
    public int getCantElectro(){
        return cantElectro;
    }
    public void setNis(int nis){
        NIS=nis;
    }
    public void setCantElectro(int cantElectro){
        this.cantElectro=cantElectro;
    }
    public double calcularGasto(){
        double dato= super.getIngresosMensuales();
        double dev=0;
        if( dato > 300000){
            dev= 500*cantElectro;
        } else if((dato <= 300000) && (dato >= 150000)){
            dev=100*(cantElectro/2) + (dato*2/100);
        } else if (dato < 150000){
            dev= (dato*1.5/100) + 400*super.getCantIntegrantes(); 
        } else{
            dev=0;
        }
        return dev;
    }
    public boolean accedeAlSubsidio(){
        double ingresos= super.getIngresosMensuales();
        int integrantes= super.getCantIntegrantes();
        if (( ingresos/integrantes) <= (ingresos*45/100) && ( TarifasNacionalesPorRegion.puedeAccederAlSubsidio(ingresos,super.getRegion()))){
            return true;
        } else{ 
            return false;
            
        }
    }
    public String mostrar(){
        return super.mostrar() + "NIS : " + NIS + " CANTIDAD DE ELECTRODOMESTICOS: " + cantElectro + "\n TOTAL DE TARIFA: " + super.getTarifa();
    }
}