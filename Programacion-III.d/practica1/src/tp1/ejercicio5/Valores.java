package tp1.ejercicio5;

public class Valores {
	private int max;
	private int min;
	private int suma;
	private double promedio;
	public Valores() {
		// TODO Auto-generated constructor stub
	}
	
	public Valores(int max, int min,int suma, double promedio) {
		super();
		this.max = max;
		this.min = min;
		this.suma= suma;
		this.promedio = promedio;
	}

	public Valores(int min) {
		super();
		this.min = min;
	}
	
	public int getSuma() {
		return suma;
	}

	public void setSuma(int suma) {
		this.suma = suma;
	}

	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public double getPromedio() {
		return promedio;
	}
	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}

	@Override
	public String toString() {
		return "Valores [max=" + max + ", min=" + min + ", promedio=" + promedio + "]";
	}
	

}
