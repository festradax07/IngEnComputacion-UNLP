package tp1.ejercicio8;

import java.util.List;

public class CircularQueue  <E> extends Queue {
	public CircularQueue() {
		super();
	}
	public CircularQueue(List <E> dato) {
		super(dato);
	}
	public void shift() {
	  super.enqueue(super.dequeue()); // consultar implementacion de la cola circular
	}

}
