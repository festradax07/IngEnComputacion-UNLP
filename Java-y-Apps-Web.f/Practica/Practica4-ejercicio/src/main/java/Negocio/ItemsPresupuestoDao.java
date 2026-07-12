package Negocio;

import Modelo.Item;
import jakarta.persistence.EntityManager;

import java.util.List;

public class ItemsPresupuestoDao {
    private EntityManager em;

    public ItemsPresupuestoDao(EntityManager em) {
        this.em = em;
    }

    public void guardar(Item item) {
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
    }

    public List<Item> obtenerTodos() {
        return em.createQuery("SELECT i FROM Item i", Item.class).getResultList();
    }
}
