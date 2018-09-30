package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;

/**
 * The Class LogInfo.
 */
public class LogInfo implements Serializable {

	/** The opr no. */
	private Long oprNo ;
	
	/** The result info. */
	private String resultInfo ;

	/**
	 * Gets the opr no.
	 * 
	 * @return the opr no
	 */
	public Long getOprNo() {
		return oprNo;
	}

	/**
	 * Sets the opr no.
	 * 
	 * @param oprNo the new opr no
	 */
	public void setOprNo(Long oprNo) {
		this.oprNo = oprNo;
	}

	/**
	 * Gets the result info.
	 * 
	 * @return the result info
	 */
	public String getResultInfo() {
		return resultInfo;
	}

	/**
	 * Sets the result info.
	 * 
	 * @param resultInfo the new result info
	 */
	public void setResultInfo(String resultInfo) {
		this.resultInfo = resultInfo;
	}
	
	/**
	 * 追加结果信息
	 * @param resultInfo
	 */
	public void appendResultInfo(String resultInfo) {
		this.resultInfo = this.resultInfo == null ? resultInfo : this.resultInfo + resultInfo;
	}
	
	
}
