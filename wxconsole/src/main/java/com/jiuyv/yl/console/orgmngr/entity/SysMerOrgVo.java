package com.jiuyv.yl.console.orgmngr.entity;
/**
 * 商户服务商关系实体
 * @author Administrator
 *
 */
public class SysMerOrgVo {
	private Long version;
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
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
	public String getOrgTyep() {
		return orgTyep;
	}
	public void setOrgTyep(String orgTyep) {
		this.orgTyep = orgTyep;
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
	public String getSettleFlag() {
		return settleFlag;
	}
	public void setSettleFlag(String settleFlag) {
		this.settleFlag = settleFlag;
	}
	public String getFileFlag() {
		return fileFlag;
	}
	public void setFileFlag(String fileFlag) {
		this.fileFlag = fileFlag;
	}
	private String orgCode;
	private String fatherOrgCode;
	private String orgName;
	private String orgTyep;
	private String persName;
	private String persPhone;
	private String email;
	private String orgAddr;
	private String status;
	private String settleFlag;
	private String fileFlag;
	
	

	
	
	
	
	
	
	
}
