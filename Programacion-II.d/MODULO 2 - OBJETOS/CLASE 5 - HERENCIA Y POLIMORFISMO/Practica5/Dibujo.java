public class Dibujo{
    private String autor;
    private String titulo;
    private Figura [] figuras;
    private int totFiguras;
    public Dibujo(String autor, String titulo, int cantFig){
        this.autor=autor;
        this.titulo=titulo;
        figuras = new Figura [cantFig];
        totFiguras = 0;
    }
    public Dibujo(){
        
    }
    public int getTotFiguras(){
        return totFiguras;
    }
    public boolean validarFiguras(){
        if ( totFiguras != figuras.length){
           return true; 
        } else{
            return false;
        }
    }
    public void agregarFig( Figura fig ){
        int i= this.getTotFiguras();
        figuras[i]= fig;
        totFiguras++;
    }
    public void Dibujado(){
        System.out.println("Titulo:" + titulo);
        System.out.println("Autor: " + autor);
        System.out.println("Dibujo: ");
        for (int i= 0; i< figuras.length; i++){
            figuras[i].dibujar();
        }
    }
    
}