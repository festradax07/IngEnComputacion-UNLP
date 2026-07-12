package tp1.ejercicio11;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import tp1.ejercicio8.*;
public class ParadasColectivo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//UTILIZO UNA CIRCULARQUEUE ya que el elemento de adelante de la cola será la parada actual, y una vez pasada, esta será almacenada a lo ultimo para volver a repetirse.
		CircularQueue <String> micro1 = new CircularQueue <String> (new ArrayList <String> (List.of("Glew", "Longchamps", "Burzaco", "Lomas"))); // list of devuelve una lista inmutable con estos elementos pero al hacer el objt arraylist se vuelve mutable, luego paso ese objeto a mi queue
		System.out.println("paradas del micro 1!");
		Scanner in = new Scanner (System.in);
		System.out.println(micro1);
		System.out.println("sigo? 1- si 0-no");
		int sigo = in.nextInt();
		while(sigo != 0) {
			micro1.shift();
			System.out.println(micro1);
			System.out.println("sigo? 1-si 0- no");
			sigo= in.nextInt();
		}
		System.out.println("fin del recorrido");
		in.close();
	}
}
