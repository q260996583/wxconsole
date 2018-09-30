package com.jiuyv.common.web.xss;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
	
	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	/**
	 * 覆盖getParameter方法，将参数名和参数值都做xss过滤
	 * 如果需要获得原始的值，则通过super.getParameterValues(name)来获取
	 * getParameterNames,getParameterValues和getParameterMap也可能需要覆盖
	 */
	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		if (value != null) {
			value = JsoupUtil.filterUserInputContent(value);
		}
		return value;
	}

	/**
     * @return
     */
    public Map getParameterMap() {

        HashMap paramMap = (HashMap) super.getParameterMap();
        paramMap = (HashMap) paramMap.clone();

        for (Iterator iterator = paramMap.entrySet().iterator(); iterator.hasNext(); ) {
            Map.Entry entry = (Map.Entry) iterator.next();
            String [] values = (String[])entry.getValue();
            for (int i = 0; i < values.length; i++) {
                if(values[i] instanceof String){
                    values[i] = JsoupUtil.filterUserInputContent(values[i]);
                }
            }
            entry.setValue(values);
        }
        return paramMap;
    }
	
	@Override
	public String getHeader(String name) {
		return super.getHeader(name);
	}
}
