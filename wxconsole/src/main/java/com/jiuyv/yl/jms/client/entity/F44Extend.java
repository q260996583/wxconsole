package com.jiuyv.yl.jms.client.entity;

// TODO: Auto-generated Javadoc
/**
 * The Class F44Extend.
 */
public class F44Extend {
	
	/** 接收机构标识码      AN11	表示发卡行标识码（左靠，右部多余部分填空格）. */
	private String cardBankNo;
	
	/** 收单机构标识码      AN11	表示商户结算行标识码（左靠，右部多余部分填空格. */
	private String acceptCardNo;
	
	/**
	 * Gets the 接收机构标识码      AN11	表示发卡行标识码（左靠，右部多余部分填空格）.
	 *
	 * @return the 接收机构标识码      AN11	表示发卡行标识码（左靠，右部多余部分填空格）
	 */
	public String getCardBankNo() {
		return cardBankNo;
	}
	
	/**
	 * Sets the 接收机构标识码      AN11	表示发卡行标识码（左靠，右部多余部分填空格）.
	 *
	 * @param cardBankNo the new 接收机构标识码      AN11	表示发卡行标识码（左靠，右部多余部分填空格）
	 */
	public void setCardBankNo(String cardBankNo) {
		this.cardBankNo = cardBankNo;
	}
	
	/**
	 * Gets the 收单机构标识码      AN11	表示商户结算行标识码（左靠，右部多余部分填空格.
	 *
	 * @return the 收单机构标识码      AN11	表示商户结算行标识码（左靠，右部多余部分填空格
	 */
	public String getAcceptCardNo() {
		return acceptCardNo;
	}
	
	/**
	 * Sets the 收单机构标识码      AN11	表示商户结算行标识码（左靠，右部多余部分填空格.
	 *
	 * @param acceptCardNo the new 收单机构标识码      AN11	表示商户结算行标识码（左靠，右部多余部分填空格
	 */
	public void setAcceptCardNo(String acceptCardNo) {
		this.acceptCardNo = acceptCardNo;
	}
	
	

}

