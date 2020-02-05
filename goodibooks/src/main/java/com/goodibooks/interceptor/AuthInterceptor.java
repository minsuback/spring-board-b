package com.goodibooks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//public class AuthInterceptor implements HandlerInterceptor {
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	// Controller 실행(호출) 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();
		//System.out.println("in interceptor : " + request.getRequestURI());
		
		HttpSession session = request.getSession();

		if(uri.contains("/account/") || uri.contains("/board/") || uri.contains("/book/") || uri.contains("/mypage/") ) {
			if(session.getAttribute("loginuser") == null) {
				response.sendRedirect("/goodibooks/account/login.action");
				return false;
			}
		}
		
		return true;						// true : controller 로 요청을 전달하세염
		//return false;						// false : controller 로 요청을 전달하지 마세염
	}
	
	// Controller 실행 (호출) 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}
	
	// 요청 처리 후 ( view 처리 후 )
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
	}

}
