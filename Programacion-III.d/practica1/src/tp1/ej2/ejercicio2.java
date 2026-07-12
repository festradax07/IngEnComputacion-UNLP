package tp1.ej2;
import java.util.Scanner;
public class ejercicio2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner in = new Scanner(System.in);
		int[]array= tamanioArreglo(in.nextInt());
		for( int numero : array) {
			System.out.print(numero + " - ");
		}
		in.close();
	}
	public static int[] tamanioArreglo(int n) {
		int [] array= new int[n];
		for( int i = 0 ; i< n ; i++) {
			array[i] = n*(i+1);
		}
		return array;
	}

}
