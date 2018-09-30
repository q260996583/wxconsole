package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;
import java.util.List;

public class TblSysOrgInfoVo  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String version;
	private String orgCode;
	private String fatherOrgCode;
	private String orgName;
	private String orgType;
	private String persName;
	private String persPhone;
	private String email;
	private String orgAddr;
	private String status;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getFatherOrgCode() {
		return fatherOrgCode;
	}
	public void setFatherOrgCode(String fatherOrgCode) {
		this.fatherOrgCode = fatherOrgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public String getPersName() {
		return persName;
	}
	public void setPersName(String persName) {
		this.persName = persName;
	}
	public String getPersPhone() {
		return persPhone;
	}
	public void setPersPhone(String persPhone) {
		this.persPhone = persPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrgAddr() {
		return orgAddr;
	}
	public void setOrgAddr(String orgAddr) {
		this.orgAddr = orgAddr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
