public class Automotor extends Vehiculo{
    private String patente;
    private double importeAd;
    private String descripcion;
    public Automotor(){
        
    }
    public Automotor(int año, double importe, Propietario propietario, String patente, String descripcion){
        super(año,importe,propietario);
        this.patente=patente;
        importeAd= super.getAño();  // como no especifica la relacion entre año de fabricacion e importe adicional, supongo que son equivalentes.
        this.descripcion=descripcion;
    }
    public String getPatente(){
        return patente;
    }
    public String getDescripcion(){
        return descripcion;
    }
    public void setPatente(){
        this.patente=patente;
    }
    public void setDescripcion(){
        this.descripcion=descripcion;
    }
    public double calcularCostoImpuestos(){
        return super.getImporte() + importeAd;
    }
}