package tp1.ejercicio4;

public class swapValores {
	public static void swap1 (int x, int y) {
			if (x < y) {
				int tmp = x ;
				x = y ;
				y = tmp;
			}
		}
		public static void swap2 (Integer x, Integer y) {
			if (x < y) {
				int tmp = x ;
				x = y ;
				y = tmp;
			}
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 1, b = 2; // datos primitivos
		Integer c = 3, d = 4; // objetos wrapper
		swap1(a,b); // crea duplicados, se cambian y mueren en memoria
		swap2(c,d); // lo mismo pero son objetos.
		System.out.println("a=" + a + " b=" + b) ;
		System.out.println("c=" + c + " d=" + d) ; // no cambia nada, se necesita un objeto de datos!
	   }
	}
