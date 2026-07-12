package tp1.ejercicio10;
import tp1.ejercicio8.DoubleEndedQueue;
import PrograII.Persona;
import javax.swing.JOptionPane;
public class ColaDeBanco {
	public static void main (String[]args) {
		DoubleEndedQueue <Persona> colaBanco = new DoubleEndedQueue <Persona>(); // utilizo una cola de doble fin para poder insertar adelante personas que tienen más prioridad que otras!
		String nombre; int edad, dni;
		JOptionPane.showMessageDialog(null, "Bienvenido al banco XXXX!"); // probando JoptionPane de la libreria swing para un menu visual, puede cambiarse por Scanner
		dni = Integer.parseInt(JOptionPane.showInputDialog("escriba su DNI!"));
		while(dni != -1) {
			nombre = JOptionPane.showInputDialog("escriba su nombre aqui!");
			edad = Integer.parseInt(JOptionPane.showInputDialog("escriba su edad!"));
			administrarCola(colaBanco,new Persona(nombre, dni, edad));
			JOptionPane.showMessageDialog(null, "Persona registrada y añadida a la cola del Banco XXX!");
			dni = Integer.parseInt(JOptionPane.showInputDialog("escriba su DNI!"));
		}
		if (!colaBanco.isEmpty()) {
			mostrarCola(colaBanco);
			colaBanco.dequeue();// prueba de desapilar
			colaBanco.dequeue();
			mostrarCola(colaBanco);
		}
		JOptionPane.showMessageDialog(null,"todos atendidos! que tengan buen dia! :)");
	}
	public static void mostrarCola(DoubleEndedQueue <Persona> queue) {
		JOptionPane.showMessageDialog(null, queue);
	}
	public static void administrarCola(DoubleEndedQueue <Persona> queue, Persona dato) {
		int opcion = Integer.parseInt(JOptionPane.showInputDialog("está embarazada, es mayor de 70 años y/o tiene necesidades especiales o movilidad reducida? 1- SI 2- NO"));
		switch (opcion) {
	    case 1: queue.enqueueFirst(dato);
	        break;
	    case 2: queue.enqueue(dato);
	        break;
	    default: queue.enqueue(dato);
		}
	}
}
