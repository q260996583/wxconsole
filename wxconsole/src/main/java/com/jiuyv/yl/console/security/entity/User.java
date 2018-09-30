package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;
import java.util.List;




/**
 * The Class User.
 */
public class User implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 用户id. */
	private String oprId;
	/** 登陆名. */
	private String loginNm;
	/** 真是姓名. */
	private String opName;
	/** 状态. */
	private String status;
	/** 登陆密码. */
	private String password;
	private String certTypeNo;
	private String certNo;
	private String phone;
	private String mobile;
	private String email;
	private String description;
	private String createTm;
	private String createOprid;
	private String lastModTm;
	private String lastModOprid;
	private String misc;
	private String orgCode;
	private String lastUpdOpid;
	private String lastUpdTranscode;
	private String lastUpdTm;
	private String reserved1;
	private String reserved2;
	
	private String orgName;
	
	private Integer falseTime;

	private String passwdExpireTime;

	private String loginTime;
	
	private String groupNo;
	
	private String groupNoDesc;
	
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/** 机构下属机构代码数组. */
	private List<String> childOrgCodes;

	public String getOprId() {
		return oprId;
	}

	public void setOprId(String oprId) {
		this.oprId = oprId;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getLoginNm() {
		return loginNm;
	}

	public void setLoginNm(String loginNm) {
		this.loginNm = loginNm;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCertTypeNo() {
		return certTypeNo;
	}

	public void setCertTypeNo(String certTypeNo) {
		this.certTypeNo = certTypeNo;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTm() {
		return createTm;
	}

	public void setCreateTm(String createTm) {
		this.createTm = createTm;
	}

	public String getLastModTm() {
		return lastModTm;
	}

	public void setLastModTm(String lastModTm) {
		this.lastModTm = lastModTm;
	}

	public String getLastModOprid() {
		return lastModOprid;
	}

	public void setLastModOprid(String lastModOprid) {
		this.lastModOprid = lastModOprid;
	}

	public String getMisc() {
		return misc;
	}

	public void setMisc(String misc) {
		this.misc = misc;
	}

	public String getLastUpdOpid() {
		return lastUpdOpid;
	}

	public void setLastUpdOpid(String lastUpdOpid) {
		this.lastUpdOpid = lastUpdOpid;
	}

	public String getLastUpdTranscode() {
		return lastUpdTranscode;
	}

	public void setLastUpdTranscode(String lastUpdTranscode) {
		this.lastUpdTranscode = lastUpdTranscode;
	}

	public String getLastUpdTm() {
		return lastUpdTm;
	}

	public void setLastUpdTm(String lastUpdTm) {
		this.lastUpdTm = lastUpdTm;
	}

	public String getReserved1() {
		return reserved1;
	}

	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}

	public String getReserved2() {
		return reserved2;
	}

	public void setReserved2(String reserved2) {
		this.reserved2 = reserved2;
	}

	public String getCreateOprid() {
		return createOprid;
	}

	public void setCreateOprid(String createOprid) {
		this.createOprid = createOprid;
	}

	public List<String> getChildOrgCodes() {
		return childOrgCodes;
	}

	public void setChildOrgCodes(List<String> childOrgCodes) {
		this.childOrgCodes = childOrgCodes;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getFalseTime() {
		return falseTime;
	}

	public void setFalseTime(Integer falseTime) {
		this.falseTime = falseTime;
	}

	public String getPasswdExpireTime() {
		return passwdExpireTime;
	}

	public void setPasswdExpireTime(String passwdExpireTime) {
		this.passwdExpireTime = passwdExpireTime;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	/**
	 * @return the groupNo
	 */
	public String getGroupNo() {
		return groupNo;
	}

	/**
	 * @param groupNo the groupNo to set
	 */
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	/**
	 * @return the groupNoDesc
	 */
	public String getGroupNoDesc() {
		return groupNoDesc;
	}

	/**
	 * @param groupNoDesc the groupNoDesc to set
	 */
	public void setGroupNoDesc(String groupNoDesc) {
		this.groupNoDesc = groupNoDesc;
	}
	
}
