package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 银行信息表 : TBL_BRANCH_BANK_INF
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class BranchBankInfVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** unionBankNo : 银行行号. UNION_BANK_NO: VARCHAR2(12) */
	private String unionBankNo ;
	
	/** version : VERSION. VERSION: NUMBER(10) */
	private Long version ;
	
	/** parentBankNo : 上级行号. PARENT_BANK_NO: VARCHAR2(3) */
	private String parentBankNo ;
	
	/** bankName : 银行名称. BANK_NAME: VARCHAR2(100) */
	private String bankName ;
	
	/** proCode : 省代码. PRO_CODE: VARCHAR2(4) */
	private String proCode ;
	
	/** cityCode : 市代码. CITY_CODE: VARCHAR2(4) */
	private String cityCode ;
	
	/** countryCode : 区代码. COUNTRY_CODE: VARCHAR2(4) */
	private String countryCode ;
	
	/** address : 银行地址. ADDRESS: VARCHAR2(400) */
	private String address ;
	
	/** postCode : 邮编. POST_CODE: VARCHAR2((10) */
	private String postCode ;
	
	/** recAcc : 创建人. REC_ACC: VARCHAR2(30) */
	private String recAcc ;
	
	/** recTime : 创建时间. REC_TIME: CHAR(14) */
	private String recTime ;
	
	/** lastUptAcc : 最后修改人. LAST_UPT_ACC: VARCHAR2(30) */
	private String lastUptAcc ;
	
	/** lastUptTime : 最后修改时间. LAST_UPT_TIME: CHAR(14) */
	private String lastUptTime ;
	
	// -- Extend -- 
	/** 大行名称 */
	private String parentBankNoDesc;
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public BranchBankInfVo() {
		// Default Construtor
	}
	
	public BranchBankInfVo(String unionBankNo) {
		this.unionBankNo = unionBankNo;
	}
		
	// -- Setter And Getter
	/**
	 * Set unionBankNo : 银行行号. UNION_BANK_NO: VARCHAR2(12) 
	 */
	public void setUnionBankNo(String unionBankNo){
		this.unionBankNo = unionBankNo;	
	}
	
	/**
	 * Get unionBankNo : 银行行号. UNION_BANK_NO: VARCHAR2(12) 
	 */
	public String getUnionBankNo(){
		return this.unionBankNo;	
	}
	
	/**
	 * Set version : VERSION. VERSION: NUMBER(10) 
	 */
	public void setVersion(Long version){
		this.version = version;	
	}
	
	/**
	 * Get version : VERSION. VERSION: NUMBER(10) 
	 */
	public Long getVersion(){
		return this.version;	
	}
	
	/**
	 * Set parentBankNo : 上级行号. PARENT_BANK_NO: VARCHAR2(3) 
	 */
	public void setParentBankNo(String parentBankNo){
		this.parentBankNo = parentBankNo;	
	}
	
	/**
	 * Get parentBankNo : 上级行号. PARENT_BANK_NO: VARCHAR2(3) 
	 */
	public String getParentBankNo(){
		return this.parentBankNo;	
	}
	
	/**
	 * Set bankName : 银行名称. BANK_NAME: VARCHAR2(100) 
	 */
	public void setBankName(String bankName){
		this.bankName = bankName;	
	}
	
	/**
	 * Get bankName : 银行名称. BANK_NAME: VARCHAR2(100) 
	 */
	public String getBankName(){
		return this.bankName;	
	}
	
	/**
	 * Set proCode : 省代码. PRO_CODE: VARCHAR2(4) 
	 */
	public void setProCode(String proCode){
		this.proCode = proCode;	
	}
	
	/**
	 * Get proCode : 省代码. PRO_CODE: VARCHAR2(4) 
	 */
	public String getProCode(){
		return this.proCode;	
	}
	
	/**
	 * Set cityCode : 市代码. CITY_CODE: VARCHAR2(4) 
	 */
	public void setCityCode(String cityCode){
		this.cityCode = cityCode;	
	}
	
	/**
	 * Get cityCode : 市代码. CITY_CODE: VARCHAR2(4) 
	 */
	public String getCityCode(){
		return this.cityCode;	
	}
	
	/**
	 * Set countryCode : 区代码. COUNTRY_CODE: VARCHAR2(4) 
	 */
	public void setCountryCode(String countryCode){
		this.countryCode = countryCode;	
	}
	
	/**
	 * Get countryCode : 区代码. COUNTRY_CODE: VARCHAR2(4) 
	 */
	public String getCountryCode(){
		return this.countryCode;	
	}
	
	/**
	 * Set address : 银行地址. ADDRESS: VARCHAR2(400) 
	 */
	public void setAddress(String address){
		this.address = address;	
	}
	
	/**
	 * Get address : 银行地址. ADDRESS: VARCHAR2(400) 
	 */
	public String getAddress(){
		return this.address;	
	}
	
	/**
	 * Set postCode : 邮编. POST_CODE: VARCHAR2((10) 
	 */
	public void setPostCode(String postCode){
		this.postCode = postCode;	
	}
	
	/**
	 * Get postCode : 邮编. POST_CODE: VARCHAR2((10) 
	 */
	public String getPostCode(){
		return this.postCode;	
	}
	
	/**
	 * Set recAcc : 创建人. REC_ACC: VARCHAR2(30) 
	 */
	public void setRecAcc(String recAcc){
		this.recAcc = recAcc;	
	}
	
	/**
	 * Get recAcc : 创建人. REC_ACC: VARCHAR2(30) 
	 */
	public String getRecAcc(){
		return this.recAcc;	
	}
	
	/**
	 * Set recTime : 创建时间. REC_TIME: CHAR(14) 
	 */
	public void setRecTime(String recTime){
		this.recTime = recTime;	
	}
	
	/**
	 * Get recTime : 创建时间. REC_TIME: CHAR(14) 
	 */
	public String getRecTime(){
		return this.recTime;	
	}
	
	/**
	 * Set lastUptAcc : 最后修改人. LAST_UPT_ACC: VARCHAR2(30) 
	 */
	public void setLastUptAcc(String lastUptAcc){
		this.lastUptAcc = lastUptAcc;	
	}
	
	/**
	 * Get lastUptAcc : 最后修改人. LAST_UPT_ACC: VARCHAR2(30) 
	 */
	public String getLastUptAcc(){
		return this.lastUptAcc;	
	}
	
	/**
	 * Set lastUptTime : 最后修改时间. LAST_UPT_TIME: CHAR(14) 
	 */
	public void setLastUptTime(String lastUptTime){
		this.lastUptTime = lastUptTime;	
	}
	
	/**
	 * Get lastUptTime : 最后修改时间. LAST_UPT_TIME: CHAR(14) 
	 */
	public String getLastUptTime(){
		return this.lastUptTime;	
	}

	/**
	 * @return the parentBankNoDesc
	 */
	public String getParentBankNoDesc() {
		return parentBankNoDesc;
	}

	/**
	 * @param parentBankNoDesc the parentBankNoDesc to set
	 */
	public void setParentBankNoDesc(String parentBankNoDesc) {
		this.parentBankNoDesc = parentBankNoDesc;
	}
	
}