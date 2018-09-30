package com.jiuyv.common.web.xss;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 
 * @author 
 *
 */
public class XssFilter implements Filter {

	private static Logger LOGGER = LoggerFactory.getLogger(XssFilter.class);
	
	private static Set<String> excludePath = new HashSet<String>();
	
	static {
		excludePath.add("/doInsertNoticeInfo.action");
		excludePath.add("/doUpdateNoticeInfo.action");
		excludePath.add("/doInsertConsoleNoticeInfo.action");
		excludePath.add("/doUpdateConsoleNoticeInfo.action");
	}
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(  
				(HttpServletRequest) request);  
		//xssRequest.getParameterMap();
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String servletPath = httpRequest.getServletPath();
		LOGGER.info("Request Path: " + servletPath);
		if ( excludePath.contains(servletPath) ) {
			chain.doFilter(request, response);
		} else {
			chain.doFilter(xssRequest, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
