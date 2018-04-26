package com.gs.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2017/12/8.
 */
public class LoginFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(LoginFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("loginfilter init...");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String uri = request.getRequestURI();
        if (notFilter(uri)) {
            filterChain.doFilter(servletRequest,  servletResponse);
        } else {
            HttpSession session = request.getSession();
            Object user = session.getAttribute("user");
            if (user != null) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                HttpServletResponse response = (HttpServletResponse) servletResponse;
                response.sendRedirect("/");
            }
        }
    }

    @Override
    public void destroy() {
        logger.info("loginfilter destroy...");
    }

    private boolean notFilter(String uri) {
        return uri.equals("/") || uri.contains("/user/") || uri.contains("/code") || uri.contains("/static/")|| uri.contains("/test") || uri.contains("/logtx") || uri.contains("/huser/")|| uri.contains("/reAndLo/")|| uri.contains("/logtx")|| uri.contains("/logczz")|| uri.contains("/bank") || uri.contains("/jur/")|| uri.contains("/role/") || uri.contains("/roleUser/") || uri.contains("/detail") || uri.contains("/sway")|| uri.contains("/jklx")|| uri.contains("/dxModel")|| uri.contains("/bz") || uri.contains("/letter");
    }
}
