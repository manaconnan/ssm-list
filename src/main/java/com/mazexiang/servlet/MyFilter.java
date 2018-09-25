package com.mazexiang.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "MyFilter")
public class MyFilter implements Filter {
    private  int count;
    public void destroy() {
        System.out.println("------------------------Filter destroy-------------------------------");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("-----------------------DoFilter--------------------------------");
        count++;
        HttpServletRequest request =(HttpServletRequest) req;
        HttpSession session = request.getSession();
        session.setAttribute("count" ,count);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("----------------------------Filter init---------------------------");
        String countStr = config.getInitParameter("count");
        count = Integer.valueOf(countStr);
    }

}
