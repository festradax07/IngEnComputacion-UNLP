public class Libro extends Ejemplar{
    private String titulo;
    private int cantCapitulos;
    private boolean deBolsillo;
    public Libro(){
        
    }
    public Libro( int id, int cantPag, String resumen, Responsable responsable, String titulo, int cantCapitulos, boolean deBolsillo){
        super(id,cantPag,resumen,responsable);
        this.titulo=titulo;
        this.cantCapitulos=cantCapitulos;
        this.deBolsillo= deBolsillo;
    }
    public String getTitulo(){
        return titulo;
    }
    public int getCantCapitulos(){
        return cantCapitulos;
    }
    public boolean getDeBolsillo(){
        return deBolsillo;
    }
    public void setTitulo( String titulo){
        this.titulo=titulo;
    }
    public void setCantCapitulos(int cantCapitulos){
        this.cantCapitulos=cantCapitulos;
    }
    public void setDeBolsillo(boolean deBolsillo){
        this.deBolsillo=deBolsillo;
    }
    public String toString(){
        return super.toString() + "\n titulo : " + titulo + " \n cantidad de capitulos: " + "\n es de bolsillo?: " + deBolsillo;
    }
    public String mostrar(){
        return " id:  " + super.getId() + "titulo: " + titulo + "nombre de responsable: " + super.getResponsable().toString(); 
    }
    public void publicar(){
         super.publicar();
         if ( this.deBolsillo ){
             this.titulo+= " - DE Bolsillo.";
         }
    }
}
