package com.jiuyv.yl.console.security.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.ui.AbstractProcessingFilter;
import org.springframework.security.ui.SpringSecurityFilter;
import org.springframework.security.ui.savedrequest.SavedRequest;
import org.springframework.security.util.PortResolver;
import org.springframework.security.util.PortResolverImpl;

import com.jiuyv.common.exception.SessionTimeoutException;

public class SessionTimeoutFilter extends SpringSecurityFilter {
	private PortResolver portResolver = new PortResolverImpl();
    private String sessionTimeoutUrl;

    public void doFilterHttp(HttpServletRequest request,
        HttpServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        if (this.isSessionExpired(request)) {
            this.processRequest(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    protected String determineSessionTimeoutUrl(HttpServletRequest request) {
        return (sessionTimeoutUrl != null) ? sessionTimeoutUrl
                                           : "/sessionExpired.jsp";
    }

    protected boolean isSessionExpired(HttpServletRequest request) {
    	
    	System.out.println(request.getRequestURL());

    	//System.out.println(request.getRequestedSessionId());
    	//System.out.println(!request.isRequestedSessionIdValid());
    	boolean a =(request.getRequestedSessionId()!= null)&& !request.isRequestedSessionIdValid();
    	System.out.println(a);
        return a;
    }

    protected void processRequest(HttpServletRequest request,
        HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        SavedRequest savedRequest = new SavedRequest(request, portResolver);
        session.setAttribute(AbstractProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY,
            new SessionTimeoutException());
        session.setAttribute(AbstractProcessingFilter.SPRING_SECURITY_SAVED_REQUEST_KEY,
            savedRequest);

        String targetUrl = determineSessionTimeoutUrl(request);

        targetUrl = request.getContextPath() + targetUrl;
        response.sendRedirect(response.encodeRedirectURL(targetUrl));
    }

	@Override
	public int getOrder() {
		// TODO Auto-generated method stub
		return 0;
	}

}
