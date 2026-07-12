package BuildBinaryTree;
import java.util.List;

import tp2.ejercicio1.*;
public class Builder {
	public Builder() {
	}
	public BinaryTree<Integer> buildTreePreIn(List<Integer> preorder, List<Integer> inorder){
		return PreInHelper(0,0,inorder.size()-1, preorder,inorder);
	}
	private BinaryTree<Integer> PreInHelper(int preinit,int ininit,int inend, List<Integer> preorder, List<Integer> inorder){
		if( preinit > preorder.size()-1 || ininit > inend) {
			return null;
		}
		
		BinaryTree<Integer> root = new BinaryTree<Integer>(preorder.get(preinit)); // seteo elemento en root
		int inlocation=0;
		for( int i = ininit ; i<= inend;i++) {
			if(root.getData() == inorder.get(i)) {
				inlocation = i; // busca el elemento en inorder para encontrar los subarboles
			}
		}
		// utilizo la informacion para ir añadiendo sus hijos para construirlo
		root.addLeftChild(PreInHelper(preinit+1,ininit, inlocation-1, preorder,inorder));
		root.addRightChild(PreInHelper(preinit+inlocation-ininit+1,inlocation+1, inend, preorder,inorder));
		
		return root;
	}
}
