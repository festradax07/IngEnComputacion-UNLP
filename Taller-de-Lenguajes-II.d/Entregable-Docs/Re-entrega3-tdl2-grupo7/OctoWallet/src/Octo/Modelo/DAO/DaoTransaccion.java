package Octo.Modelo.DAO;

import Octo.Modelo.Entidad.Transaccion;

public interface DaoTransaccion extends Crud<Transaccion>, UserRelatedDao<Transaccion> {
    void comprarCriptoMonedas(long idCrypto, long idFiat, double cantidad );
    void swap(long idOriginal, double cantidad, long idEsperada);

}
