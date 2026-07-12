package ExpressionTree;
import java.util.Stack;

import tp2.ejercicio1.BinaryTree;
public class ExpTree {
	public static void main(String[] args) {
		
	}
	public BinaryTree<Character> turnPostFija(String exp){ // exp ab+c*de+/
		Character c = null;
		BinaryTree<Character> result;
		Stack<BinaryTree<Character>> pila = new Stack <BinaryTree<Character>>();
		
		for(int i=0;i< exp.length();i++) {
			c= exp.charAt(i);
			result= new BinaryTree<Character>(c);
			
		if((c=='+')||(c=='-')||(c=='*')||(c=='/')) {
			// si es un operador
			result.addRightChild(pila.pop());
			result.addLeftChild(pila.pop());
		}
			pila.push(result); // se apilan los elementos, y cada vez que van apareciendo operadores, se unifican los nodos y se pushean a la estructura
		}
		return pila.pop();
	}
	
	public BinaryTree<Character> turnPreFija(StringBuffer exp){ // debido a la estructura del recorrido preorden - raiz, subarbolizq, subarbolder;
		Character c = exp.charAt(0);
		BinaryTree<Character> result = new BinaryTree<Character>(c);
		if((c=='+')||(c=='-')||(c=='*')||(c=='/')) {
			result.addLeftChild(turnPreFija(exp.delete(0, 1)));
			result.addRightChild(turnPreFija(exp.delete(0, 1)));
		}
		// es operando
		return result; //+ + a e / * - b c d f 
		}
	
}
