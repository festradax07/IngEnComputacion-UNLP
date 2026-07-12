package Trees;
import java.util.LinkedList;
import java.util.List;

import tp3.ej1.*;
public class resolucion1 {
	
	public List<String> caminoARetornar(GeneralTree<StringNum> tree){
		List<String> camino = new LinkedList<>();
		if(!tree.isEmpty()) {
			camino.add(tree.getData().getLetra());
			if(tree.hasChildren()) {
				camino.addAll(caminoARetornar(tree.getChildren().get(tree.getData().getNum())));
			}
		}
		return camino;
		
	}
}
