/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.common;


/**
 * 
 * @author simons.xiao
 * @version $Id: CommonResponse.java, v 0.1 2017年1月10日 下午12:07:57 simons.xiao Exp $
 */

public class CommonResponse {
    private String memberCode;
    private String requestId;
    private String requestDate;
    private String requestStatus;
    private String signData;
    private String encryptData;
    private String encryptKey;
    private String respCode;
    private String respMessage;
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public String getSignData() {
		return signData;
	}
	public void setSignData(String signData) {
		this.signData = signData;
	}
	public String getEncryptData() {
		return encryptData;
	}
	public void setEncryptData(String encryptData) {
		this.encryptData = encryptData;
	}
	public String getEncryptKey() {
		return encryptKey;
	}
	public void setEncryptKey(String encryptKey) {
		this.encryptKey = encryptKey;
	}
	public String getRespCode() {
		return respCode;
	}
	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}
	public String getRespMessage() {
		return respMessage;
	}
	public void setRespMessage(String respMessage) {
		this.respMessage = respMessage;
	}
    
    
    
}
