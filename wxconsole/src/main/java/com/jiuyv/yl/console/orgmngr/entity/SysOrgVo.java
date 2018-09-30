package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 控制台机构表 TBL_SYS_ORG : TBL_SYS_ORG
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class SysOrgVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** orgCode : 机构代码. ORG_CODE: VARCHAR2(30) */
	private String orgCode ;
	
	/** version : VERSION. VERSION: NUMBER(10) */
	private Long version ;
	
	/** fatherOrgCode : 上级机构代码. FATHER_ORG_CODE: VARCHAR2(30) */
	private String fatherOrgCode ;
	
	/** orgName : 机构名称. ORG_NAME: VARCHAR2(200) */
	private String orgName ;
	
	/** orgType : 机构类型. ORG_TYPE: VARCHAR2(10) */
	private String orgType ;
	
	/** persName : 联系人. PERS_NAME: VARCHAR2(20) */
	private String persName ;
	
	/** persPhone : 联系人电话. PERS_PHONE: VARCHAR2(20) */
	private String persPhone ;
	
	/** email : EMAIL. EMAIL: VARCHAR2(50) */
	private String email ;
	
	/** orgAddr : 地址. ORG_ADDR: VARCHAR2(200) */
	private String orgAddr ;
	
	/** status : 状态. STATUS: CHAR(1) */
	private String status ;
	
	/** settleFlag : 批处理标识. SETTLE_FLAG: CHAR(3) */
	private String settleFlag ;
	
	/** fileFlag : 导出文件标识. FILE_FLAG: CHAR(3) */
	private String fileFlag ;
	
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public SysOrgVo() {
		// Default Construtor
	}
	
	public SysOrgVo(String orgCode) {
		this.orgCode = orgCode;
	}
		
	// -- Setter And Getter
	/**
	 * Set orgCode : 机构代码. ORG_CODE: VARCHAR2(30) 
	 */
	public void setOrgCode(String orgCode){
		this.orgCode = orgCode;	
	}
	
	/**
	 * Get orgCode : 机构代码. ORG_CODE: VARCHAR2(30) 
	 */
	public String getOrgCode(){
		return this.orgCode;	
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
	 * Set fatherOrgCode : 上级机构代码. FATHER_ORG_CODE: VARCHAR2(30) 
	 */
	public void setFatherOrgCode(String fatherOrgCode){
		this.fatherOrgCode = fatherOrgCode;	
	}
	
	/**
	 * Get fatherOrgCode : 上级机构代码. FATHER_ORG_CODE: VARCHAR2(30) 
	 */
	public String getFatherOrgCode(){
		return this.fatherOrgCode;	
	}
	
	/**
	 * Set orgName : 机构名称. ORG_NAME: VARCHAR2(200) 
	 */
	public void setOrgName(String orgName){
		this.orgName = orgName;	
	}
	
	/**
	 * Get orgName : 机构名称. ORG_NAME: VARCHAR2(200) 
	 */
	public String getOrgName(){
		return this.orgName;	
	}
	
	/**
	 * Set orgType : 机构类型. ORG_TYPE: VARCHAR2(10) 
	 */
	public void setOrgType(String orgType){
		this.orgType = orgType;	
	}
	
	/**
	 * Get orgType : 机构类型. ORG_TYPE: VARCHAR2(10) 
	 */
	public String getOrgType(){
		return this.orgType;	
	}
	
	/**
	 * Set persName : 联系人. PERS_NAME: VARCHAR2(20) 
	 */
	public void setPersName(String persName){
		this.persName = persName;	
	}
	
	/**
	 * Get persName : 联系人. PERS_NAME: VARCHAR2(20) 
	 */
	public String getPersName(){
		return this.persName;	
	}
	
	/**
	 * Set persPhone : 联系人电话. PERS_PHONE: VARCHAR2(20) 
	 */
	public void setPersPhone(String persPhone){
		this.persPhone = persPhone;	
	}
	
	/**
	 * Get persPhone : 联系人电话. PERS_PHONE: VARCHAR2(20) 
	 */
	public String getPersPhone(){
		return this.persPhone;	
	}
	
	/**
	 * Set email : EMAIL. EMAIL: VARCHAR2(50) 
	 */
	public void setEmail(String email){
		this.email = email;	
	}
	
	/**
	 * Get email : EMAIL. EMAIL: VARCHAR2(50) 
	 */
	public String getEmail(){
		return this.email;	
	}
	
	/**
	 * Set orgAddr : 地址. ORG_ADDR: VARCHAR2(200) 
	 */
	public void setOrgAddr(String orgAddr){
		this.orgAddr = orgAddr;	
	}
	
	/**
	 * Get orgAddr : 地址. ORG_ADDR: VARCHAR2(200) 
	 */
	public String getOrgAddr(){
		return this.orgAddr;	
	}
	
	/**
	 * Set status : 状态. STATUS: CHAR(1) 
	 */
	public void setStatus(String status){
		this.status = status;	
	}
	
	/**
	 * Get status : 状态. STATUS: CHAR(1) 
	 */
	public String getStatus(){
		return this.status;	
	}
	
	/**
	 * Set settleFlag : 批处理标识. SETTLE_FLAG: CHAR(3) 
	 */
	public void setSettleFlag(String settleFlag){
		this.settleFlag = settleFlag;	
	}
	
	/**
	 * Get settleFlag : 批处理标识. SETTLE_FLAG: CHAR(3) 
	 */
	public String getSettleFlag(){
		return this.settleFlag;	
	}
	
	/**
	 * Set fileFlag : 导出文件标识. FILE_FLAG: CHAR(3) 
	 */
	public void setFileFlag(String fileFlag){
		this.fileFlag = fileFlag;	
	}
	
	/**
	 * Get fileFlag : 导出文件标识. FILE_FLAG: CHAR(3) 
	 */
	public String getFileFlag(){
		return this.fileFlag;	
	}
	
}