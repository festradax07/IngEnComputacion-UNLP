package tp1.ejercicio8;

public class TestingQueues {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue <Integer> q= new Queue<Integer>();
		q.enqueue(5);
		q.enqueue(6);
		q.enqueue(10);
		System.out.println("completo  " +q);
		q.dequeue();
		System.out.println("dequeue " + q);
		System.out.println("cabeza" + q.head());
		CircularQueue <Integer> c= new CircularQueue<Integer>();
		c.enqueue(1);
		c.enqueue(2);
		c.enqueue(3);
		c.enqueue(4);
		System.out.println("normal" + c.toString());
		c.shift();
		System.out.println("shift " + c.toString());
		c.shift();
		System.out.println("shift " + c.toString());
	}

}
