public class Simples extends Compra{
    private Persona persona;
    public Simples(int num, int categoria, String nombreEstadio, Fecha fecha,double importe){
        super(num,categoria,nombreEstadio,fecha,importe);
        this.persona=persona;
    }
    public Persona getPersona(){
        return persona;
    }
    public void setPersona(Persona persona){
        this.persona=persona;
    }
    public double darPromo(){
        double desc=0;
        if( super.getNombreEstadio().toUpperCase().equals("LUSAIL") && (super.getCategoria()== 4)){
            desc= super.getImporte()*10/100;
        } else{
            desc=0;
        }
        return desc;
    }
    public String toString(){
        return super.toString() + persona.toString();
    }
}