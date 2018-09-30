package com.jiuyv.common.web.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.ApplicationInfo;
import com.jiuyv.common.web.interceptor.util.DBLogUtil;
import com.jiuyv.yl.console.common.dao.IOprlogDao;
import com.jiuyv.yl.console.security.entity.LogInfo;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;

/**
 * 用于往数据库记录系统日志。
 * 
 * 
 */
public class DBLogInterceptor extends AbstractInterceptor {
	
	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(DBLogInterceptor.class);


	public IOprlogDao getOprlogDao() {
		return oprlogDao;
	}

	public void setOprlogDao(IOprlogDao oprlogDao) {
		this.oprlogDao = oprlogDao;
	}

	/** The oprlog dao. */
	private IOprlogDao oprlogDao;

	
	/** The resource cache. */
	private ResourceCache resourceCache; 
	
	/**
	 * Sets the resource cache.
	 * 
	 * @param resourceCache the new resource cache
	 */
	public void setResourceCache(ResourceCache resourceCache) {
		this.resourceCache = resourceCache;
	}

	/**
	 * Sets the oprlog dao.
	 * 
	 * @param oprlogDao the new oprlog dao
	 */
	

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// 判断是否需要进行日志记录 这个值在此次请求中不会改变
		final boolean needLog = DBLogUtil.needLogInDB(resourceCache);
		
		if ( needLog ) {
			// get current value for operate sequence
			Long oprNo = oprlogDao.getCurrentSequence();
			LogInfo logInfo = new LogInfo();
			logInfo.setOprNo(oprNo);
			// set log information into ThreadLocal object. 
			ApplicationInfo.setLogInfo(logInfo);		
		}
		
		// 添加记录日志的监听器
		invocation.addPreResultListener(new PreResultListener() {
			public void beforeResult(ActionInvocation invocation, String action) {
				// return when not need to log
				if ( !needLog ) {
					LOGGER.info("Not record any log in database.");
					return ;
				}
				// the last action in the chain
				if ( !DBLogUtil.isForward2Page(action) ) {
					LOGGER.info("Not record current action in the whole action chain.");
					return ;
				}
				HttpServletRequest request = ServletActionContext.getRequest();
				// get resource
				String actionUrl = request.getServletPath().replaceFirst("/", "");
				Map<String, Resource> resMap = resourceCache.getLogresource();
				Resource resource = resMap.get(actionUrl);
				// get exception message
				String exception = (String) request.getAttribute("exception");
				// record log in database
				DBLogUtil.recordCurrentLogInDB(oprlogDao, DBLogUtil.generateLog(
						resource.getResourceID(), resource.getResourceZh(), exception, null));
			}
		});
		// invoke action chain
		return invocation.invoke();
	}

}
