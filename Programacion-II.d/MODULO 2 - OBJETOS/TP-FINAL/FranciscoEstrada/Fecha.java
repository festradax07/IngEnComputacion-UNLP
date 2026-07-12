public class Fecha{
    private int dia;
    private int mes;
    private int anio;
    public Fecha(){
        
    }
    public Fecha(int dia, int mes, int anio){
        this.dia=dia;
        this.mes=mes;
        this.anio=anio;
    }
    public int getDia(){
        return dia;
    }
    public int getMes(){
        return mes;
    }
    public int getAnio(){
        return anio;
    }
    public void setDia( int dia){
        this.dia=dia;
    }
    public void setMes(int mes){
        this.mes=mes;
    }
    public void setAnio(int anio){
        this.anio=anio;
    }
    public boolean compararFechas(Fecha fecha){
        boolean result=false;
        if( anio > fecha.getAnio()){
            result=true;
        }else if(( mes > fecha.getMes()) && (anio == getAnio())){
            result= true;
        } else if((dia > fecha.getDia()) && ( (mes == fecha.getMes()) && (anio == getAnio()))){
            result=true;}
        return result;
    }
    public String toString(){
        return "dia: " + dia + "mes: " + mes + " año: " + anio;
    }
}