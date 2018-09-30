package com.jiuyv.yl.console.security.filter;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.security.ConfigAttributeDefinition;
import org.springframework.security.ConfigAttributeEditor;
import org.springframework.security.intercept.web.DefaultFilterInvocationDefinitionSource;
import org.springframework.security.intercept.web.FilterInvocationDefinitionSource;
import org.springframework.security.intercept.web.RequestKey;
import org.springframework.security.util.AntUrlPathMatcher;
import org.springframework.security.util.UrlMatcher;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.yl.console.security.entity.Resource;

public class FilterInvocationDefinitionSourceFactoryBean implements FactoryBean {

	private static final Logger LOGGER = LoggerFactory.getLogger(FilterInvocationDefinitionSourceFactoryBean.class);
	
	// 严格校验，未配制的url也不允许访问，默认为false不校验
	private boolean strictUrl = false;
	private SqlMapClient sqlmapclient = null;
	private String statementid = null;

	public boolean isStrictUrl() {
		return strictUrl;
	}

	public void setStrictUrl(boolean strictUrl) {
		this.strictUrl = strictUrl;
	}

	public Object getObject() throws Exception {
		
		return new DefaultFilterInvocationDefinitionSource(
				this.getUrlMatcher(), this.buildRequestMap());
	}

	public Class getObjectType() {
		return FilterInvocationDefinitionSource.class;
	}

	public boolean isSingleton() {
		return true;
	}

	protected Map<String, String> findResources() {
		List<Resource> resourceList = null;
		try {
			// 获得所有资源角色列表
			resourceList = sqlmapclient.queryForList(statementid);

		} catch (Exception e) {
			LOGGER.error("", e);
		}

		Map<String, String> resourceMap = new LinkedHashMap<String, String>();

		if (resourceList == null) {
			return new LinkedHashMap<String, String>();
		}
		for (Resource resource : resourceList) {
			// 考虑url配置是用,分割的
			String[] resourceUrls = resource.getResourceUrl().split(",");

			if (resourceUrls != null) {
				for (int i = 0; i < resourceUrls.length; i++) {
					String resourceUrl = resourceUrls[i];
					if (resourceUrl != null && !resourceUrl.equals("")
							&& resourceUrl.charAt(0) != '/') {
						resourceUrl = "/" + resourceUrl;

					}
					String rolesCode = resource.getResourceID().toUpperCase();

					if (resourceMap.containsKey(resourceUrl)) {
						String value = resourceMap.get(resourceUrl);
						resourceMap.put(resourceUrl, value + "," + rolesCode);
					} else {
						resourceMap.put(resourceUrl, rolesCode);
					}
				}
			}
		}
		// 严格校验
		if (strictUrl == true) {
			String resourceUrl = "/**";
			String rolesCode = "ROLE_-1XYZ";
			resourceMap.put(resourceUrl, rolesCode);
		}

		return resourceMap;
	}

	protected LinkedHashMap<RequestKey, ConfigAttributeDefinition> buildRequestMap() {
		LinkedHashMap<RequestKey, ConfigAttributeDefinition> requestMap = null;
		requestMap = new LinkedHashMap<RequestKey, ConfigAttributeDefinition>();

		ConfigAttributeEditor editor = new ConfigAttributeEditor();

		Map<String, String> resourceMap = this.findResources();

		if (resourceMap == null) {
			return new LinkedHashMap<RequestKey, ConfigAttributeDefinition>();
		}
		for (Map.Entry<String, String> entry : resourceMap.entrySet()) {
			RequestKey key = new RequestKey(entry.getKey(), null);
			editor.setAsText(entry.getValue());
			requestMap.put(key, (ConfigAttributeDefinition) editor.getValue());
		}

		return requestMap;
	}

	protected UrlMatcher getUrlMatcher() {
		return new AntUrlPathMatcher();
	}

	public SqlMapClient getSqlmapclient() {
		return sqlmapclient;
	}

	public void setSqlmapclient(SqlMapClient sqlmapclient) {
		this.sqlmapclient = sqlmapclient;
	}

	public String getStatementid() {
		return statementid;
	}

	public void setStatementid(String statementid) {
		this.statementid = statementid;
	}

}
