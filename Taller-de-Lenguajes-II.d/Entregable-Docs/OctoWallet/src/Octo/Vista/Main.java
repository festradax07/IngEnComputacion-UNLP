package Octo.Vista;

import Octo.Modelo.DAO.DaoMonedaImpl;
import Octo.Modelo.Entidad.Moneda;

public class Main {
    public static void main(String[] args) {
        DaoMonedaImpl mon = new DaoMonedaImpl();
        mon.crear(new Moneda("k","MIAU","Lmao", 4000.00,1,5000));
        System.out.println(mon.listar());
    }
}
