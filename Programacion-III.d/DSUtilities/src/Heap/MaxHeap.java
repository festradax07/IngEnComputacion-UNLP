package Heap;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class MaxHeap <T extends Comparable<T>> implements IPriorityQueue<T> {
	private T [] data = (T []) new Comparable[100];
	private int diml = 0;
	
	public MaxHeap() {
	}
	
	public MaxHeap(List<T> listaElem) {
		Iterator<T> it = listaElem.iterator();
		while(it.hasNext()) {
			this.add(it.next());
		}
	}
	
	public MaxHeap(T[] vectorElem) {
		for(T t : vectorElem) {
			this.diml++;
			this.data[diml] = t;
		}
		for(int i = this.diml/2; i>0;i--) {
			this.percolate_down(i);
		}
	}
	
	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return (this.diml == 0);
	}
	@Override
	public T delete() {
		// TODO Auto-gen erated method stub
		if (this.diml > 0) {
			 T elem = this.data[1];// en este contexto deleteMAX
			 this.data[1] = this.data[this.diml];
			 this.diml--;
			 this.percolate_down(1);
			 return elem;
		}
		return null;
	}
	
	@Override
	public boolean add( T elem) {
		// TODO Auto-generated method stub
		this.diml++;
		this.data[diml]= elem;
		this.percolate_up(diml);
		return true;
	}
	@Override
	public T top() {
		// TODO Auto-generated method stub
		return this.data[1];
	}
	private void percolate_up(int i) {
		T temp= this.data[i];
		while(i/2>0 && this.data[i/2].compareTo(temp)<0) {
			data[i] = data[i/2];
			i=i/2;
		}
		data[i]= temp;
	}
	
	private void percolate_down(int i) {
		 T candidato = data[i];
		 boolean detener_percolate = false;
		 while (2 * i <= diml && !detener_percolate) {
			 //buscar el hijo maximo de candidato (hijo_máximo es el índice)
			 int hijo_maximo = 2 * i; 
			 if (hijo_maximo != this.diml){//hay+ eltos,tiene hijo derecho
				 if (data[hijo_maximo + 1].compareTo(data[hijo_maximo]) > 0) {
					 hijo_maximo++;
				 }
			 }
			 if (candidato.compareTo(data[hijo_maximo]) < 0) { //padre<hijo
				 data[i] = data[hijo_maximo];
				 i = hijo_maximo;
			 } else {
				 detener_percolate = true;
			 }
		 }
		  this.data[i] = candidato;
		 }
	
}
