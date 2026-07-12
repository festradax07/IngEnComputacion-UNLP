package tp2.ejercicio3;

import tp2.ejercicio1.BinaryTree;

public class TestRedBinaria {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinaryTree <Integer> a = new BinaryTree<Integer>(10);
		a.addLeftChild(new BinaryTree<Integer>(2));
		a.getLeftChild().addLeftChild(new BinaryTree<Integer>(5));
		a.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(7));
		a.getLeftChild().getLeftChild().addRightChild(new BinaryTree<Integer>(8));
		a.getLeftChild().addRightChild(new BinaryTree<Integer>(4));
		a.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		a.getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(6));
		a.addRightChild(new BinaryTree<Integer>(3));
		a.getRightChild().addRightChild(new BinaryTree<Integer>(8));
		a.getRightChild().addLeftChild(new BinaryTree<Integer>(9));
		a.getRightChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(12));
		a.getLeftChild().getLeftChild().addRightChild(new BinaryTree<Integer>(8));
		a.getRightChild().getRightChild().addLeftChild(new BinaryTree<Integer>(2));
		a.getRightChild().getRightChild().addRightChild(new BinaryTree<Integer>(1));
		 RedBinariaLlena rb = new RedBinariaLlena(a);
		 System.out.println(rb.retardoReenvio()); // actualizado. Implementado de la manera correcta respetando los parametros solicitados
	}

}
