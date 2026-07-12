package tp3.ej6;
import java.util.List;

import tp3.ej1.*;
public class RedDeAguaPotable {
	GeneralTree<Character> red;
	
	public RedDeAguaPotable(GeneralTree<Character> red) {
		this.red = red;
	}
	public double minimoCaudal(double caudal) {
		// calcula cual es el caudal minimo que llega a algun hogar.
		if(this.red.isEmpty()) {
			return -1;
		}else {
			return minimoCaudalHelper(this.red,caudal);
		}
	}
	private double minimoCaudalHelper(GeneralTree<Character> red, double caudal) {
		double returnCaudal = -1, minCaudal= Double.MAX_VALUE;
		if(!red.isEmpty()) {
			if(red.isLeaf()) {
				return caudal;
			}
			
			List<GeneralTree<Character>> children = red.getChildren();
			
			double childsCaudal = caudal / children.size(); 
			
			for(GeneralTree<Character> child: children) {
				returnCaudal= minimoCaudalHelper(child,childsCaudal );
				if(minCaudal > returnCaudal) {
					minCaudal = returnCaudal; 
				}
			}
		}
			return minCaudal;
		
	}
	
}
