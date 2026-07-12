package Negocio;

import Modelo.Visitante;
import jakarta.persistence.EntityManager;

public class VisitanteDao {
    private EntityManager em;

    public VisitanteDao(EntityManager em) {
        this.em = em;
    }

    public void guardar(Visitante visitante) {
        em.getTransaction().begin();
        em.persist(visitante);
        em.getTransaction().commit();
    }
}
