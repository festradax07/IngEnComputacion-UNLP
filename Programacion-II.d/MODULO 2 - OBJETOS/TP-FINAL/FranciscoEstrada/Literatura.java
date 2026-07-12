public class Literatura extends Libro{
    private String genero; //cuento,poemario,novela)
    private boolean esDebolsillo;
    public Literatura(){
        
    }
    public Literatura(String ISBN, String titulo, int cantPaginas, double precio, String fechaPublicacion, Autor autor ,String genero,boolean debolsillo){
      super(ISBN,titulo,cantPaginas,precio,fechaPublicacion,autor );
      this.genero=genero;
      esDebolsillo=debolsillo;
    }
    public String getGenero(){
        return genero;
    }
    public void setGenero(){
        this.genero=genero;
    }
    public boolean getEsDebolsillo(){
        return esDebolsillo;
    }
    public void setEsDebolsillo(boolean debolsillo){
        this.esDebolsillo=debolsillo;
    }
    public double calculoDescuento(){
        double desc=0;
        if(esDebolsillo){
            desc+= super.getPrecio()*15/100;
        }
        if((genero.toUpperCase().equals("CUENTO")) || (genero.toUpperCase().equals("NOVELA"))){
            desc+=super.getPrecio()*5/100;
        }
        return desc;
    }
    public String toString(){
        String aux = super.toString() +" \n genero: " + genero + " \n esDebolsillo?: ";
        if(esDebolsillo){
            aux+= "SI";
        } else{
            aux+="NO";
        }
        return aux;
    }
}
