package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;
import java.util.Map;

public class ResourceCache implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4941199463630902206L;
	
	private Map<String, Resource> resources = null;
	private Map<String, Resource> logresource = null;
	private Map<String, Resource> actionsource = null;

	public Map<String, Resource> getResources() {
		return resources;
	}

	public void setResources(Map<String, Resource> resources) {
		this.resources = resources;
	}

	public Map<String, Resource> getLogresource() {
		return logresource;
	}

	public void setLogresource(Map<String, Resource> logresource) {
		this.logresource = logresource;
	}

	public Map<String, Resource> getActionsource() {
		return actionsource;
	}

	public void setActionsource(Map<String, Resource> actionsource) {
		this.actionsource = actionsource;
	}

}
