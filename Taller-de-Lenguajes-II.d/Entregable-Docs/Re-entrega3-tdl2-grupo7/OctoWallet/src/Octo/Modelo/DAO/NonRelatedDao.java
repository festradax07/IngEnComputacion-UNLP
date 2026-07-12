package Octo.Modelo.DAO;

import Octo.Exceptions.OctoElemNotFoundException;

import java.util.List;

public interface NonRelatedDao<T> {
    // uso para tablas cuya información no sea sensible.
List<T> listar()throws OctoElemNotFoundException;

}
