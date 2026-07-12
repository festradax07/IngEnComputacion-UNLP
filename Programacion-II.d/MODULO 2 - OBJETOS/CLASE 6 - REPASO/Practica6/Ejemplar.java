public abstract class Ejemplar{
    private int id;
    private int cantPag;
    private String resumen;
    private int añoPublicacion;
    private Responsable responsable;
    public Ejemplar(){
        
    }
    public Ejemplar( int id, int cantPag, String resumen, Responsable responsable){
        this.id=id;
        this.cantPag=cantPag;
        this.resumen=resumen;
        añoPublicacion=0;
        this.responsable=responsable;
    }
    public int getId(){
        return id;
    }
    public int getCantPag(){
        return cantPag;
    }
    public String getResumen(){
        return resumen;
    }
    public int getAñoPublicación(){
        return añoPublicacion;
    }
    public Responsable getResponsable(){
        return responsable;
    }
    public void setId(int id){
        this.id=id;
    }
    public void setCantPag(int cantPag){
        this.cantPag=cantPag;
    }
    public void setResumen(String resumen){
        this.resumen=resumen;
    }
    public void setAñoṔublicación(int añoPublicacion){
        this.añoPublicacion=añoPublicacion;
    }
    public String toString(){
        return "id : " + id + "\n cantidad de paginas " + cantPag + " \n resumen : " + resumen + "\n año de publicacion " + añoPublicacion; 
    }
    abstract String mostrar();
    public void publicar(){
        añoPublicacion= 2023;
    }
}