package com.jiuyv.common.ibatis.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


// TODO: Auto-generated Javadoc
/**
 * @version 0.1
 * @author cowyk
 *         <h2>错误信息类.</h2>
 *         <p>包含出错域、出错信息、行号的信息<br />
 *         </p>
 * 
 */
public class ErrorClass implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 154633567453965197L;

	/** The row num. */
	private int rowNum = -1;

	/** The id. */
	private String id;

	/** The msg. */
	private String msg;

	/**
	 * Instantiates a default error class.
	 */
	public ErrorClass() {

	}

	/**
	 * Instantiates a new error class.
	 * 
	 * @param rowNum
	 *            the row num
	 * @param id
	 *            the id
	 * @param msg
	 *            the msg
	 */
	public ErrorClass(int rowNum, String id, String msg) {
		this.rowNum = rowNum;
		this.id = id;
		this.msg = msg;
	}

	/**
	 * Gets the row num.
	 * 
	 * @return the row num
	 */
	public int getRowNum() {
		return rowNum;
	}

	/**
	 * Sets the row num.
	 * 
	 * @param rowNum
	 *            the new row num
	 */
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	/**
	 * Gets the id.
	 * 
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * Sets the id.
	 * 
	 * @param id
	 *            the new id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * Gets the msg.
	 * 
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * Sets the msg.
	 * 
	 * @param msg
	 *            the new msg
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * Generate hashCode with field id and rowNum.
	 * 
	 * @return hashCode
	 */
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		int idHash = 0;
		if (id != null) {
			idHash = id.hashCode();
		}
		result = prime * result + idHash;
		result = prime * result + rowNum;
		return result;
	}

	/**
	 * Compare object with this.
	 * 
	 * @param obj
	 *            object tobe compare with.
	 * @return if equals or not.
	 */
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final ErrorClass other = (ErrorClass) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (rowNum != other.rowNum) {
			return false;
		}
		return true;
	}
	
	/**
	 * @return String
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}


}
