package com.jiuyv.yl.console.orgmngr.entity;

public class MerChannelVo {	
	private long version ;
	private String channelCode ;
	private String channelName ;
	private String opTime ;
	private String opAcc;
	private String status ;
	private String remark ;
	private String luTime ;
	private String luOrg ;
	private String fatherId ;
	private String phone ;
	private String person ;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	

	
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getOpTime() {
		return opTime;
	}
	public void setOpTime(String opTime) {
		this.opTime = opTime;
	}
	public String getOpAcc() {
		return opAcc;
	}
	public void setOpAcc(String opAcc) {
		this.opAcc = opAcc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLuTime() {
		return luTime;
	}
	public void setLuTime(String luTime) {
		this.luTime = luTime;
	}
	public String getLuOrg() {
		return luOrg;
	}
	public void setLuOrg(String luOrg) {
		this.luOrg = luOrg;
	}
	public String getFatherId() {
		return fatherId;
	}
	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}
}
