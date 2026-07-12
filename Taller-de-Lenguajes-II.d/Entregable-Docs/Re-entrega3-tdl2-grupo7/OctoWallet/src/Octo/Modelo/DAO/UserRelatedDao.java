package Octo.Modelo.DAO;

import java.util.List;

public interface UserRelatedDao<T> {
    List<T> listarPorId(long id);
}
