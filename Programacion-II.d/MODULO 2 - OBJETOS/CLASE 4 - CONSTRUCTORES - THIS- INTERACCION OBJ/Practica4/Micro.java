public class Micro{
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] cantAsientos;
    private int cantOcupados;
    public Micro(String patente,String destino, String horaSalida){
       this.patente=patente;
       this.destino=destino;
       this.horaSalida=horaSalida;
       cantAsientos= new boolean[20];
       for (int i=0; i < cantAsientos.length; i++){
           cantAsientos[i] = true;
       }
       cantOcupados=0;
    }
    public Micro(){
        
    }
    public void setPatente(String patente){
        this.patente= patente;
    }
    public void setDestino(String destino){
        this.destino=destino;
        
    }
    public void setHoraSalida(String horaSalida){
        this.horaSalida=horaSalida;
    }
    public void setCantAsientos(int i){
        cantAsientos[i]= false;
    }
    public String getPatente(){
        return patente;
    }
    public String getDestino(){
        return destino;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    public int getOcupados(){ //I
        return cantOcupados; 
    }
    public boolean estaOcupado(){ //ii
        boolean res= true;
        if( cantOcupados != cantAsientos.length){
            res=false;
        }
        return res;
    }
    public boolean estadoAsiento(int i){ //iv
        if (!(cantAsientos[i])){
            return false;
        } else {
            return true;
        }
    }
    public boolean validarAsiento(int i){ //iii
        if (( i >= 0) && ( i < cantAsientos.length)){
            return true;
        } else{ return false;}
    }
    public void ocuparAsiento( int i){
        cantAsientos[i] = false;
        cantOcupados++; 
    }
    public void liberarAsiento(int i){
        cantAsientos[i] = true;
        cantOcupados--;
    }
    public int asientoLibre(){
        int i=0, pos=0;
        boolean sigo= true;
        while((i< cantAsientos.length) && (sigo)) {
            if (cantAsientos[i]){
                sigo=false;
                pos= i;
            } else{ pos=-1;}
            i++;
        }
        return pos;
    }
}