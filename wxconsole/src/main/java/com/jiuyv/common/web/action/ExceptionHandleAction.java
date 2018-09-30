package com.jiuyv.common.web.action;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * Exception process action.
 * 
 * @author 
 *
 */
public class ExceptionHandleAction extends DefaultPageSupportAction {

	private static final Logger LOGGER = LoggerFactory.getLogger(ExceptionHandleAction.class);
	
	/**
	 * 目标结果 ajax请求
	 */
	private static final String ERR_AJAX = "errAjax";

	/**
	 * 目标结果 页面请求
	 */
	private static final String ERR_PAGE = "errPage";

	/**
	 * 对异常出错信息进行转发
	 * 
	 * @return
	 */
	public String exceptionForward() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String uri = request.getRequestURI();
		if (WebRequestUtil.isAjax(null)
				|| StringUtils.containsIgnoreCase(uri, "uploadFile")
        		|| StringUtils.containsIgnoreCase(uri, "uploadImage")
        		|| StringUtils.containsIgnoreCase(uri, "uploadAttachImg")
        		|| StringUtils.containsIgnoreCase(uri, "uploadAttachFile")) {
			return ERR_AJAX;
		}
		// reset the system error message

		Object jsonStr = (Object) request.getAttribute("exception");
		if (jsonStr != null) {
			if (jsonStr instanceof Exception) {
				Exception e = (Exception) jsonStr;
				LOGGER.error("", e);
			}
			JSONObject jsonObj = JSONObject.fromObject(jsonStr);
			request.setAttribute("exceptionMsg", jsonObj.get("syserr"));
		}

		return ERR_PAGE;
	}

}
