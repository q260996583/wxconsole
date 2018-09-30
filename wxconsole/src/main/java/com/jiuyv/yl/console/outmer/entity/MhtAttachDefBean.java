package com.jiuyv.yl.console.outmer.entity;


/**
 * The Class MhtAttachDefBean.
 * 商户附件定义
 *
 * @author 
 * @version 1.0.0
 * @since 2016-6-16
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public class MhtAttachDefBean {

	/** 附件类别码. */
	private String athType ;
	
	/** 附件类别名称 */
	private String athTypeName ; 
	
	/** 附件描述 */
	private String athTypeDesc;
	
	/** 附件允许的文件类型 */
	private String athFileType;
	
	/** 附件是否可为空  1:不可为空;0:可为空*/
	private String nullable;
	
	
	public MhtAttachDefBean() {
		
	}

	public MhtAttachDefBean(String athType, String athTypeName,
			String athTypeDesc, String athFileType) {
		super();
		this.athType = athType;
		this.athTypeName = athTypeName;
		this.athTypeDesc = athTypeDesc;
		this.athFileType = athFileType;
	}
	
	public MhtAttachDefBean(String athType, String athTypeName,
			String athTypeDesc, String athFileType, String nullable) {
		super();
		this.athType = athType;
		this.athTypeName = athTypeName;
		this.athTypeDesc = athTypeDesc;
		this.athFileType = athFileType;
		this.nullable = nullable;
	}

	/**
	 * @return the athType
	 */
	public String getAthType() {
		return athType;
	}

	/**
	 * @param athType the athType to set
	 */
	public void setAthType(String athType) {
		this.athType = athType;
	}

	/**
	 * @return the athTypeName
	 */
	public String getAthTypeName() {
		return athTypeName;
	}

	/**
	 * @param athTypeName the athTypeName to set
	 */
	public void setAthTypeName(String athTypeName) {
		this.athTypeName = athTypeName;
	}

	/**
	 * @return the athTypeDesc
	 */
	public String getAthTypeDesc() {
		return athTypeDesc;
	}

	/**
	 * @param athTypeDesc the athTypeDesc to set
	 */
	public void setAthTypeDesc(String athTypeDesc) {
		this.athTypeDesc = athTypeDesc;
	}

	/**
	 * @return the athFileType
	 */
	public String getAthFileType() {
		return athFileType;
	}

	/**
	 * @param athFileType the athFileType to set
	 */
	public void setAthFileType(String athFileType) {
		this.athFileType = athFileType;
	}

	/**
	 * @return the nullable
	 */
	public String getNullable() {
		return nullable;
	}

	/**
	 * @param nullable the nullable to set
	 */
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
	
}
