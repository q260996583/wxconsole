package com.jiuyv.yl.console.security.entity;



public class PassWordVo {
	
	private String userID;
	
	private String oldPasswd;
	
	
	private String newPasswd;
	
	
	private String confirmPasswd;
	
	public String getOldPasswd() {
		return oldPasswd;
	}
	public void setOldPasswd(String oldPasswd) {
		this.oldPasswd = oldPasswd;
	}
	public String getNewPasswd() {
		return newPasswd;
	}
	public void setNewPasswd(String newPasswd) {
		this.newPasswd = newPasswd;
	}
	public String getConfirmPasswd() {
		return confirmPasswd;
	}
	public void setConfirmPasswd(String confirmPasswd) {
		this.confirmPasswd = confirmPasswd;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
		
}
