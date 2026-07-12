package Servlets;

import Modelo.Item;
import Negocio.ItemsPresupuestoDao;
import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/formulario")
public class GenerarFormulario extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        EntityManager em = EntityMgmt.getEntityManager();
        ItemsPresupuestoDao dao = new ItemsPresupuestoDao(em);
        List<Item> items = dao.obtenerTodos();

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<html><body>");
        out.println("<h1>Presupuesto de Casamiento</h1>");
        out.println("<form method='POST' action='presupuesto'>");

        for (Item item : items) {
            out.printf("<input type='checkbox' name='item' value='%d'/> %s ($%.2f)<br/>",
                    item.getId(), item.getNombre(), item.getPrecio());
        }

        out.println("<br/>Nombre: <input type='text' name='nombre' required/><br/>");
        out.println("Email: <input type='email' name='email' required/><br/>");
        out.println("<br/><input type='submit' value='Calcular presupuesto'/>");
        out.println("</form>");
        out.println("</body></html>");

        em.close();
    }
}
