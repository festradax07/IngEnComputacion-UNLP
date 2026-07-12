import java.util.Random;

public class Generador{

	private static int nro_actual_volumen = (new Random()).nextInt(50);

	//Retorna el nro de volumen a registrar 
	//Método de clase (no se necesita una instancia de Generador)
	public static int getNroVolumen(){
		nro_actual_volumen++;
		return nro_actual_volumen;
	} 
}