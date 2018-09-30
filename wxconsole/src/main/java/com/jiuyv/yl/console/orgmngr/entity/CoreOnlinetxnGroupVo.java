package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 联机交易组控制表  TBL_CORE_ONLINETXN_GROUP : TBL_CORE_ONLINETXN_GROUP
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class CoreOnlinetxnGroupVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** groupNo : 组号. GROUP_NO: VARCHAR2(5) */
	private String groupNo ;
	
	/** msgTypeReq : 请求消息类型. MSG_TYPE_REQ: VARCHAR2(10) */
	private String msgTypeReq ;
	
	/** procCode : 交易处理码(3域). PROC_CODE: VARCHAR2(6) */
	private String procCode ;
	
	/** condCode : 服务点条件码(25). COND_CODE: VARCHAR2(2) */
	private String condCode ;
	
	/** txnTypeCode : 交易类型码(60.1). TXN_TYPE_CODE: VARCHAR2(2) */
	private String txnTypeCode ;
	
	/** netCode : 网络管理信息码(60.3). NET_CODE: VARCHAR2(3) */
	private String netCode ;
	
	/** txnName : 交易名称. TXN_NAME: VARCHAR2(60) */
	private String txnName ;
	
	/** rsv1 : RSV1. RSV1: VARCHAR2(100) */
	private String rsv1 ;
	
	/** rsv2 : RSV2. RSV2: VARCHAR2(100) */
	private String rsv2 ;
	
	/** rsv3 : RSV3. RSV3: VARCHAR2(100) */
	private String rsv3 ;
	
	/** rsv4 : RSV4. RSV4: VARCHAR2(100) */
	private String rsv4 ;
	
	private boolean check;
	
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public CoreOnlinetxnGroupVo() {
		// Default Construtor
	}
	
	public CoreOnlinetxnGroupVo(String groupNo, String msgTypeReq, String procCode, String condCode, String txnTypeCode, String netCode) {
		this.groupNo = groupNo;
		this.msgTypeReq = msgTypeReq;
		this.procCode = procCode;
		this.condCode = condCode;
		this.txnTypeCode = txnTypeCode;
		this.netCode = netCode;
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
	 * Set msgTypeReq : 请求消息类型. MSG_TYPE_REQ: VARCHAR2(10) 
	 */
	public void setMsgTypeReq(String msgTypeReq){
		this.msgTypeReq = msgTypeReq;	
	}
	
	/**
	 * Get msgTypeReq : 请求消息类型. MSG_TYPE_REQ: VARCHAR2(10) 
	 */
	public String getMsgTypeReq(){
		return this.msgTypeReq;	
	}
	
	/**
	 * Set procCode : 交易处理码(3域). PROC_CODE: VARCHAR2(6) 
	 */
	public void setProcCode(String procCode){
		this.procCode = procCode;	
	}
	
	/**
	 * Get procCode : 交易处理码(3域). PROC_CODE: VARCHAR2(6) 
	 */
	public String getProcCode(){
		return this.procCode;	
	}
	
	/**
	 * Set condCode : 服务点条件码(25). COND_CODE: VARCHAR2(2) 
	 */
	public void setCondCode(String condCode){
		this.condCode = condCode;	
	}
	
	/**
	 * Get condCode : 服务点条件码(25). COND_CODE: VARCHAR2(2) 
	 */
	public String getCondCode(){
		return this.condCode;	
	}
	
	/**
	 * Set txnTypeCode : 交易类型码(60.1). TXN_TYPE_CODE: VARCHAR2(2) 
	 */
	public void setTxnTypeCode(String txnTypeCode){
		this.txnTypeCode = txnTypeCode;	
	}
	
	/**
	 * Get txnTypeCode : 交易类型码(60.1). TXN_TYPE_CODE: VARCHAR2(2) 
	 */
	public String getTxnTypeCode(){
		return this.txnTypeCode;	
	}
	
	/**
	 * Set netCode : 网络管理信息码(60.3). NET_CODE: VARCHAR2(3) 
	 */
	public void setNetCode(String netCode){
		this.netCode = netCode;	
	}
	
	/**
	 * Get netCode : 网络管理信息码(60.3). NET_CODE: VARCHAR2(3) 
	 */
	public String getNetCode(){
		return this.netCode;	
	}
	
	/**
	 * Set txnName : 交易名称. TXN_NAME: VARCHAR2(60) 
	 */
	public void setTxnName(String txnName){
		this.txnName = txnName;	
	}
	
	/**
	 * Get txnName : 交易名称. TXN_NAME: VARCHAR2(60) 
	 */
	public String getTxnName(){
		return this.txnName;	
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

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
	
}