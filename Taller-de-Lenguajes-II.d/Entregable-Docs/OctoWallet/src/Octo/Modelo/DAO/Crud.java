package Octo.Modelo.DAO;

import java.util.List;
// interfaz generica para las entidades que se van a conectar o tienen tablas en la bd

public interface Crud <T>{
    void crear(T dato);
    List<T> listar();
    /* void borrar();
    void actualizar();*/
    T obtener(String id);
}
