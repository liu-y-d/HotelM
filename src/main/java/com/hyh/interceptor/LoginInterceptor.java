package com.hyh.interceptor;

import com.hyh.pojo.AdminInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName LoginInterceptor
 * @Description TODO
 * @Author Liuyunda
 * @Date 2020/2/24 13:38
 **/
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
		AdminInfo adminInfo = (AdminInfo) httpServletRequest.getSession().getAttribute("adminInfo");
		if (adminInfo !=null){
			// 登录成功
			return true;
		}else {
			httpServletRequest.setAttribute("LoginError", "请先登录！");
			httpServletRequest.getRequestDispatcher("/").forward(httpServletRequest,httpServletResponse);
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

	}
}
