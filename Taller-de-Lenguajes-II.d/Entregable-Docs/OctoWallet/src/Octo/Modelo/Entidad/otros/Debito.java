package Octo.Modelo.Entidad.otros;
/**
 * @author Giovanna Gotusso,Francisco Estrada,Ludmila Dosil
 * @version 1.0
 * Esta clase publica Debito representa las carateristicas que tiene debito para modificar el saldo de la cuenta y etc. 
 * 
 */
public class Debito extends Tarjeta {
	private String monedaA;
	private double Saldo;
	/**@param nom_a indica el nombre en la tarjeta
	 * @param numT indica el numero de la tarjeta
	 * @param fechaS indica la fecha en la cual fue entregada la tarjeta
	 * @param fechaV indica la fecha en la cual vence la tarjeta
	 * @param numS indica el numero de seguridad de la tarjeta
	 * @param esV indica si la tarjeta es vitual o no
	 * @param codV en caso de que lo sea indica el numero virtual de la tarjeta
	 * @param limD indica el limite por dia de la tarjeta
	 * @param mon indica la moneda seleccionada para el uso de la tarjeta debito (se puede modificar)
	 * @param S indica el saldo de la tarjeta debito*/
	
	public Debito(String nom_a,long numT,String fechaS,String fechaV,int numS,boolean esV,double limD,String mon,double S) {
		super(nom_a,numT,fechaS,fechaV,numS,esV,limD);
		this.monedaA=mon;
		this.Saldo=S;
	}
	/** @return retorna la moneda seleccionada*/
public String getMonedaA() {
	return monedaA;
}
/** @param mon indica la moneda seleccionada para el uso de la tarjeta debito (se puede modificar)*/
public void setMonedaA(String monedaA) {
	this.monedaA = monedaA;
}
/** @return retorna el saldo de debito*/
public double getSaldo() {
	return Saldo;
}
/** @param S indica el saldo de la tarjeta debito*/
public void setSaldo(double saldo) {
	Saldo = saldo;
}
}
