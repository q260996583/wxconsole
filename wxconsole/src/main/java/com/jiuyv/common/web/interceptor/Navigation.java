package com.jiuyv.common.web.interceptor;

import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Navigation extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResourceCache resourceCache; 
	@Override
	public String intercept(ActionInvocation invoke) throws Exception {
//		String invokeName=invoke.getInvocationContext().getName();
//		invoke.getInvocationContext().getSession().put("navigate", "1");
//		if(resourceCache.getActionsource().get(invokeName)!=null){
//			
//			Resource current=resourceCache.getActionsource().get(invokeName);
//			String navigate="<a href='"+current.getResourceUrl()+"'>"+current.getResourceZh()+"</a>";
//			  while(!current.getFatherID().equals("ROLE_CONNECT")){
//				  System.out.println(resourceCache.getResources().get(current.getResourceID()).getResourceZh());
//				 
//				  current=resourceCache.getResources().get(current.getFatherID());
//			  }
//			  
//			  invoke.getInvocationContext().getSession().put("navigate", navigate);
//		}
//	
		return invoke.invoke();
	}
	public ResourceCache getResourceCache() {
		return resourceCache;
	}
	public void setResourceCache(ResourceCache resourceCache) {
		this.resourceCache = resourceCache;
	}

}
