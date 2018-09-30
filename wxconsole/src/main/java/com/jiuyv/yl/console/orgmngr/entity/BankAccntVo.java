package com.jiuyv.yl.console.orgmngr.entity;

public class BankAccntVo {
	
	private String bankNo;  	//银行编码
	private String accntNo;		//银行帐号
	private String bankName;	//银行名称
	private String bankTitle;   //银行编码对应的中文名
	private String bankAccntId; //账户编号
	private String fileTemplate; //出金文件模板
	private String accntName;//申鑫付帐户信息
	private String bankAccntType;//帐户类型
	private String accntFlag;
	private String bfjAccntId;
	private String licenseNo;
	private String oldAccntNo;
	
	/** 是否为备付金存管账户 */
	private String inFlag;
	
	// --extend --
	private String accntFlagDesc;
	
	private String bankAccntTypeDesc;

	/** 是否为备付金存管账户 */
	private String inFlagDesc;
	
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getAccntNo() {
		return accntNo;
	}
	public void setAccntNo(String accntNo) {
		this.accntNo = accntNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankTitle() {
		return bankTitle;
	}
	public void setBankTitle(String bankTitle) {
		this.bankTitle = bankTitle;
	}
	public String getBankAccntId() {
		return bankAccntId;
	}
	public void setBankAccntId(String bankAccntId) {
		this.bankAccntId = bankAccntId;
	}
	public String getFileTemplate() {
		return fileTemplate;
	}
	public void setFileTemplate(String fileTemplate) {
		this.fileTemplate = fileTemplate;
	}
	public String getAccntName() {
		return accntName;
	}
	public void setAccntName(String accntName) {
		this.accntName = accntName;
	}
	public String getBankAccntType() {
		return bankAccntType;
	}
	public void setBankAccntType(String bankAccntType) {
		this.bankAccntType = bankAccntType;
	}
	public String getAccntFlag() {
		return accntFlag;
	}
	public void setAccntFlag(String accntFlag) {
		this.accntFlag = accntFlag;
	}
	public String getBfjAccntId() {
		return bfjAccntId;
	}
	public void setBfjAccntId(String bfjAccntId) {
		this.bfjAccntId = bfjAccntId;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getOldAccntNo() {
		return oldAccntNo;
	}
	public void setOldAccntNo(String oldAccntNo) {
		this.oldAccntNo = oldAccntNo;
	}
	/**
	 * @return the accntFlagDesc
	 */
	public String getAccntFlagDesc() {
		return accntFlagDesc;
	}
	/**
	 * @param accntFlagDesc the accntFlagDesc to set
	 */
	public void setAccntFlagDesc(String accntFlagDesc) {
		this.accntFlagDesc = accntFlagDesc;
	}
	/**
	 * @return the bankAccntTypeDesc
	 */
	public String getBankAccntTypeDesc() {
		return bankAccntTypeDesc;
	}
	/**
	 * @param bankAccntTypeDesc the bankAccntTypeDesc to set
	 */
	public void setBankAccntTypeDesc(String bankAccntTypeDesc) {
		this.bankAccntTypeDesc = bankAccntTypeDesc;
	}
	/**
	 * @return the inFlag
	 */
	public String getInFlag() {
		return inFlag;
	}
	/**
	 * @param inFlag the inFlag to set
	 */
	public void setInFlag(String inFlag) {
		this.inFlag = inFlag;
	}
	/**
	 * @return the inFlagDesc
	 */
	public String getInFlagDesc() {
		return inFlagDesc;
	}
	/**
	 * @param inFlagDesc the inFlagDesc to set
	 */
	public void setInFlagDesc(String inFlagDesc) {
		this.inFlagDesc = inFlagDesc;
	}
}
