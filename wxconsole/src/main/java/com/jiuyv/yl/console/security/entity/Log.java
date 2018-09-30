package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;

public class Log implements Serializable {

	private String logID;
	private String userID;
	private String resourceID;
	private String isSucc;
	private String accessDate;
	
	//辅助字段
	private String loginID;
	private String resourceZh;
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getResourceZh() {
		return resourceZh;
	}
	public void setResourceZh(String resourceZh) {
		this.resourceZh = resourceZh;
	}
	public String getLogID() {
		return logID;
	}
	public void setLogID(String logID) {
		this.logID = logID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getResourceID() {
		return resourceID;
	}
	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
	}
	public String getIsSucc() {
		return isSucc;
	}
	public void setIsSucc(String isSucc) {
		this.isSucc = isSucc;
	}
	public String getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}
	
}
