package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class BankVo  implements Serializable{

	private Long version;
	private String orgCode;
	private String faOrgCode;
	private String bankId;
	private String bankName;
	private String conType;
	private String binFlag;
	private String mcc;
	private Long feeRate;
	private String remark;
	private String lastUptTime;
	private String lastUptAcc;
	private String lastUptOrg;
	private String conTypeZh;
	
	private BigDecimal feeRateDcm;

	public BankVo()
	{

	}
	
	public BigDecimal getFeeRateDcm() {
			return feeRateDcm;
		}
	
		public void setFeeRateDcm(BigDecimal feeRateDcm) {
			this.feeRateDcm = feeRateDcm;
		}
	
	public void setVersion(Long version)
		{
			this.version = version;
		}
	public Long getVersion()
		{
			return this.version;
		}
	public void setOrgCode(String orgCode)
		{
			this.orgCode = orgCode;
		}
	public String getOrgCode()
		{
			return this.orgCode;
		}
	public void setBankId(String bankId)
		{
			this.bankId = bankId;
		}
	public String getBankId()
		{
			return this.bankId;
		}
	public void setBankName(String bankName)
		{
			this.bankName = bankName;
		}
	public String getBankName()
		{
			return this.bankName;
		}
	public void setBinFlag(String binFlag)
		{
			this.binFlag = binFlag;
		}
	public String getBinFlag()
		{
			return this.binFlag;
		}
	public void setMcc(String mcc)
		{
			this.mcc = mcc;
		}
	public String getMcc()
		{
			return this.mcc;
		}
	public void setFeeRate(Long feeRate)
		{
			this.feeRate = feeRate;
		}
	public Long getFeeRate()
		{
			return this.feeRate;
		}
	public void setRemark(String remark)
		{
			this.remark = remark;
		}
	public String getRemark()
		{
			return this.remark;
		}
	public void setLastUptTime(String lastUptTime)
		{
			this.lastUptTime = lastUptTime;
		}
	public String getLastUptTime()
		{
			return this.lastUptTime;
		}
	public void setLastUptAcc(String lastUptAcc)
		{
			this.lastUptAcc = lastUptAcc;
		}
	public String getLastUptAcc()
		{
			return this.lastUptAcc;
		}
	public void setLastUptOrg(String lastUptOrg)
		{
			this.lastUptOrg = lastUptOrg;
		}
	public String getLastUptOrg()
		{
			return this.lastUptOrg;
		}
	
	public String getFaOrgCode() {
		return faOrgCode;
	}
	
	public void setFaOrgCode(String faOrgCode) {
		this.faOrgCode = faOrgCode;
	}
	
	public String getConType() {
		return conType;
	}
	
	public void setConType(String conType) {
		this.conType = conType;
	}
	
	public String getConTypeZh() {
		return conTypeZh;
	}
	
	public void setConTypeZh(String conTypeZh) {
		this.conTypeZh = conTypeZh;
	}

	
}
