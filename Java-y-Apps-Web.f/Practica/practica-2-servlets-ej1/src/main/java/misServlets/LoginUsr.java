package misServlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;



public class LoginUsr extends HttpServlet {
    private Hashtable<String, String> logins; // clave = nombre valor= contraseña
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        logins = new Hashtable<>();

        Enumeration<String> params = config.getInitParameterNames();
        while (params.hasMoreElements()) {
            String usuario = params.nextElement();
            String clave = config.getInitParameter(usuario);
            logins.put(usuario, clave);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String apellidoNombre = request.getParameter("apellidoNombre");
        String direccion = request.getParameter("direccion");

        if (logins.containsKey(usuario) && logins.get(usuario).equals(clave)) {
            HttpSession sesion = request.getSession(true); // creo la sesión (iniciarla)
            sesion.setAttribute("usuario", usuario);
            sesion.setAttribute("apellidoNombre", apellidoNombre);
            sesion.setAttribute("direccion", direccion);

            response.sendRedirect(request.getContextPath() + "/Productos");
        } else {
            response.sendRedirect(request.getContextPath() + "/login.html");
        }
    }
}
