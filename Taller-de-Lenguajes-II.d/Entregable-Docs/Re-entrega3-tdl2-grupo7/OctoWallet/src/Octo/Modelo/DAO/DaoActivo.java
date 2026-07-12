package Octo.Modelo.DAO;

import Octo.Exceptions.OctoDBException;
import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.Entidad.Activo;

public interface DaoActivo extends Crud<Activo>, UserRelatedDao<Activo> {
    // acá podriamos darle más metodos para que daoimp de activo deba implementarlos
    int actualizarCantidad(double valor, long idUser, long idMoneda) throws OctoDBException;
    Activo obtenerporIdyMoneda(long idUser, long idMoneda) throws OctoElemNotFoundException;
}