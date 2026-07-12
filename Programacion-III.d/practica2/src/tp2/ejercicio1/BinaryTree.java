package tp2.ejercicio1;
import tp1.ejercicio8.*;


public class BinaryTree <T> {

	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}
	// corresponden a ejercicio2
	public  int contarNodos() { // update 7/6 mala mia, no es un contarhojas sino contar nodos 
		int total = 0;
		if(this != null && !this.isEmpty()) {
			total++;
			if(this.hasLeftChild())
				total+= this.getLeftChild().contarNodos();
			if(this.hasRightChild())
				total+= this.getRightChild().contarNodos();
		}
		return total;
	}
	public int contarHojas() { // contarHojas completado
		int total=0;
		if(this !=null && !this.isEmpty()) {
			// caso base
			if(this.isLeaf()) {
				return 1;	
			}
			if(this.hasLeftChild()) {
				total+= this.getLeftChild().contarHojas();
			}
			if(this.hasRightChild()) {
				total+= this.getRightChild().contarHojas();
			}
		}
		return total;
	}
		
		
    	 // ej 2
    public BinaryTree<T> espejo(){ // update: reordenado y con un caso base más claro.
	   BinaryTree <T> aux = null;
    	if(this !=null && !this.isEmpty()) {
    		aux = new BinaryTree<T>(this.getData()); // cargo el dato para el arbol 2 ;
    		// caso base, las hojas es desde donde empieza a armar el arbol, para luego ensamblarla con la llamada del nivel anterior
    		
    		if(this.hasRightChild()) {
			   aux.addLeftChild(this.getRightChild().espejo());
    		}
    	    if(this.hasLeftChild()) {
			   aux.addRightChild(this.getLeftChild().espejo());
		   }
    	}
    	return aux;
    }
    
    public void printLevelTraversal() {
      	 BinaryTree<T> ab = null;
      	 Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
      	 cola.enqueue(this);
         cola.enqueue(null);
      	 while (!cola.isEmpty()) {
      		 ab = cola.dequeue();
      		 if (ab != null) {
      			 System.out.print(ab.getData()+"  ");
      			 if (ab.hasLeftChild()) {
      				 cola.enqueue(ab.getLeftChild());
      			 }
      			 if (ab.hasRightChild()) {
      				 cola.enqueue(ab.getRightChild());
      			 }
      		 } else if (!cola.isEmpty()) {
      			 System.out.println();
      			 cola.enqueue(null);
      		 }
      	 }
       }
	// 0<=n<=m
	public void entreNiveles(int n, int m){
		int nivel = 0;
		BinaryTree<T> ab = null; // ref nula
     	Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>(); // cola 
     	cola.enqueue(this);
        cola.enqueue(null); // todo cumple el nivel 0
     	 while (!cola.isEmpty() && nivel <= m) {
     		 ab = cola.dequeue();
     		 if (ab != null) {
     			 if(nivel >= n)
     			 System.out.print(ab.getData());
     			 if (ab.hasLeftChild())
     				 cola.enqueue(ab.getLeftChild());
     			 if (ab.hasRightChild())
     				 cola.enqueue(ab.getRightChild());
     		 } else if (!cola.isEmpty()) {
     			 System.out.println();
     			 cola.enqueue(null);
     			 nivel++; // aca es donde cambia de nivel
     		 }
     	}
   }
		
}

