package tp3.ej6;
import java.util.Arrays;

import tp3.ej1.*;
public class TestRed {
	public static void main(String[] args) {
		RedDeAguaPotable awa;
		GeneralTree<Character> red = new GeneralTree<>('A',Arrays.asList(new GeneralTree<>('B'),new GeneralTree<>('C'),new GeneralTree<>('D'),new GeneralTree<>('E')));
		red.getChildren().get(1).addChild(new GeneralTree<>('F'));
		red.getChildren().get(1).addChild(new GeneralTree<>('G'));
		red.getChildren().get(1).getChildren().get(1).addChild(new GeneralTree<>('L'));// rama 2
		
		red.getChildren().get(2).addChild(new GeneralTree<>('H'));
		red.getChildren().get(2).addChild(new GeneralTree<>('I'));
		red.getChildren().get(2).addChild(new GeneralTree<>('J'));
		red.getChildren().get(2).addChild(new GeneralTree<>('K'));
		red.getChildren().get(2).addChild(new GeneralTree<>('O'));
		red.getChildren().get(2).getChildren().get(2).addChild(new GeneralTree<>('M'));
		red.getChildren().get(2).getChildren().get(2).addChild(new GeneralTree<>('N'));
		
		awa= new RedDeAguaPotable(red);
		System.out.println(awa.minimoCaudal(1000));
	}
}
