/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.common;

/**
 * 
 * @author simons.xiao
 * @version $Id: CommonRequest.java, v 0.1 2017年1月10日 下午2:05:27 simons.xiao Exp $
 */
public class CommonRequest {
    private String memberCode;  //会员标志    SSDF_SX_POS
    private String requestId;   //请求流水号
    private String requestDate; //请求日期
    private String signData;    //签名值
    private String encryptData; //加密值
    private String encryptKey;  //AES对称加密后的结果   
    private String callBackURL; //异步回调地址
    private String resv;        //扩展域
    
    
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
	public String getCallBackURL() {
		return callBackURL;
	}
	public void setCallBackURL(String callBackURL) {
		this.callBackURL = callBackURL;
	}
	public String getResv() {
		return resv;
	}
	public void setResv(String resv) {
		this.resv = resv;
	}
    
}
