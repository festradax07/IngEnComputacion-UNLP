package Octo.Modelo.DAO;

import Octo.Exceptions.OctoDBException;
import Octo.Exceptions.OctoElemNotFoundException;

import java.util.List;
// interfaz generica para las entidades que se van a conectar o tienen tablas en la bd

public interface Crud <T>{
    long crear(T elem) throws OctoDBException;
    //List<T> listar() throws OctoDBException;
    /* void borrar();*/
    //int actualizar(T elem) throws OctoElemNotFoundException;
    T obtener(long id) throws OctoElemNotFoundException;
}
