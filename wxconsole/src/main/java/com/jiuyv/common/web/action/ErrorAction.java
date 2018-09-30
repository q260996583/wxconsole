package com.jiuyv.common.web.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jiuyv.common.ibatis.vo.ExtData;

/**
 * 根据判断是否ajax请求返回错误页面或错误的json串
 */
public class ErrorAction extends DefaultPageSupportAction {
	private static final String XMLHTTP_REQUEST = "XMLHttpRequest";


	

	private boolean isajax() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestedWith = request.getHeader("x-requested-with");
		// 根据是否有jsonObject 和Filters 或者header头部信息来判别是否ajax请求
		if ((request.getParameter("jsonObject") == null && getFilters() == null)
				|| XMLHTTP_REQUEST.equals(requestedWith)) {
			return true;
		}
		return false;
	}

	public String sessionkickoff() throws Exception {

		if (!isajax()) {
			return ERROR;
		}

		ExtData tempextdata = new ExtData();
		tempextdata.setSuccess(false);
		tempextdata.setSyserr(getText("prompt.sessionExpired"));
		setResData(tempextdata);

		return SUCCESS;
	}

	public String logfail() throws Exception {
		if (!isajax()) {
			
			return ERROR;
		}
		ExtData tempextdata = new ExtData();
		tempextdata.setSuccess(false);
		tempextdata.setSyserr(getText("prompt.sessionfail"));
		setResData(tempextdata);
		
		return SUCCESS;
	}
	
	public String dealException() throws Exception{
		if (!isajax()) {
			return ERROR;
		}
		return SUCCESS;
	}
}
