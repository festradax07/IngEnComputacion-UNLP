package filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class FiltroSessionHandler implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession sesion = req.getSession(false);

        String uri = req.getRequestURI();

        if (uri.endsWith("login.html") || uri.endsWith("LoginUsr")) {
            chain.doFilter(request, response); // Excepciones permitidas
        } else if (sesion != null && sesion.getAttribute("usuario") != null) {
            chain.doFilter(request, response); // Usuario autenticado
        } else {
            ((HttpServletResponse) response).sendRedirect("login.html");
        }
    }
}
