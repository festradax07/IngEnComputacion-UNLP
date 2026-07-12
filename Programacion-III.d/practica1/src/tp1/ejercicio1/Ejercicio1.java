package tp1.ejercicio1;

public class Ejercicio1 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("for!\n");
		imprimirFor(3,8);
		System.out.println("\nwhile!\n");
		imprimirWhile(3,8);
		System.out.println("\nrecursive!\n");
		imprimirRecursive(3,8);
	}
	public static void imprimirFor(int a , int b ) {
		for (int i=a;i<=b;i++) {
			System.out.print(i + " - ");
		}
	}
	public static void imprimirWhile(int a, int b) {
		int i=a;
		while(i<=b) {
			System.out.print(i + " - ");
			i++;
		}
	}
	public static void imprimirRecursive(int a, int b) {
		if(a <= b) {
			System.out.print(a + " - ");
			imprimirWhile(a+1,b);
		}
	}

}
