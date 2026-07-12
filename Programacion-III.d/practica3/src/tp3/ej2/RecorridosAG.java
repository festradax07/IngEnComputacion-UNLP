package tp3.ej2;
import java.util.LinkedList;
import java.util.List;

import tp3.ej1.GeneralTree;
public class RecorridosAG {
	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a , Integer n){
		List <Integer> l = new LinkedList<Integer>();
		if( a.getData() > n && (a.getData() % 2 == 1))
		l.add(a.getData());
		List <GeneralTree<Integer>> childs = a.getChildren();
		for(GeneralTree <Integer> c: childs ) {
			l.addAll(numerosImparesMayoresQuePreOrden(c,n));
		}
		return l;
	}
	public List <Integer> numerosImparesMayoresQueInOrden(GeneralTree <Integer> a, Integer n){
		List<Integer> l = new LinkedList<Integer>();
		List<GeneralTree<Integer>> childs = a.getChildren();
		if( !childs.isEmpty()) {
		 	 l.addAll(numerosImparesMayoresQueInOrden(childs.get(0), n)); // evalua con el primer elemento
		}
		if( a.getData() > n && (a.getData() % 2 == 1))
		l.add(a.getData()); // raiz en el medio
		
		if(childs.size() > 1){
			for(int i = 1; i< childs.size(); i++) {
				l.addAll(numerosImparesMayoresQueInOrden(childs.get(i), n));
			}
		  }
		return l;
		}
		public List<Integer> numerosImparesMayoresQuePostOrden(GeneralTree<Integer> a , Integer n){
		List <Integer> l = new LinkedList<Integer>();
		List <GeneralTree<Integer>> childs = a.getChildren();
		for(GeneralTree <Integer> c: childs ) {
			l.addAll(numerosImparesMayoresQuePostOrden(c,n));
		}
		if( a.getData() > n && (a.getData() % 2 == 1))
		l.add(a.getData());
		
		return l;
		}
		// HACER POR NIVELES
		
}
	
