package CodigosCualquiera.Parciales;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class Parcial2021GCorreccion {

	/*
	public Vertice<String> devolverCiudad(Grafo<String> grafo, String ciudad){
		ListaGenerica<Vertice<String>> vertices = grafo.listaDeVertices();
        Vertice<String> v = null;
        vertices.comenzar();
        while (!vertices.fin()) {
            v = vertices.proximo();
            if (v.dato().equals(ciudad))
                return v;
        }
        return v;
	}*/
	
	public ListaGenerica<ListaGenerica<String>> resolver(Grafo<String> grafo, String origen, String destino){
		ListaGenerica<ListaGenerica<String>> caminoFinal = new ListaEnlazadaGenerica<ListaGenerica<String>>();
		if(! grafo.esVacio()) {
			Vertice<String> vIni = null;
			Vertice<String> vFin = null;
			
			ListaGenerica<String> caminoTemporal = new ListaEnlazadaGenerica<String>();
			ListaGenerica<Vertice<String>> listaV = grafo.listaDeVertices();
			boolean[] marca = new boolean[listaV.tamanio() + 1];
			listaV.comenzar();
			while( ! listaV.fin() ) {
				Vertice<String> vAct = listaV.proximo();
				if(vAct.dato().equals(origen))
					vIni = vAct;
				if(vAct.dato().equals(destino))
					vFin = vAct;
				if( (vIni != null) && (vFin != null) ) {
					resolver(vIni, grafo, caminoFinal, caminoTemporal, marca, destino);
					break;
				}
			}
		}
		
		return caminoFinal;
	}
	
	private void resolver(Vertice<String> vAct, Grafo<String> grafo, ListaGenerica<ListaGenerica<String>> caminos, ListaGenerica<String> caminoAct,
												boolean[] marca, String destino) {
		
		caminoAct.agregarFinal(vAct.dato());
		marca[vAct.getPosicion()] = true;
		
		if(vAct.dato().equals(destino)) {
			caminos.agregarFinal(caminoAct.clonar());
		} else {
			ListaGenerica<Arista<String>> listaAdy = grafo.listaDeAdyacentes(vAct);
			listaAdy.comenzar();
			while(! listaAdy.fin()) {
				Vertice<String> vSig = listaAdy.proximo().verticeDestino();
				if(! marca[vSig.getPosicion()]) {
					resolver(vSig, grafo, caminos, caminoAct, marca, destino);
				}
			}
		}
		
		caminoAct.eliminarEn(caminoAct.tamanio());
		marca[vAct.getPosicion()] = false;
	}
	
	
	//main
	public static void main(String[] args) {

		GrafoImplListAdy<String> grafo = new GrafoImplListAdy<String>();
		
		VerticeImplListAdy<String> vLaPlata = new VerticeImplListAdy<String>("La Plata"); grafo.agregarVertice(vLaPlata);
		VerticeImplListAdy<String> vPinamar = new VerticeImplListAdy<String>("Pinamar"); grafo.agregarVertice(vPinamar);
		VerticeImplListAdy<String> vChascomus = new VerticeImplListAdy<String>("Chascomus"); grafo.agregarVertice(vChascomus);
		VerticeImplListAdy<String> vDolores = new VerticeImplListAdy<String>("Dolores"); grafo.agregarVertice(vDolores);
		VerticeImplListAdy<String> vPila = new VerticeImplListAdy<String>("Pila"); grafo.agregarVertice(vPila);
		VerticeImplListAdy<String> vMardelPlata = new VerticeImplListAdy<String>("Mar del Plata"); grafo.agregarVertice(vMardelPlata);
		VerticeImplListAdy<String> vMarAzul = new VerticeImplListAdy<String>("Mar Azul"); grafo.agregarVertice(vMarAzul);
		VerticeImplListAdy<String> vGaviotas = new VerticeImplListAdy<String>("Las Gaviotas"); grafo.agregarVertice(vGaviotas);
		VerticeImplListAdy<String> vMadariaga = new VerticeImplListAdy<String>("Madariaga"); grafo.agregarVertice(vMadariaga);
		VerticeImplListAdy<String> vHudson = new VerticeImplListAdy<String>("Hudson"); grafo.agregarVertice(vHudson);
		VerticeImplListAdy<String> vQuerandi = new VerticeImplListAdy<String>("Querandi"); grafo.agregarVertice(vQuerandi);
		
		grafo.conectar(vHudson, vLaPlata); grafo.conectar(vLaPlata, vHudson);
		grafo.conectar(vLaPlata, vMadariaga); grafo.conectar(vMadariaga, vLaPlata);
		grafo.conectar(vLaPlata, vChascomus); grafo.conectar(vChascomus, vLaPlata);
		grafo.conectar(vChascomus, vDolores); grafo.conectar(vDolores, vChascomus);
		grafo.conectar(vDolores, vMadariaga); grafo.conectar(vMadariaga, vDolores);
		grafo.conectar(vMadariaga, vPinamar); grafo.conectar(vPinamar, vMadariaga);
		grafo.conectar(vPinamar, vMarAzul); grafo.conectar(vMarAzul, vPinamar);
		grafo.conectar(vMarAzul, vGaviotas); grafo.conectar(vGaviotas, vMarAzul);
		grafo.conectar(vMarAzul, vQuerandi); grafo.conectar(vQuerandi, vMarAzul);
		grafo.conectar(vMarAzul, vMardelPlata); grafo.conectar(vMardelPlata, vMarAzul);
		grafo.conectar(vDolores, vPila); grafo.conectar(vPila, vDolores);
		grafo.conectar(vPila, vMardelPlata); grafo.conectar(vMardelPlata, vPila);
		
		System.out.println(new Parcial2021GCorreccion().resolver(grafo, "La Plata", "Mar del Plata"));
		
		//La Plata -> Madariaga -> Dolores -> Pila -> Mar del Plata
		//La Plata -> Madariaga -> Pinamar -> Mar Azul -> Mar del Plata
		//La Plata -> Chascomus -> Dolores -> Madariaga -> Pinamar -> Mar Azul -> Mar del Plata
		//La Plata -> Chascomus -> Dolores -> Pila -> Mar del Plata
	}
}
