package Trees;

import java.util.ArrayList;
import java.util.List;

import tp2.ejercicio1.BinaryTree;

public class ParcialMismoNumNodos {
	public List<Integer> resolver(BinaryTree<Integer>tree){
		List<Integer> lista= new ArrayList<>();
		if(tree != null && !tree.isEmpty()) {
			if(tree.hasLeftChild() && tree.hasRightChild()) {
				int subArbolizq = contarNodos(tree.getLeftChild());
				int subArbolder = contarNodos(tree.getRightChild());
				if(subArbolizq == subArbolder) lista.add(tree.getData());
			}
			if(tree.hasLeftChild()) {
				lista.addAll(resolver(tree.getLeftChild()));
			}
			if(tree.hasRightChild()) {
				lista.addAll(resolver(tree.getRightChild()));
			}
			
		}
		return lista;
	}
	private int contarNodos(BinaryTree<Integer> tree) {
		int total = 0;
		if(tree!= null && !tree.isEmpty()) {
			total++;
			if(tree.hasLeftChild()) {
				total += contarNodos(tree.getLeftChild());
			}
			if(tree.hasRightChild()) {
				total += contarNodos(tree.getRightChild());
			}
		}
		return total;
	}

}
// hacer zigzag , sumar post orden y calcular el camino mas largo
