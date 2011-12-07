/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;
import java.io.IOException;
import javax.servlet.*;

/**
 *
 * @author tiendv
 */

public class UTF8Filter implements Filter{

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig)
            throws ServletException {
    }
}