package com.jiuyv.common.web.softkb;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * The Class SoftkbDecodeFilter.
 *
 * @author 
 * @version 1.0.0
 * @since 2016-6-24
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public class SoftkbDecodeFilter implements Filter {

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(SoftkbDecodeFilter.class);
	
	/** The passwd field. */
	private String passwdField = "j_password";
	
	/** The input passwd field. */
	private String inputPasswdField = "skb_password";
	
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		ParameterRequestWrapper paramReq = new ParameterRequestWrapper((HttpServletRequest)request);
		String target = request.getParameter("target");
		String passwdIndex = StringUtils.trim(paramReq.getParameter(inputPasswdField));
		LOGGER.info("Reveived passwd index: " + passwdIndex);
		int piLen = StringUtils.length(passwdIndex);
		// get codemap in session
		Map<String, String> codeMap = (Map<String, String>) paramReq.getSession().getAttribute(SoftkbImage.SESSION_CODEMAP);
		if ( codeMap != null &&  piLen > 0 ) {
			StringBuilder passwdBuf = new StringBuilder();
			// decode input Password with code map
			String[] indexes = passwdIndex.split(",");
			for (String index: indexes) {
				String txt = codeMap.get(index);
				if ( StringUtils.isNotBlank(txt) ) {
					passwdBuf.append(txt);
				}
			}
			paramReq.addParameter(passwdField, passwdBuf.toString());
		} else {
			paramReq.addParameter(passwdField, "");
			LOGGER.error("CodeMap is null or password index length invalidate. indexLength:" + piLen );
		}
		request.getRequestDispatcher(StringUtils.defaultString(target, "j_spring_security_check")).forward(paramReq, response);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {

	}

}
