package Servlets;

import Modelo.Item;
import Modelo.Visitante;
import Negocio.VisitanteDao;
import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/presupuesto")
public class GenerarPresupuesto extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, IOException {
        EntityManager em = EntityMgmt.getEntityManager();
        VisitanteDao visitanteDAO = new VisitanteDao(em);

        String nombre = req.getParameter("nombre");
        String email = req.getParameter("email");
        String[] itemIds = req.getParameterValues("item");

        double total = 0;
        if (itemIds != null) {
            for (String id : itemIds) {
                Item item = em.find(Item.class, Long.parseLong(id));
                if (item != null) {
                    total += item.getPrecio();
                }
            }
        }

        Visitante visitante = new Visitante();
        visitante.setNombre(nombre);
        visitante.setEmail(email);
        visitante.setTotalPresupuesto(total);
        visitanteDAO.guardar(visitante);

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.printf("<h1>¡Gracias %s!</h1>", nombre);
        out.printf("<p>Tu presupuesto estimado es: <strong>$%.2f</strong></p>", total);
        out.println("<a href='formulario'>Volver al formulario</a>");
        out.println("</body></html>");

        em.close();
    }
}

