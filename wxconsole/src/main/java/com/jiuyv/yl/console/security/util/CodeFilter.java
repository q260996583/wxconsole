package com.jiuyv.yl.console.security.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.jiuyv.common.exception.BussnissException;
//import com.jiuyv.yl.console.consoleoper.action.PhoCheCodeUtil;
import com.jiuyv.yl.console.consoleoper.service.inter.IConsoleOperService;

public class CodeFilter extends HttpServlet implements Filter {
/**
* 判断用户输入的验证码是否正确
*/
private static final long serialVersionUID = -5838154525730151323L;

public void init(FilterConfig config) throws ServletException {
}

public void setService(IConsoleOperService service) {
	this.service = service;
}

//wxb
private IConsoleOperService service;
public void destroy() {
}

public void doFilter(ServletRequest servletRequest,
    ServletResponse servletResponse, FilterChain filterChain)
    throws IOException, ServletException {
	
   HttpServletRequest request = (HttpServletRequest) servletRequest;
   HttpServletResponse response = (HttpServletResponse) servletResponse;
   String code = request.getParameter("j_code");
   //wxb
   String phoCheCode = request.getParameter("phoCheCode");
   String loginNm=request.getParameter("j_username");
//   String phoneNo = null;
//	   try {
		//phoneNo = service.getPhoneNoByLogNm(loginNm);
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
      
//   Cookie[] cookie = request.getCookies();
//   String codes = "";
//   for (int i = 0; cookie != null && i < cookie.length; i++) {
//    if ("codes".equals(cookie[i].getName())) {
//     codes = cookie[i].getValue();
//    }
//   }
   String codes=(String)((HttpServletRequest)servletRequest).getSession().getAttribute("SIMPLE_CAPCHA_SESSION_KEY");
   if (!"".equals(codes) && codes != null) {
	   if (code.equalsIgnoreCase(codes)) {
		   //wxb
//		   if("888888".equals(phoCheCode)){
		   filterChain.doFilter(request, response);  
//		   }
//		   else if(phoneNo!=null){		
//			   String[] keys = { "PLATFORM", "TYPE", "MOBILE","VERIFYCODE" };
//			   String[] params = { "SX_POS_MANAGEMENT", "IDENTIFY_CODE", phoneNo,phoCheCode};
//			   String checkService="RequestIdentifyVerify";
//			   String respString = PhoCheCodeUtil.build(keys, params, checkService);
//			   if(!org.apache.commons.lang3.StringUtils.isEmpty(respString)){
//		       		if(respString.contains("\"verifyStatus\":\"S\"")){
//		       			filterChain.doFilter(request, response);  			
//		       		}else{
//		       	 	response.sendRedirect("login.jsp?login_error=3");
//		       		}		  
//		       }			  
//	   }
	   } else {
		   response.sendRedirect("login.jsp?login_error=2");
	   }
   } else {
    response.sendRedirect("login.jsp?login_error=2");
   }
   
   
   
	}
}