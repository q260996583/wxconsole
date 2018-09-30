package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;

// TODO: Auto-generated Javadoc
/*
 * 可访问资源类，用于存放资源数据
 */
public class Resource implements Serializable {

	

	/** 资源 权限代码，形如role_id. */
	private String resourceID;

	/** 上级资源 id. */
	private String fatherID;

	/** 资源的中文描述/菜单名. */
	private String resourceZh;

	/** 资源的英文名. */
	private String resourceEn;

	/** 资源的系统代码. */
	private String sysCode;

	/** 资源的url. */
	private String resourceUrl;

	/** 排序号 */
	private String orderNum;

	/** 是否记录日志 */
	private String logFlag;
	/** 资源类型 菜单或按钮. */
	private String showType;

	/** 备注. */
	private String remarks;

	/**
	 * Gets the resource id.
	 * 
	 * @return the resource id
	 */
	public String getResourceID() {
		return resourceID;
	}

	/**
	 * Sets the resource id.
	 * 
	 * @param resourceID
	 *            the new resource id
	 */
	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
	}

	/**
	 * Gets the father id.
	 * 
	 * @return the father id
	 */
	public String getFatherID() {
		return fatherID;
	}

	/**
	 * Sets the father id.
	 * 
	 * @param fatherID
	 *            the new father id
	 */
	public void setFatherID(String fatherID) {
		this.fatherID = fatherID;
	}

	/**
	 * Gets the resource zh.
	 * 
	 * @return the resource zh
	 */
	public String getResourceZh() {
		return resourceZh;
	}

	/**
	 * Sets the resource zh.
	 * 
	 * @param resourceZh
	 *            the new resource zh
	 */
	public void setResourceZh(String resourceZh) {
		this.resourceZh = resourceZh;
	}

	/**
	 * Gets the resource en.
	 * 
	 * @return the resource en
	 */
	public String getResourceEn() {
		return resourceEn;
	}

	/**
	 * Sets the resource en.
	 * 
	 * @param resourceEn
	 *            the new resource en
	 */
	public void setResourceEn(String resourceEn) {
		this.resourceEn = resourceEn;
	}

	/**
	 * Gets the sys code.
	 * 
	 * @return the sys code
	 */
	public String getSysCode() {
		return sysCode;
	}

	/**
	 * Sets the sys code.
	 * 
	 * @param sysCode
	 *            the new sys code
	 */
	public void setSysCode(String sysCode) {
		this.sysCode = sysCode;
	}

	/**
	 * Gets the resource url.
	 * 
	 * @return the resource url
	 */
	public String getResourceUrl() {
		return resourceUrl;
	}

	/**
	 * Sets the resource url.
	 * 
	 * @param resourceUrl
	 *            the new resource url
	 */
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	/**
	 * Gets the show type.
	 * 
	 * @return the show type
	 */
	public String getShowType() {
		return showType;
	}

	/**
	 * Sets the show type.
	 * 
	 * @param showType
	 *            the new show type
	 */
	public void setShowType(String showType) {
		this.showType = showType;
	}

	/**
	 * Gets the remarks.
	 * 
	 * @return the remarks
	 */
	public String getRemarks() {
		return remarks;
	}

	/**
	 * Sets the remarks.
	 * 
	 * @param remarks
	 *            the new remarks
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getLogFlag() {
		return logFlag;
	}

	public void setLogFlag(String logFlag) {
		this.logFlag = logFlag;
	}

	
	
}
