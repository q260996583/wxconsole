package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: [New]联机交易组定义表 : TBL_CORE_ONLINETXN_GROUP_DEF
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class CoreOnlinetxnGroupDefVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** groupNo : 组号. GROUP_NO: VARCHAR2(5) */
	private String groupNo ;
	
	/** groupName : 组名称. GROUP_NAME: NVARCHAR2(100) */
	private String groupName ;
	
	/** status : 状态. STATUS: CHAR(1) */
	private String status ;
	
	/** rsv1 : RSV1. RSV1: VARCHAR2(100) */
	private String rsv1 ;
	
	/** rsv2 : RSV2. RSV2: VARCHAR2(100) */
	private String rsv2 ;
	
	/** rsv3 : RSV3. RSV3: VARCHAR2(100) */
	private String rsv3 ;
	
	/** rsv4 : RSV4. RSV4: VARCHAR2(100) */
	private String rsv4 ;
	
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public CoreOnlinetxnGroupDefVo() {
		// Default Construtor
	}
	
	public CoreOnlinetxnGroupDefVo(String groupNo) {
		this.groupNo = groupNo;
	}
		
	// -- Setter And Getter
	/**
	 * Set groupNo : 组号. GROUP_NO: VARCHAR2(5) 
	 */
	public void setGroupNo(String groupNo){
		this.groupNo = groupNo;	
	}
	
	/**
	 * Get groupNo : 组号. GROUP_NO: VARCHAR2(5) 
	 */
	public String getGroupNo(){
		return this.groupNo;	
	}
	
	/**
	 * Set groupName : 组名称. GROUP_NAME: NVARCHAR2(100) 
	 */
	public void setGroupName(String groupName){
		this.groupName = groupName;	
	}
	
	/**
	 * Get groupName : 组名称. GROUP_NAME: NVARCHAR2(100) 
	 */
	public String getGroupName(){
		return this.groupName;	
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
	 * Set rsv1 : RSV1. RSV1: VARCHAR2(100) 
	 */
	public void setRsv1(String rsv1){
		this.rsv1 = rsv1;	
	}
	
	/**
	 * Get rsv1 : RSV1. RSV1: VARCHAR2(100) 
	 */
	public String getRsv1(){
		return this.rsv1;	
	}
	
	/**
	 * Set rsv2 : RSV2. RSV2: VARCHAR2(100) 
	 */
	public void setRsv2(String rsv2){
		this.rsv2 = rsv2;	
	}
	
	/**
	 * Get rsv2 : RSV2. RSV2: VARCHAR2(100) 
	 */
	public String getRsv2(){
		return this.rsv2;	
	}
	
	/**
	 * Set rsv3 : RSV3. RSV3: VARCHAR2(100) 
	 */
	public void setRsv3(String rsv3){
		this.rsv3 = rsv3;	
	}
	
	/**
	 * Get rsv3 : RSV3. RSV3: VARCHAR2(100) 
	 */
	public String getRsv3(){
		return this.rsv3;	
	}
	
	/**
	 * Set rsv4 : RSV4. RSV4: VARCHAR2(100) 
	 */
	public void setRsv4(String rsv4){
		this.rsv4 = rsv4;	
	}
	
	/**
	 * Get rsv4 : RSV4. RSV4: VARCHAR2(100) 
	 */
	public String getRsv4(){
		return this.rsv4;	
	}
	
}