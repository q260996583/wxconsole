package com.jiuyv.yl.console.consoleoper.entity;

public class TblConsoleOprLogVo {
	
	private String stlmDate;
	private Long oprNo;
	private String resourceId;
	private String resourceZh;
	private String oprOrgCode;
	private String oprUserId;
	private String oprLoginId;
	private String oprUrl;
	private String oprSysCode;
	private String oprTime;
	private String oprIp;
	private String oprSuccess;
	private String oprResultInfo;
	private String oprRemark;
	private String oprNm;
	
	public String getOprNm() {
		return oprNm;
	}

	public void setOprNm(String oprNm) {
		this.oprNm = oprNm;
	}

	public TblConsoleOprLogVo()
	{

	}

	public void setStlmDate(String stlmDate)
	{
		this.stlmDate = stlmDate;
	}
	public String getStlmDate()
	{
		return this.stlmDate;
	}
	public void setOprNo(Long oprNo)
	{
		this.oprNo = oprNo;
	}
	public Long getOprNo()
	{
		return this.oprNo;
	}
	public void setResourceId(String resourceId)
	{
		this.resourceId = resourceId;
	}
	public String getResourceId()
	{
		return this.resourceId;
	}
	public void setResourceZh(String resourceZh)
	{
		this.resourceZh = resourceZh;
	}
	public String getResourceZh()
	{
		return this.resourceZh;
	}
	public void setOprOrgCode(String oprOrgCode)
	{
		this.oprOrgCode = oprOrgCode;
	}
	public String getOprOrgCode()
	{
		return this.oprOrgCode;
	}
	public void setOprUserId(String oprUserId)
	{
		this.oprUserId = oprUserId;
	}
	public String getOprUserId()
	{
		return this.oprUserId;
	}
	public void setOprLoginId(String oprLoginId)
	{
		this.oprLoginId = oprLoginId;
	}
	public String getOprLoginId()
	{
		return this.oprLoginId;
	}
	public void setOprUrl(String oprUrl)
	{
		this.oprUrl = oprUrl;
	}
	public String getOprUrl()
	{
		return this.oprUrl;
	}
	public void setOprSysCode(String oprSysCode)
	{
		this.oprSysCode = oprSysCode;
	}
	public String getOprSysCode()
	{
		return this.oprSysCode;
	}
	public void setOprTime(String oprTime)
	{
		this.oprTime = oprTime;
	}
	public String getOprTime()
	{
		return this.oprTime;
	}
	public void setOprIp(String oprIp)
	{
		this.oprIp = oprIp;
	}
	public String getOprIp()
	{
		return this.oprIp;
	}
	public void setOprSuccess(String oprSuccess)
	{
		this.oprSuccess = oprSuccess;
	}
	public String getOprSuccess()
	{
		return this.oprSuccess;
	}
	public void setOprResultInfo(String oprResultInfo)
	{
		this.oprResultInfo = oprResultInfo;
	}
	public String getOprResultInfo()
	{
		return this.oprResultInfo;
	}
	public void setOprRemark(String oprRemark)
	{
		this.oprRemark = oprRemark;
	}
	public String getOprRemark()
	{
		return this.oprRemark;
	}
}