package Heap;

public interface IPriorityQueue <T>{
	public boolean isEmpty();
	public T delete();
	public boolean add( T elem);
	public T top();
}
