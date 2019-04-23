package com.yyh.yuu.blog.web.admin.web.interceptor;

import com.yyh.yuu.blog.commons.constant.ConstantUtils;
import com.yyh.yuu.blog.domain.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Classname PermissionInterceptor
 * @Date 2018/11/13 19:00
 * @Created by Yuu
 */
public class PermissionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        // 以 login 结尾的请求
        if (modelAndView != null && modelAndView.getViewName() != null && modelAndView.getViewName().endsWith("login")){
            Manager manager = (Manager) httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_MANAGER);
            if (manager != null) {
                httpServletResponse.sendRedirect("/home");
            }
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
