package com.filter;

import com.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(urlPatterns = {"*.do","*.jsp"})
public class AccessFilter implements Filter {

    private HttpServletRequest req;
    private ServletResponse response;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        this.response = response;
        req = (HttpServletRequest) request;
        String path = req.getServletPath();
        boolean flag = false;
        if(path.equals("/index.jsp")){
            chain.doFilter(request,response);
        }else{
            User user = (User) req.getSession().getAttribute("USER");
            if (user!=null){
                chain.doFilter(request, response);
            }else{
                toLoginPage();
            }
        }
    }

    @Override
    public void destroy() {

    }
    //跳转至登录页面
    private void toLoginPage() {
        HttpServletResponse res = (HttpServletResponse) response;
        try {
            res.sendRedirect(req.getContextPath() + "/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
