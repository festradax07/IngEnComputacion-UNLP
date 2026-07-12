public class Flota{
    private Micro [] micros;
    private int diml;
    public Flota(){
     micros = new Micro[3];
     diml=0;
    }
    public boolean FlotaLlena(){ 
        if (diml != micros.length){
            return false;
        } else{
            return true;
        }
    }
    public void agregarMicro(Micro micro){
        micros[diml]= micro;
        diml++;
    }
    public int getLongitud(){
        return micros.length;
    }
    public void Mostrar(){
        for (int i= 0; i< micros.length; i++){
            System.out.println(" patente " + micros[i].getPatente() + " destino " + micros[i].getDestino() + " hora " + micros[i].getHoraSalida());
            
        }
    }
    public int getDiml(){
        return diml;
    }
    public void  eliminarMicro(String pat){
        int i=0; boolean encontre=false;
        while((( i < diml))&& !(encontre)){
            if( micros[i].getPatente().toUpperCase().equals(pat)){
                System.out.println("entré al if del elminar");
                encontre=true;
                for ( int j=i; j < diml-1; j++){
                    micros[j]= micros[j+1];
                }
                micros[diml-1]= null;
                
                diml--;
            }else{
            i++;
        }
        }
    }
    public Micro buscarMicroPatente( String pat){
       int i=0; boolean encontre=false; Micro micro= null;
        while((( i < diml))&& !(encontre)){
            System.out.println( "entre´");
            if( micros[i].getPatente().toUpperCase().equals(pat)){
                System.out.println("entre al if");
                encontre=true;
                micro= micros[i]; 
            }else{
                i++;
                }
            }
        return micro;
       }
    public Micro buscarMicroDestino (String destino){
       int i=0; boolean encontre=false; Micro micro= null;
        while((( i < diml))&& !(encontre)){
            if( micros[i].getDestino().toUpperCase().equals(destino)){
                encontre=true;
                micro= micros[i]; // dejo de apuntar al micro correpondiente.
            }
            i++;
        }
        return micro; 
    }
}