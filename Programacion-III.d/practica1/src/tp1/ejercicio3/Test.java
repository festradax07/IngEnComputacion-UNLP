package tp1.ejercicio3;
import java.util.Scanner;
public class Test {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner in = new Scanner(System.in);
		Estudiante [] curso = new Estudiante[2];
		Profesor[] catedra = new Profesor[2];
		for( int i = 0;i<curso.length ; i++) {
			curso[i]= new Estudiante();
			System.out.println("nombre");
			curso[i].setNombre(in.next());
			in.nextLine();
			System.out.println("apellido");
			curso[i].setApellido(in.next());
			System.out.println("comision");
			curso[i].setComision(in.next());
			in.nextLine();
			System.out.println("direccion");
			curso[i].setDireccion(in.next());
			System.out.println("email");
			curso[i].setEmail(in.next());
		}
		for(int j=0;j<catedra.length;j++) {
			catedra[j]= new Profesor();
			System.out.println("nombre");
			catedra[j].setNombre(in.next());
			System.out.println("apellido");
			catedra[j].setApellido(in.next());
			System.out.println("catedra");
			catedra[j].setCatedra(in.next());
			System.out.println("email");
			catedra[j].setEmail(in.next());
			System.out.println("facultad");
			catedra[j].setFacultad(in.next());
		}
		System.out.println(catedra[0].toString());
		System.out.println(catedra[1].toString());
		System.out.println(curso[0].toString());
		System.out.println(curso[1].toString());
		in.close();
	}

}
