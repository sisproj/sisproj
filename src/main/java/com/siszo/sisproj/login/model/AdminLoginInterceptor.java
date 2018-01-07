package com.siszo.sisproj.login.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.siszo.sisproj.employee.model.EmployeeVO;

@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger
	=LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		logger.info("뷰 생성해서 응답 후 실행-afterCompletion");
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		logger.info("컨트롤러 수행 후 실행-postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2) throws Exception {
		logger.info("컨트롤러 수행전 실행-preHandle");
		
		EmployeeVO empVo= (EmployeeVO)request.getSession().getAttribute("empVo");
		logger.info("관리자 인터셉터 empVo={}",empVo);
		if(empVo==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			out.println("<script>alert('먼저 로그인하세요');");
			out.println("location.href='"+request.getContextPath() 
				+ "/login/login.do';</script>");
			
			return false; //다음 컨트롤러를 수행하지 않고 요청 종료
		} else {
			if(!empVo.getEmpLev().equals("관리자")) {

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out =response.getWriter();
				out.println("<script>alert('관리자가 아닙니다!');");
				out.println("location.href='"+request.getContextPath() 
					+ "/home.do';</script>");
				
				return false; //다음 컨트롤러를 수행하지 않고 요청 종료
			}
		}
		
		return true;  //다음 컨트롤러를 실행
	}	
}





