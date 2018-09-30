/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.common;


/**
 * 
 * @author simons.xiao
 * @version $Id: PaidResponse.java, v 0.1 2017年1月11日 上午12:23:21 simons.xiao Exp $
 */
public class PaidResponse {
    private String instId;
    private String instTradeDate;
    private String instTradeId;
    private String instTradeAmount;
    private String userCode;
    private String tradeStatus;
    private String tradeDate;
    private String clearDate;
    private String paidTraceId;
    private String tradeRespCode;
    private String tradeRespMessage;
	public String getInstId() {
		return instId;
	}
	public void setInstId(String instId) {
		this.instId = instId;
	}
	public String getInstTradeDate() {
		return instTradeDate;
	}
	public void setInstTradeDate(String instTradeDate) {
		this.instTradeDate = instTradeDate;
	}
	public String getInstTradeId() {
		return instTradeId;
	}
	public void setInstTradeId(String instTradeId) {
		this.instTradeId = instTradeId;
	}
	public String getInstTradeAmount() {
		return instTradeAmount;
	}
	public void setInstTradeAmount(String instTradeAmount) {
		this.instTradeAmount = instTradeAmount;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	public String getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}
	public String getClearDate() {
		return clearDate;
	}
	public void setClearDate(String clearDate) {
		this.clearDate = clearDate;
	}
	public String getPaidTraceId() {
		return paidTraceId;
	}
	public void setPaidTraceId(String paidTraceId) {
		this.paidTraceId = paidTraceId;
	}
	public String getTradeRespCode() {
		return tradeRespCode;
	}
	public void setTradeRespCode(String tradeRespCode) {
		this.tradeRespCode = tradeRespCode;
	}
	public String getTradeRespMessage() {
		return tradeRespMessage;
	}
	public void setTradeRespMessage(String tradeRespMessage) {
		this.tradeRespMessage = tradeRespMessage;
	}
    
    
    
    
}
