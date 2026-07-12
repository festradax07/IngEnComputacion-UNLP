package Trees;

import java.util.Arrays;

import tp2.ejercicio1.BinaryTree;

/*
 *  Las operaciones esDragon()\: boolean y esPrincesa(): boolean permiten averiguar si un persona es un 
dragón o una princesa respectivamente
Suponemos que ningún personaje es un dragón y princesa a la vez y que un persona puede no ser 
ninguna de las dos cosas. Dado un árbol binario de personajes, se denominan nodos accesibles a 
aquellos nodos tales que a lo largo de la raíz hasta la hoja NO se encuentra ningún dragón
Debe implementar un método princesaAccesible(): Personaje en la clase árbol binario que encunetre 
una princesa accesible
 */
public class PrincesasYDragones {
	BinaryTree<String> princesas;
	
	public PrincesasYDragones(BinaryTree<String> princesas) {
		super();
		this.princesas = princesas;
	}
	public String princesaAccesible() {
		if(!princesas.isEmpty()) {
			return princesaHelper(princesas);
		}else {
			return null;
		}
	}
	private String princesaHelper(BinaryTree<String> princesas) {
		String princesa = "" ;
		if(!princesas.isEmpty()) {
			if(esDragon(princesas.getData())) {
				return "hay dragon!!";
			}
			if(esPrincesa(princesas.getData())) {
				return princesas.getData();
			}
			if(princesas.hasLeftChild()) {
				princesa = princesaHelper(princesas.getLeftChild());
			}
			if(princesas.hasRightChild() && princesa.isEmpty()) { // si recorri HI y no tuve ningun dragon...
				princesa = princesaHelper(princesas.getRightChild());
			}
		}
		return princesa;
	}
	
	public boolean esDragon(String nombre) { // deberian formar parte de la clase binarytree creo...
		return Arrays.asList("mushu", "shenglong", "chimuelo").contains(nombre);
		
	}
	public boolean esPrincesa(String nombre) { // deberian formar parte de la clase binarytree creo...
		return Arrays.asList("mulan", "rapunzel", "vicente viloni").contains(nombre);

	}
}
