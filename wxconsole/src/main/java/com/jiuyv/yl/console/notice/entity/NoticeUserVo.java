package com.jiuyv.yl.console.notice.entity;

public class NoticeUserVo {
	
	/** 用户编号 */
	private String userId;
	
	/** 用户名称 */
	private String userName;
	
	/** 用户上级 */
	private String fatherCode;
	
	/** 类型 */
	private String type;

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the fatherCode
	 */
	public String getFatherCode() {
		return fatherCode;
	}

	/**
	 * @param fatherCode the fatherCode to set
	 */
	public void setFatherCode(String fatherCode) {
		this.fatherCode = fatherCode;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	
}
