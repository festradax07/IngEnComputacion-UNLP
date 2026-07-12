package tp1.ejercicio8;

public class DoubleEndedQueue <E> extends Queue {

	public DoubleEndedQueue() {
		// TODO Auto-generated constructor stub
		super();
	}
	public void enqueueFirst(E dato) {	
		super.getQueue().addFirst(dato); // solucionado el encapsulamiento de la clase deq utilizando modificador protected
		
	}
}
