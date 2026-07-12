package tp2.ejerciciosParciales;

import tp2.ejercicio1.BinaryTree;

public class TestParciales {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// implementacion del ejercicio 7 -->
		BinaryTree <Integer> a = new BinaryTree<Integer>(2);
		a.addLeftChild(new BinaryTree<Integer>(7));
		a.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
		a.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(55));
		a.getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(11));
		a.getLeftChild().addLeftChild(new BinaryTree<Integer>(23));
		a.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(-3));
		a.addRightChild(new BinaryTree<Integer>(-5));
		a.getRightChild().addLeftChild(new BinaryTree<Integer>(19));
		a.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(4));
		a.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(18));
		a.getRightChild().getLeftChild().getRightChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		
		ParcialArboles p = new ParcialArboles(a);
		System.out.println(" con 7 " + p.isLeftTree(7));
		System.out.println("con -5" + p.isLeftTree(-5));
		System.out.println("con 19" + p.isLeftTree(19));
		System.out.println("con -3" + p.isLeftTree(-3));
		System.out.println("con 2 " +  p.isLeftTree(2));
		System.out.println("con 4 " +  p.isLeftTree(4));
		 // implementacion de prueba del ejercicio 8
		BinaryTree <Integer> a2 = new BinaryTree<Integer>(2);
		a2.addLeftChild(new BinaryTree<Integer>(7));
		a2.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
		a2.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(55));
		a2.getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(11));
		a2.getLeftChild().addLeftChild(new BinaryTree<Integer>(23));
		System.out.println(p.esPrefijo(a2,a));
		
		// ej9
		BinaryTree<Datos> d = p.sumAndDif(a2);
		p.preorden(d);
		
		// ej YO YO MISTER WHITE
		BinaryTree <Integer> a3 = new BinaryTree<Integer>(1);
		a3.addLeftChild(new BinaryTree<Integer>(1));
		a3.getLeftChild().addRightChild(new BinaryTree<Integer>(1));
		a3.getLeftChild().addLeftChild(new BinaryTree<Integer>(2));
		a3.addRightChild(new BinaryTree<Integer>(1));
		a3.getRightChild().addLeftChild(new BinaryTree<Integer>(2));
		a3.getRightChild().addRightChild(new BinaryTree<Integer>(1));
		System.out.println(p.TotalValency(a3));
		
	}

}
