package tp2.ejercicio5;

import tp2.ejercicio1.BinaryTree;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinaryTree <Integer> a = new BinaryTree<Integer>(1);
		a.addLeftChild(new BinaryTree<Integer>(2));
		a.getLeftChild().addRightChild(new BinaryTree<Integer>(4));
		a.addRightChild(new BinaryTree<Integer>(3));
		a.getRightChild().addRightChild(new BinaryTree<Integer>(6));
		a.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		a.getRightChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(7));
		a.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(8));
		a.printLevelTraversal();
		System.out.println();
		Transformacion t = new Transformacion(a);
		t.suma();
		t.getTreeNode().printLevelTraversal(); // funciona. PRACTICA 2 50% COMPLETA
	}

}
