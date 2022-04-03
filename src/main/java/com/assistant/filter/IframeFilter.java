package com.assistant.filter;

import javax.servlet.*;
import java.io.IOException;

//@WebFilter(urlPatterns = {"/admin/*", "/doctor/*", "/patient/*"}, filterName = "iframeFilter")
public class IframeFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        try {
//            HttpServletRequest req = (HttpServletRequest) request;
//            HttpServletResponse res = (HttpServletResponse) response;
////        Enumeration<String> headerNames = req.getHeaderNames();
////        while (headerNames.hasMoreElements()){
////            String name = headerNames.nextElement();
////            System.out.println(name);
////            System.out.println(req.getHeader(name));
////        }
////        TestClass.showMe(req.getHeader("REFERER"));
//
//            // TODO 正式需解注释
//            if (StringUtils.isEmpty(req.getHeader("REFERER"))) { // TODO 过滤非iframe请求，还需要设置域名匹配
//                res.sendError(404);
////            res.sendRedirect("/error");
//            }
//
//            chain.doFilter(request, response);
//        } catch (Exception ignored) {
//
//        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
