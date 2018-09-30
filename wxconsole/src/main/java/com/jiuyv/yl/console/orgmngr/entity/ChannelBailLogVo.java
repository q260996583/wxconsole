package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 服务商保证金信息记录表 TBL_CHANNEL_BAIL_LOG : TBL_CHANNEL_BAIL_LOG
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class ChannelBailLogVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** recNo : 记录号. REC_NO: NUMBER(10) */
	private Long recNo ;
	
	/** version : 版本号. VERSION: NUMBER(10) */
	private Long version ;
	
	/** channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(15) */
	private String channelCode ;
	
	/** beginAmt : 期初金额. BEGIN_AMT: NUMBER(14) */
	private Long beginAmt ;
	
	/** oprAmt : 调整金额. OPR_AMT: NUMBER(14) */
	private Long oprAmt ;
	
	/** endAmt : 期末金额. END_AMT: NUMBER(14) */
	private Long endAmt ;
	
	/** status : 状态. STATUS: VARCHAR2(2) */
	private String status ;
	
	/** remark : 备注. REMARK: NVARCHAR2(400) */
	private String remark ;
	
	/** recUser : 创建人账号. REC_USER: VARCHAR2(30) */
	private String recUser ;
	
	/** recTime : 创建时间. REC_TIME: CHAR(14) */
	private String recTime ;
	
	/** lastUptTime : 最后更新时间. LAST_UPT_TIME: CHAR(14) */
	private String lastUptTime ;
	
	/** lastUptUser : 最后更新人账号. LAST_UPT_USER: VARCHAR2(30) */
	private String lastUptUser ;
	
	/** audUser : 审核人. AUD_USER: VARCHAR2(30) */
	private String audUser ;
	
	/** audTime : 审核时间. AUD_TIME: CHAR(14) */
	private String audTime ;
	
	/** audRemark : 审核意见. AUD_REMARK: NVARCHAR2(400) */
	private String audRemark ;
	
	// --Extends -- 
	/** 服务商名称 */
	private String channelName;
	
	/** 状态 */
	private String statusDesc;
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public ChannelBailLogVo() {
		// Default Construtor
	}
	
	public ChannelBailLogVo(Long recNo) {
		this.recNo = recNo;
	}
		
	// -- Setter And Getter
	/**
	 * Set recNo : 记录号. REC_NO: NUMBER(10) 
	 */
	public void setRecNo(Long recNo){
		this.recNo = recNo;	
	}
	
	/**
	 * Get recNo : 记录号. REC_NO: NUMBER(10) 
	 */
	public Long getRecNo(){
		return this.recNo;	
	}
	
	/**
	 * Set channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(15) 
	 */
	public void setChannelCode(String channelCode){
		this.channelCode = channelCode;	
	}
	
	/**
	 * Get channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(15) 
	 */
	public String getChannelCode(){
		return this.channelCode;	
	}
	
	/**
	 * Set beginAmt : 期初金额. BEGIN_AMT: NUMBER(14) 
	 */
	public void setBeginAmt(Long beginAmt){
		this.beginAmt = beginAmt;	
	}
	
	/**
	 * Get beginAmt : 期初金额. BEGIN_AMT: NUMBER(14) 
	 */
	public Long getBeginAmt(){
		return this.beginAmt;	
	}
	
	/**
	 * Set oprAmt : 调整金额. OPR_AMT: NUMBER(14) 
	 */
	public void setOprAmt(Long oprAmt){
		this.oprAmt = oprAmt;	
	}
	
	/**
	 * Get oprAmt : 调整金额. OPR_AMT: NUMBER(14) 
	 */
	public Long getOprAmt(){
		return this.oprAmt;	
	}
	
	/**
	 * Set endAmt : 期末金额. END_AMT: NUMBER(14) 
	 */
	public void setEndAmt(Long endAmt){
		this.endAmt = endAmt;	
	}
	
	/**
	 * Get endAmt : 期末金额. END_AMT: NUMBER(14) 
	 */
	public Long getEndAmt(){
		return this.endAmt;	
	}
	
	/**
	 * Set status : 状态. STATUS: VARCHAR2(2) 
	 */
	public void setStatus(String status){
		this.status = status;	
	}
	
	/**
	 * Get status : 状态. STATUS: VARCHAR2(2) 
	 */
	public String getStatus(){
		return this.status;	
	}
	
	/**
	 * Set recUser : 创建人账号. REC_USER: VARCHAR2(30) 
	 */
	public void setRecUser(String recUser){
		this.recUser = recUser;	
	}
	
	/**
	 * Get recUser : 创建人账号. REC_USER: VARCHAR2(30) 
	 */
	public String getRecUser(){
		return this.recUser;	
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
	 * Set lastUptTime : 最后更新时间. LAST_UPT_TIME: CHAR(14) 
	 */
	public void setLastUptTime(String lastUptTime){
		this.lastUptTime = lastUptTime;	
	}
	
	/**
	 * Get lastUptTime : 最后更新时间. LAST_UPT_TIME: CHAR(14) 
	 */
	public String getLastUptTime(){
		return this.lastUptTime;	
	}
	
	/**
	 * Set lastUptUser : 最后更新人账号. LAST_UPT_USER: VARCHAR2(30) 
	 */
	public void setLastUptUser(String lastUptUser){
		this.lastUptUser = lastUptUser;	
	}
	
	/**
	 * Get lastUptUser : 最后更新人账号. LAST_UPT_USER: VARCHAR2(30) 
	 */
	public String getLastUptUser(){
		return this.lastUptUser;	
	}
	
	/**
	 * Set audUser : 审核人. AUD_USER: VARCHAR2(30) 
	 */
	public void setAudUser(String audUser){
		this.audUser = audUser;	
	}
	
	/**
	 * Get audUser : 审核人. AUD_USER: VARCHAR2(30) 
	 */
	public String getAudUser(){
		return this.audUser;	
	}
	
	/**
	 * Set audTime : 审核时间. AUD_TIME: CHAR(14) 
	 */
	public void setAudTime(String audTime){
		this.audTime = audTime;	
	}
	
	/**
	 * Get audTime : 审核时间. AUD_TIME: CHAR(14) 
	 */
	public String getAudTime(){
		return this.audTime;	
	}
	
	/**
	 * Set audRemark : 审核意见. AUD_REMARK: NVARCHAR2(400) 
	 */
	public void setAudRemark(String audRemark){
		this.audRemark = audRemark;	
	}
	
	/**
	 * Get audRemark : 审核意见. AUD_REMARK: NVARCHAR2(400) 
	 */
	public String getAudRemark(){
		return this.audRemark;	
	}

	/**
	 * @return the version
	 */
	public Long getVersion() {
		return version;
	}

	/**
	 * @param version the version to set
	 */
	public void setVersion(Long version) {
		this.version = version;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the channelName
	 */
	public String getChannelName() {
		return channelName;
	}

	/**
	 * @param channelName the channelName to set
	 */
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	/**
	 * @return the statusDesc
	 */
	public String getStatusDesc() {
		return statusDesc;
	}

	/**
	 * @param statusDesc the statusDesc to set
	 */
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	
}