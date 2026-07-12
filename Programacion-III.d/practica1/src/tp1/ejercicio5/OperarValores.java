package tp1.ejercicio5;

public class OperarValores {
	private static int max = Integer.MIN_VALUE;
    private static int min = Integer.MAX_VALUE;
    private static double suma = 0.0;
    private static double promedio = 0.0;
    // para utilizar el metodo sin argumentos!
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] array = {1,10,50,99,55,6,69};
		System.out.println("calcular con retorno " + calcularRetorno(array));
		Valores v = new Valores(Integer.MAX_VALUE);
		calcularParametro(array,v);
		System.out.println("calcular con Parametro " + v);
		calcular(array);
		System.out.println("calcular sin nada : " +" max : " + max + "min: " + min + "promedio: " + promedio);
	}
	public static Valores calcularRetorno (int[] array) {
		Valores v= new Valores(9999); // al tener v.i int y double se inician en 0 y 0.0
		for(int i=0;i<array.length;i++) {
			if(v.getMax() < array[i]) {
				v.setMax(array[i]);
			}
			if(v.getMin( )> array[i]) {
				v.setMin(array[i]);
			}
			v.setSuma(v.getSuma() + array[i]);
		}
		v.setPromedio((double) v.getSuma()/array.length);
		return v;
	}
	
	public static void calcularParametro (int[] array, Valores v) {
		// es necesario tener un objeto valores ya inicializado con min == 9999 
		for(int i=0;i<array.length;i++) {
			if(v.getMax() < array[i]) {
				v.setMax(array[i]);
			}
			if(v.getMin( )> array[i]) {
				v.setMin(array[i]);
			}
			v.setSuma(v.getSuma() + array[i]);
		}
		v.setPromedio((double) v.getSuma()/array.length);
	}
	public static void calcular(int[] array) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
            if (array[i] < min) {
                min = array[i];
            }
            suma += array[i];
        }
        promedio = suma / array.length;
    }
	
	
}
