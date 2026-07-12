package Octo.Controlador;

public class ControladorAIO {
    /* controlador all in one
     será la interfaz de programador desde la cual main se comunicará y creará los objetos necesarios, y llamará
    a los objetos pertinentes*/

    public int crearCantidad (){ //falta ver realmente donde va a ir esto
        int cant;
        cant = random.nextInt(10000) + 1;
        return cant;
    }
}
