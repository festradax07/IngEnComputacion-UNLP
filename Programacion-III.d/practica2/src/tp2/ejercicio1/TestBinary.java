package tp2.ejercicio1;

public class TestBinary {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinaryTree <Integer> a = new BinaryTree<Integer>(6);
		a.addLeftChild(new BinaryTree<Integer>(4));
		a.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		a.getLeftChild().addRightChild(new BinaryTree<Integer>(5));
		a.addRightChild(new BinaryTree<Integer>(11));
		a.getRightChild().addRightChild(new BinaryTree<Integer>(15));
		a.getRightChild().getRightChild().addLeftChild(new BinaryTree<Integer>(10));
		BinaryTree <Integer> a2 = a.espejo();
		a2.printLevelTraversal();
		System.out.println("contar hojas: " + a2.contarHojas());
		a.printLevelTraversal();
		System.out.println("entre niveles");
		a.entreNiveles(0, 1);
		System.out.println("entre niveles");
		a.entreNiveles(0, 2);
	}

}
