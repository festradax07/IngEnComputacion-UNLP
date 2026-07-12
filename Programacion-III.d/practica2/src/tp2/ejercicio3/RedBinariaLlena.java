package tp2.ejercicio3;
import tp2.ejercicio1.*;
public class RedBinariaLlena {
	// UTILIZO UN RECORRIDO EN PROFUNDIDAD, YA QUE ME CONVIENE IR DESDE LAS HOJAS HASTA LA RAIZ,
	// LOS NIVELES NO SON IMPORTANTES, Y SERIA DIFICIL DIFERENCIAR QUE NODO ES HIJO DE QUIEN POR EL CAMINO ITERATIVO
	private BinaryTree<Integer> red;
	
	public RedBinariaLlena(BinaryTree<Integer> red) {
		super();
		this.red = red;
	}
	
	public RedBinariaLlena() {
		super();
	}

	private int contadorRetardo(BinaryTree <Integer> tree) {
		int max1=0,max2=0;
		if(tree != null && !tree.isEmpty()) { // utilizar metodo helper un metodo llama a otro privado donde no pueda el usuario acceder internamente.
			if(tree.hasLeftChild())
				max1 += contadorRetardo(tree.getLeftChild());
			if(tree.hasRightChild())
				max2 += contadorRetardo(tree.getRightChild());
			max2+= tree.getData();
			max1+=tree.getData();
			if( max1>= max2) {
				return max1;
			}else {
				return max2;
			}
		}else {
			return 0;
		}
	}
	public int retardoReenvio() {
		if( this.red == null || this.red.isEmpty()) {
			return -1;
		} else {
			return contadorRetardo(this.red); 
		}
	}
}
