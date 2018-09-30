package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 
 * 
 */
@Deprecated
public class ChannelVo  implements Serializable{

	private Long version;
	private String channelCode;
	private String channelName;
	private String channelType;
	private Long profitRate;
	private Long brandFeeRate;
	private String contactName;
	private String contactPhone;
	private String oprTime;
	private String oprAcc;
	private String status;
	private String channelStatusZh;
	private String confStatus;
	private String confStatusZh;
	private String remark;
	private String lastUptTime;
	private String lastUptAcc;
	private String lastUptOrg;
	private BigDecimal profitRateDcm;
	private BigDecimal brandFeeRateDcm;
	private String liquidateFlag;//清算标识位
	
	public ChannelVo()
	{

	}
	
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
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
	public String getChannelType() {
		return channelType;
	}
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}
	public Long getProfitRate() {
		return profitRate;
	}
	public void setProfitRate(Long profitRate) {
		this.profitRate = profitRate;
	}
	public Long getBrandFeeRate() {
		return brandFeeRate;
	}
	public void setBrandFeeRate(Long brandFeeRate) {
		this.brandFeeRate = brandFeeRate;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getOprTime() {
		return oprTime;
	}
	public void setOprTime(String oprTime) {
		this.oprTime = oprTime;
	}
	public String getOprAcc() {
		return oprAcc;
	}
	public void setOprAcc(String oprAcc) {
		this.oprAcc = oprAcc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getChannelStatusZh() {
		return channelStatusZh;
	}
	public void setChannelStatusZh(String channelStatusZh) {
		this.channelStatusZh = channelStatusZh;
	}
	public String getConfStatus() {
		return confStatus;
	}
	public void setConfStatus(String confStatus) {
		this.confStatus = confStatus;
	}
	public String getConfStatusZh() {
		return confStatusZh;
	}
	public void setConfStatusZh(String confStatusZh) {
		this.confStatusZh = confStatusZh;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLastUptTime() {
		return lastUptTime;
	}
	public void setLastUptTime(String lastUptTime) {
		this.lastUptTime = lastUptTime;
	}
	public String getLastUptAcc() {
		return lastUptAcc;
	}
	public void setLastUptAcc(String lastUptAcc) {
		this.lastUptAcc = lastUptAcc;
	}
	public String getLastUptOrg() {
		return lastUptOrg;
	}
	public void setLastUptOrg(String lastUptOrg) {
		this.lastUptOrg = lastUptOrg;
	}

	public BigDecimal getProfitRateDcm() {
		return profitRateDcm;
	}

	public void setProfitRateDcm(BigDecimal profitRateDcm) {
		this.profitRateDcm = profitRateDcm;
	}

	public BigDecimal getBrandFeeRateDcm() {
		return brandFeeRateDcm;
	}

	public void setBrandFeeRateDcm(BigDecimal brandFeeRateDcm) {
		this.brandFeeRateDcm = brandFeeRateDcm;
	}

	public String getLiquidateFlag() {
		return liquidateFlag;
	}

	public void setLiquidateFlag(String liquidateFlag) {
		this.liquidateFlag = liquidateFlag;
	}
	
}
