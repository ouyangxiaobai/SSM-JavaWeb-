package com.szy.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("manager") == null){
			//未登录
			System.out.println("未登录拦截"+request.getRequestURI());
			String header = request.getHeader("X-Requested-With");
			if(header != null){
				if("XMLHttpRequest".equals(header.toString())){
					//是ajax请求
					Map<String,String> ret = new HashMap<String,String>();
					ret.put("type", "error");
					ret.put("msg", "登录信息失效，请刷新页面重新登录！");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(JSONObject.fromObject(ret).toString());
					return false;
				}
			}
			//不是ajax请求，进行重定向
			// 拦截后进入登录页面
			response.sendRedirect(request.getContextPath()+"/system/login");
			return false;
		}
		return true;
	}

}
