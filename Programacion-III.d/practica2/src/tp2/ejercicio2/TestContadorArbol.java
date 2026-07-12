package tp2.ejercicio2;

import tp2.ejercicio1.BinaryTree;

public class TestContadorArbol {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// correspomdem a ej3
		BinaryTree <Integer> a = new BinaryTree<Integer>(6);
		a.addLeftChild(new BinaryTree<Integer>(4));
		a.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		a.getLeftChild().addRightChild(new BinaryTree<Integer>(2));
		a.addRightChild(new BinaryTree<Integer>(10));
		a.getRightChild().addRightChild(new BinaryTree<Integer>(12));
		ContadorArbol <Integer> c = new ContadorArbol<Integer>(a);
		System.out.println(c.numerosPares(c.getTreeNode()));
		System.out.println(c.numerosParesIn(c.getTreeNode()));
		System.out.println(c.numerosParesPost(c.getTreeNode()));
	}

}
