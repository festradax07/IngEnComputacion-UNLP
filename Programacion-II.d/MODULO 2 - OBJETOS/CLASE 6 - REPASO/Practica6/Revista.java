public class Revista extends Ejemplar{
    private String nombre;
    private int volumen;
    private int cantArticulos;
    public Revista(){
        
    }
    public Revista( int id, int cantPag, String resumen,Responsable responsable, String nombre, int cantArticulos){
        super(id,cantPag,resumen,responsable);
        this.nombre= nombre;
        this.cantArticulos=cantArticulos;
    }
    public int getVolumen(){
        return volumen;
    }
    public int getCantArticulos(){
        return cantArticulos;
    }
    public String getNombre(){
        return nombre;
    }
    public void setVolumen ( int volumen){
        this.volumen=volumen;
    }
    public void setNombre ( String nombre){
        this.nombre=nombre;
    }
    public void setCantArticulos ( int cantArticulos){
        this.cantArticulos=cantArticulos;
    }
    public String mostrar(){
        return "nombre : " + nombre + "volumen" + volumen;
    }
    public void publicar(){
         super.publicar();
         volumen= Generador.getNroVolumen();
    } 
    }
