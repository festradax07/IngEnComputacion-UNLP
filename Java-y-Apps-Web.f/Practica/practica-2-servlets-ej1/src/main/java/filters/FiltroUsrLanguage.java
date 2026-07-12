package filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class FiltroUsrLanguage implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String lang = request.getLocale().getLanguage();

        String archivo = switch (lang) {
            case "en" -> "texto_en.properties";
            case "es" -> "texto_es.properties";
            default -> "texto_es.properties";
        };

        request.setAttribute("archivoLenguaje", archivo);
        chain.doFilter(req, res);
    }
}
