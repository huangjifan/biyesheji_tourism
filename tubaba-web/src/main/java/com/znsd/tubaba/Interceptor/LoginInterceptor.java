package com.znsd.tubaba.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	
	//拦截前
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//拦截后台登陆页面
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("admin") == null) {
			response.sendRedirect("/admin_login.jsp");
			return false;
		}
		return true;
	}

	//拦截中
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		/*HttpSession session = request.getSession();
		System.out.println(session.getAttribute("admin"));
		if (session.getAttribute("admin") == null) {
			System.out.println("你来不来");
			response.sendRedirect("admin_login.jsp");
		}*/
		
	}
	
	//拦截后
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
