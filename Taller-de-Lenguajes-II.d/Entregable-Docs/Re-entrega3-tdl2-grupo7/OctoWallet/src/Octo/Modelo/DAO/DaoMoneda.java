package Octo.Modelo.DAO;

import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.Entidad.Moneda;

public interface DaoMoneda extends Crud <Moneda>, NonRelatedDao<Moneda>{
    // acá podriamos darle más metodos para que daoimp de moneda deba implementarlos
    // acá podrian ir implementaciónes de busqueda por nomenclatura, ya que es el servicio extendido.
    Moneda obtenerPorNomenclatura(String nomenclatura) throws OctoElemNotFoundException;
    int  actualizar(Moneda moneda) throws OctoElemNotFoundException;
}
