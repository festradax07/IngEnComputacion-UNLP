package tp3.ej7;
import java.util.LinkedList;
import java.util.List;

import tp3.ej1.GeneralTree;
public class Caminos {
	GeneralTree<Integer> root;
	public Caminos(GeneralTree<Integer> root) {
		this.root= root;
	}
	public List<Integer> caminoAHojaMasLejana(){
		if(root.isEmpty()) {
			return null;
		}
		List<Integer> listahistorial = new LinkedList<Integer>();
		List<Integer> listaMax = new LinkedList<Integer>();
		HelperCaminos(this.root, listahistorial,listaMax);
		return listaMax;
	}
	private int HelperCaminos(GeneralTree<Integer> root, List<Integer> listahistorial, List<Integer> listaMax){
		if(root == null || root.isEmpty()) {
			return 0;
		}
			listahistorial.add(root.getData());
			if(root.isLeaf()) {
				if(listahistorial.size() > listaMax.size()) {
					listaMax.clear();
					listaMax.addAll(listahistorial);
				}
			}
			int Maxlength = 0;
			for(GeneralTree<Integer> child : root.getChildren()) {
				int length = HelperCaminos(child,listahistorial, listaMax);
				if(length > Maxlength) {
					Maxlength = length;
				}
			}
			listahistorial.remove(listahistorial.size()-1);
			return Maxlength +1;
		} 
	}

