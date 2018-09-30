package com.jiuyv.yl.jms.client;

import com.jiuyv.yl.jms.client.entity.ISO8583Bean128;

// TODO: Auto-generated Javadoc
/**
 * 基础异常.
 * 
 * @author
 * @version 0.1
 */
/**
 * @author charley
 *
 */
public class PosPException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6279992876353577972L;

	/** 错误结果代码 */
	private String errorCode;
	/** 错误结果 */
	private String errorMessage;
	
	
	/** 错误的8583对象 */
	private ISO8583Bean128 res;
	
	public PosPException(String errorCode) {
		this.errorCode = errorCode;
	
	}

	/**
	 * 构造函数
	 * 
	 * @param prompt
	 *            错误结果描述
	 * @param errorCode
	 *            错误代码
	 * @param throwable
	 *            Throwable
	 */
	public PosPException(String errorCode, Throwable throwable) {
		super(throwable.getMessage());
		this.errorCode = errorCode;
		this.errorMessage = throwable.getMessage();
	}

	/**
	 * 构造函数
	 * 
	 * @param prompt
	 *            错误信息描述
	 * @param errorCode
	 *            错误代码
	 * @param errorMessage
	 *            错误信息
	 */
	public PosPException(String errorCode, String errorMessage) {
		super(errorMessage);
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}
	
	/**
	 * 构造函数
	 * 
	 * @param errorCode
	 *            错误代码
	 * @param errorMessage
	 *            错误信息
	 * @param res
	 *            错误对象
	 */
	public PosPException(String errorCode, String errorMessage,ISO8583Bean128 res) {
		super(errorMessage);
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
		this.res = res;
	}

	/**
	 * 构造函数
	 * 
	 * @param prompt
	 *            错误信息描述
	 * @param errorCode
	 *            错误代码
	 * @param errorMessage
	 *            错误信息
	 * @param throwable
	 */
	public PosPException(String errorCode, String errorMessage,
			Throwable throwable) {
		super(errorMessage, throwable);
		this.errorCode = errorCode;
	}

	/**
	 * 得到错误代码
	 * 
	 * @return errorCode
	 */
	public String getErrorCode() {
		return errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public ISO8583Bean128 getRes() {
		return res;
	}

	public void setRes(ISO8583Bean128 res) {
		this.res = res;
	}

}
