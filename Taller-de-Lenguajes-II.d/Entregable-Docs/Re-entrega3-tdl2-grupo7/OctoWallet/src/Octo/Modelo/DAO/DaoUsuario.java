package Octo.Modelo.DAO;

import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.Entidad.User;

public interface DaoUsuario extends Crud<User>{
    boolean verificarMail(String mail) throws OctoElemNotFoundException;
    User obtenerPorMail(String email, String contrasena) throws OctoElemNotFoundException;
}
