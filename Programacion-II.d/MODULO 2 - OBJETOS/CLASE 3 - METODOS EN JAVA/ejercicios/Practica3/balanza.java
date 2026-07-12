public class balanza{
    double monto;
    int cantItems;
    public void setMonto(double monto){
        this.monto=monto;
    }
    public void setCantItems(int cantItems){
        this.cantItems= cantItems;
    }
    public double getMonto(){
        return monto;
    }
    public int getCantItems(){
        return cantItems;
    }
    public void iniciarCompra(){
        this.setMonto(0);
        this.setCantItems(0);
    }
    public void registrarProducto(double peso, double precioKg){
        int cant= this.getCantItems();
        cant++;
        this.setCantItems(cant);
        this.setMonto(peso*precioKg);
    }
    public String devolverResumen(){
        return ("total a pagar" + this.getMonto() + "por la compra de " + this.getCantItems() + " productos") ;
    }
}