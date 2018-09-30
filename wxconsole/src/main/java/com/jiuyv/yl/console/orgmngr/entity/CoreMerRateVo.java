package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;

/**
 * 商户二维码费率表   TBL_CORE_MER_RATE
 * @author 
 *
 */
public class CoreMerRateVo {
	
	private String mid;//外部商户号(银联)
	private String payDesc;
	private String feeStlmType;
	private String payOrgCode;
	private String transMethod;
	private String payType;
	private Long merFee;
	private String merMaxFee;
	private String status;
	private String lastUptTime;
	private String lastUptAcct;
	private String createTime;
	private String createAcct;
	private String otherFee1;
	private String otherFee2;
	private String otherFee3;
	private String ext1;
	private String ext2;
	private String ext3;
	private String remark;
	private Long wechatPayRate ;
	
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPayDesc() {
		return payDesc;
	}
	public void setPayDesc(String payDesc) {
		this.payDesc = payDesc;
	}
	public String getFeeStlmType() {
		return feeStlmType;
	}
	public void setFeeStlmType(String feeStlmType) {
		this.feeStlmType = feeStlmType;
	}
	public String getPayOrgCode() {
		return payOrgCode;
	}
	public void setPayOrgCode(String payOrgCode) {
		this.payOrgCode = payOrgCode;
	}
	public String getTransMethod() {
		return transMethod;
	}
	public void setTransMethod(String transMethod) {
		this.transMethod = transMethod;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public Long getMerFee() {
		return merFee;
	}
	public void setMerFee(Long merFee) {
		this.merFee = merFee;
	}
	public String getMerMaxFee() {
		return merMaxFee;
	}
	public void setMerMaxFee(String merMaxFee) {
		this.merMaxFee = merMaxFee;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLastUptTime() {
		return lastUptTime;
	}
	public void setLastUptTime(String lastUptTime) {
		this.lastUptTime = lastUptTime;
	}
	public String getLastUptAcct() {
		return lastUptAcct;
	}
	public void setLastUptAcct(String lastUptAcct) {
		this.lastUptAcct = lastUptAcct;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateAcct() {
		return createAcct;
	}
	public void setCreateAcct(String createAcct) {
		this.createAcct = createAcct;
	}
	public String getOtherFee1() {
		return otherFee1;
	}
	public void setOtherFee1(String otherFee1) {
		this.otherFee1 = otherFee1;
	}
	public String getOtherFee2() {
		return otherFee2;
	}
	public void setOtherFee2(String otherFee2) {
		this.otherFee2 = otherFee2;
	}
	public String getOtherFee3() {
		return otherFee3;
	}
	public void setOtherFee3(String otherFee3) {
		this.otherFee3 = otherFee3;
	}
	public String getExt1() {
		return ext1;
	}
	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}
	public String getExt2() {
		return ext2;
	}
	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}
	public String getExt3() {
		return ext3;
	}
	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Long getWechatPayRate() {
		return wechatPayRate;
	}
	public void setWechatPayRate(Long wechatPayRate) {
		this.wechatPayRate = wechatPayRate;
	}
	
	
}
