/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.common;

/**
 * 
 * @author simons.xiao
 * @version $Id: PaidRequest.java, v 0.1 2017年1月10日 下午2:03:47 simons.xiao Exp $
 */

public class PaidRequest {
    private String instId;
    /**机构交易号**/
    private String instTransId;
    /**机构交易日期**/
    private String instTransDate;
    private String instTransTime;
    /**机构代付交易号**/
    private String instTradeId;
    /**机构代付日期**/
    private String instTradeDate;
    private String instTradeTime;
    /**交易金额**/
    private String tradeAmount;
    /**代付方式**/
    private String payType;
    /**币种**/
    private String curType;
    /**商户号**/
    private String userCode;
    /**银行账号 **/
    private String bankAccount;
    /**银行编号**/
    private String bankCode;
    /**戶名**/
    private String bankAccountName;
    /**对公对私标识**/
    private String publicAndPrivateFlag;
    /**省份**/
    private String province;
    /**地区**/
    private String area;
    /**支行名**/
    private String branchName;
    /**联行号**/
    private String branchCode;
    /**手机号userPhone **/
    private String phoneNumber;
    /**备注**/
    private String remark;
    
    
    
	public String getInstId() {
		return instId;
	}
	public void setInstId(String instId) {
		this.instId = instId;
	}
	public String getInstTransId() {
		return instTransId;
	}
	public void setInstTransId(String instTransId) {
		this.instTransId = instTransId;
	}
	public String getInstTransDate() {
		return instTransDate;
	}
	public void setInstTransDate(String instTransDate) {
		this.instTransDate = instTransDate;
	}
	public String getInstTransTime() {
		return instTransTime;
	}
	public void setInstTransTime(String instTransTime) {
		this.instTransTime = instTransTime;
	}
	public String getInstTradeId() {
		return instTradeId;
	}
	public void setInstTradeId(String instTradeId) {
		this.instTradeId = instTradeId;
	}
	public String getInstTradeDate() {
		return instTradeDate;
	}
	public void setInstTradeDate(String instTradeDate) {
		this.instTradeDate = instTradeDate;
	}
	public String getInstTradeTime() {
		return instTradeTime;
	}
	public void setInstTradeTime(String instTradeTime) {
		this.instTradeTime = instTradeTime;
	}
	public String getTradeAmount() {
		return tradeAmount;
	}
	public void setTradeAmount(String tradeAmount) {
		this.tradeAmount = tradeAmount;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getCurType() {
		return curType;
	}
	public void setCurType(String curType) {
		this.curType = curType;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankAccountName() {
		return bankAccountName;
	}
	public void setBankAccountName(String bankAccountName) {
		this.bankAccountName = bankAccountName;
	}
	public String getPublicAndPrivateFlag() {
		return publicAndPrivateFlag;
	}
	public void setPublicAndPrivateFlag(String publicAndPrivateFlag) {
		this.publicAndPrivateFlag = publicAndPrivateFlag;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
        
    
}
