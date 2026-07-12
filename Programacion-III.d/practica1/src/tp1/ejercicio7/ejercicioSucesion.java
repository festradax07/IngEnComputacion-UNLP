package tp1.ejercicio7;
import java.util.List;
import java.util.ListIterator;
import java.util.ArrayList;
import java.util.LinkedList;
public class ejercicioSucesion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			List <Integer> l2 = sucesion(5);
			for(int numero: l2) {
				System.out.print(numero + " - ");
			}
			ArrayList<Integer> l3= new ArrayList<Integer>(l2);
			reverseList(l3);
			System.out.println();
			for(int numero: l3) {
				System.out.print(numero + " - ");
			}
			System.out.println("suma de los valores de lista : " + sumarLinkedList(new LinkedList<Integer>(l3)));
			System.out.println("suma de los valores de lista : " + sumarLinkedList2(l3.listIterator()));
			mergeSort(l3);
			for(int numero: l3) {
				System.out.print(numero + " - ");
			}
			System.out.println();
			ArrayList <Integer> l4 = new ArrayList<Integer>();
			l4.add(44);
			l4.add(54);
			l4.add(12);
			l4.add(5);
			
			mergeSort(l4);
			
			for(int numero: l4) {
				System.out.print(numero + " - ");
			}
			ArrayList <Integer> arral = combinarOrdenado(l4,l3);
			System.out.println();
			
			for(int numero: arral) {
				System.out.print(numero + " - ");
			}
		}
	
	public static void reverseList(ArrayList<Integer> lista) {
		// Caso base: lista vacía o con un solo elemento
        if (lista.size() <= 1) {
            return;
        }
        // Caso recursivo:
        // 1. Eliminar el último elemento de la lista
        int primerElemento = lista.remove(0); // remueve el valor;
        // 2. "Invertir" el resto de la lista
        reverseList(lista);
        // 3. Agregar el último elemento al principio de la lista
        lista.add(primerElemento);
	}
	public static int sumarLinkedList(LinkedList<Integer> lista) {
	if( lista.size() <= 1) {
		return lista.remove(0);
	} 
	LinkedList <Integer> lislocal= new LinkedList <Integer> (lista);
	
	return  lislocal.remove(0) + sumarLinkedList(lislocal);

	}
	public static int sumarLinkedList2(ListIterator<Integer> iter) { // no puedo utilizar list, sino listiterator
		if(!iter.hasNext()) {
			return 0;
		}else {
			return iter.next() + sumarLinkedList2(iter);
		} 
	}
	public static List <Integer> sucesion(int n ) {
	    List <Integer> l = new LinkedList <Integer>();
	    l.add(n);
	    if ( n > 1) {
			if (n % 2 == 0) {
				n = n/2;	
			} else {
				n= 3*n +1 ;
			}
		 l.addAll(sucesion(n));
	    }
	    return l;
	}
	
	public static void mergeSort(ArrayList<Integer> lista) {
        if (lista.size() <= 1) {
            return;
        }
        
        int mitad = lista.size() / 2;
        
        ArrayList<Integer> izquierda = new ArrayList<>(lista.subList(0, mitad));
        ArrayList<Integer> derecha = new ArrayList<>(lista.subList(mitad, lista.size()));
        
        mergeSort(izquierda);
        mergeSort(derecha);
        
        fusionar(lista, izquierda, derecha);
    }
    
    public static void fusionar(ArrayList<Integer> lista, ArrayList<Integer> izquierda, ArrayList<Integer> derecha) {
        int indiceIzquierda = 0;
        int indiceDerecha = 0;
        int indiceLista = 0;
        
        while (indiceIzquierda < izquierda.size() && indiceDerecha < derecha.size()) {
            if (izquierda.get(indiceIzquierda) < derecha.get(indiceDerecha)) {
                lista.set(indiceLista++, izquierda.get(indiceIzquierda++));
            } else {
                lista.set(indiceLista++, derecha.get(indiceDerecha++));
            }
        }
        
        while (indiceIzquierda < izquierda.size()) {
            lista.set(indiceLista++, izquierda.get(indiceIzquierda++));
        }
        
        while (indiceDerecha < derecha.size()) {
            lista.set(indiceLista++, derecha.get(indiceDerecha++));
        }
    }
	
	
	
	public static  ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1,ArrayList<Integer> lista2){
		
		// suponemos lista1 lista2 ordenadas.
		ArrayList <Integer> lista3 = new ArrayList<Integer>();
		int i = 0, j=0; // resuelvo iterativamente, contadores-> i para lista1 , j para lista2
		while( i < lista1.size() && j < lista2.size()) {
			if( lista1.get(i) < lista2.get(j)) {
				lista3.add(lista1.get(i++));
			} else if( lista2.get(j) < lista1.get(i)){ // admite el caso de repetido
				lista3.add(lista2.get(j++));
			}else {
				lista3.add(lista1.get(i++));
				j++;// en el repetido, añade de uno, incrementa el contador de ambos para continuar
			}
			
		}
		// evaluo sea que alguna de las listas sea mas larga que la otray requiera recorrerla aun mas
		
		while(i < lista1.size()) {
			lista3.add(lista1.get(i++));
		}
		while(j < lista2.size()) {
			lista3.add(lista2.get(j++));
		}
		return lista3;
	}

}
