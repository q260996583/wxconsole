package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 代理商结算费率表 TBL_CORE_CHANNEL_RATE : TBL_CORE_CHANNEL_RATE
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class CoreChannelRateVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(20) */
	private String channelCode ;
	
	/** mccGrp : 类型. MCC_GRP: VARCHAR2(20) */
	private String mccGrp ;
	
	/** mcc : MCC. MCC: VARCHAR2(10) */
	private String mcc ;
	
	/** version : VERSION. VERSION: NUMBER(10) */
	private Long version ;
	
	/** remark : 描述. REMARK: VARCHAR2(100) */
	private String remark ;
	
	/** rate : 成本费率. RATE: NUMBER(5) */
	private Long rate ;
	
	/** maxFee : 成本封顶值. MAX_FEE: NUMBER(12) */
	private Long maxFee ;
	
	/** chnlRatio : 服务商占比. CHNL_RATIO: NUMBER(5) */
	private Long chnlRatio ;
	
	/** lastUpdAcct : 最后更新用户. LAST_UPD_ACCT: VARCHAR2(30) */
	private String lastUpdAcct ;
	
	/** lastUpdTime : 最后更新时间. LAST_UPD_TIME: VARCHAR2(14) */
	private String lastUpdTime ; 
	
	/** debitRate : 借记卡_成本费率. DEBIT_RATE: NUMBER(5) */
	private Long debitRate ;
	
	/** debitMaxFee : 借记卡_成本封顶值. DEBIT_MAX_FEE: NUMBER(12) */
	private Long debitMaxFee ;
	
	/** debitChnlRatio : 借记卡_服务商占比. DEBIT_CHNL_RATIO: NUMBER(5) */
	private Long debitChnlRatio ;
	
	/** creditRate : 贷记卡_成本费率. CREDIT_RATE: NUMBER(5) */
	private Long creditRate ;
	
	/** creditMaxFee : 贷记卡_成本封顶值. CREDIT_MAX_FEE: NUMBER(12) */
	private Long creditMaxFee ;
	
	/** creditChnlRatio : 贷记卡_服务商占比. CREDIT_CHNL_RATIO: NUMBER(5) */
	private Long creditChnlRatio ;
	
	// -- Extended --
	/** mccDesc : MCC描述. */
	private String mccDesc;
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public CoreChannelRateVo() {
		// Default Construtor
	}
	
	public CoreChannelRateVo(String channelCode, String mccGrp, String mcc) {
		this.channelCode = channelCode;
		this.mccGrp = mccGrp;
		this.mcc = mcc;
	}
		
	// -- Setter And Getter
	/**
	 * Set channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(20) 
	 */
	public void setChannelCode(String channelCode){
		this.channelCode = channelCode;	
	}
	
	/**
	 * Get channelCode : 服务商编号. CHANNEL_CODE: VARCHAR2(20) 
	 */
	public String getChannelCode(){
		return this.channelCode;	
	}
	
	/**
	 * Set mccGrp : 类型. MCC_GRP: VARCHAR2(20) 
	 */
	public void setMccGrp(String mccGrp){
		this.mccGrp = mccGrp;	
	}
	
	/**
	 * Get mccType : 类型. MCC_TYPE: VARCHAR2(20) 
	 */
	public String getMccGrp(){
		return this.mccGrp;	
	}
	
	/**
	 * Set mcc : MCC. MCC: VARCHAR2(10) 
	 */
	public void setMcc(String mcc){
		this.mcc = mcc;	
	}
	
	/**
	 * Get mcc : MCC. MCC: VARCHAR2(10) 
	 */
	public String getMcc(){
		return this.mcc;	
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
	 * Set remark : 描述. REMARK: VARCHAR2(100) 
	 */
	public void setRemark(String remark){
		this.remark = remark;	
	}
	
	/**
	 * Get remark : 描述. REMARK: VARCHAR2(100) 
	 */
	public String getRemark(){
		return this.remark;	
	}
	
	/**
	 * Set rate : 成本费率. RATE: NUMBER(5) 
	 */
	public void setRate(Long rate){
		this.rate = rate;	
	}
	
	/**
	 * Get rate : 成本费率. RATE: NUMBER(5) 
	 */
	public Long getRate(){
		return this.rate;	
	}
	
	/**
	 * Set maxFee : 成本封顶值. MAX_FEE: NUMBER(12) 
	 */
	public void setMaxFee(Long maxFee){
		this.maxFee = maxFee;	
	}
	
	/**
	 * Get maxFee : 成本封顶值. MAX_FEE: NUMBER(12) 
	 */
	public Long getMaxFee(){
		return this.maxFee;	
	}
	
	/**
	 * Set chnlRatio : 服务商占比. CHNL_RATIO: NUMBER(5) 
	 */
	public void setChnlRatio(Long chnlRatio){
		this.chnlRatio = chnlRatio;	
	}
	
	/**
	 * Get chnlRatio : 服务商占比. CHNL_RATIO: NUMBER(5) 
	 */
	public Long getChnlRatio(){
		return this.chnlRatio;	
	}
	
	/**
	 * Set lastUpdAcct : 最后更新用户. LAST_UPD_ACCT: VARCHAR2(30) 
	 */
	public void setLastUpdAcct(String lastUpdAcct){
		this.lastUpdAcct = lastUpdAcct;	
	}
	
	/**
	 * Get lastUpdAcct : 最后更新用户. LAST_UPD_ACCT: VARCHAR2(30) 
	 */
	public String getLastUpdAcct(){
		return this.lastUpdAcct;	
	}
	
	/**
	 * Set lastUpdTime : 最后更新时间. LAST_UPD_TIME: VARCHAR2(14) 
	 */
	public void setLastUpdTime(String lastUpdTime){
		this.lastUpdTime = lastUpdTime;	
	}
	
	/**
	 * Get lastUpdTime : 最后更新时间. LAST_UPD_TIME: VARCHAR2(14) 
	 */
	public String getLastUpdTime(){
		return this.lastUpdTime;	
	}

	/**
	 * @return the mccDesc
	 */
	public String getMccDesc() {
		return mccDesc;
	}

	/**
	 * @param mccDesc the mccDesc to set
	 */
	public void setMccDesc(String mccDesc) {
		this.mccDesc = mccDesc;
	}
	
	/**
	 * Set debitRate : 借记卡_成本费率. DEBIT_RATE: NUMBER(5) 
	 */
	public void setDebitRate(Long debitRate){
		this.debitRate = debitRate;	
	}
	
	/**
	 * Get debitRate : 借记卡_成本费率. DEBIT_RATE: NUMBER(5) 
	 */
	public Long getDebitRate(){
		return this.debitRate;	
	}
	
	/**
	 * Set debitMaxFee : 借记卡_成本封顶值. DEBIT_MAX_FEE: NUMBER(12) 
	 */
	public void setDebitMaxFee(Long debitMaxFee){
		this.debitMaxFee = debitMaxFee;	
	}
	
	/**
	 * Get debitMaxFee : 借记卡_成本封顶值. DEBIT_MAX_FEE: NUMBER(12) 
	 */
	public Long getDebitMaxFee(){
		return this.debitMaxFee;	
	}
	
	/**
	 * Set debitChnlRatio : 借记卡_服务商占比. DEBIT_CHNL_RATIO: NUMBER(5) 
	 */
	public void setDebitChnlRatio(Long debitChnlRatio){
		this.debitChnlRatio = debitChnlRatio;	
	}
	
	/**
	 * Get debitChnlRatio : 借记卡_服务商占比. DEBIT_CHNL_RATIO: NUMBER(5) 
	 */
	public Long getDebitChnlRatio(){
		return this.debitChnlRatio;	
	}
	
	/**
	 * Set creditRate : 贷记卡_成本费率. CREDIT_RATE: NUMBER(5) 
	 */
	public void setCreditRate(Long creditRate){
		this.creditRate = creditRate;	
	}
	
	/**
	 * Get creditRate : 贷记卡_成本费率. CREDIT_RATE: NUMBER(5) 
	 */
	public Long getCreditRate(){
		return this.creditRate;	
	}
	
	/**
	 * Set creditMaxFee : 贷记卡_成本封顶值. CREDIT_MAX_FEE: NUMBER(12) 
	 */
	public void setCreditMaxFee(Long creditMaxFee){
		this.creditMaxFee = creditMaxFee;	
	}
	
	/**
	 * Get creditMaxFee : 贷记卡_成本封顶值. CREDIT_MAX_FEE: NUMBER(12) 
	 */
	public Long getCreditMaxFee(){
		return this.creditMaxFee;	
	}
	
	/**
	 * Set creditChnlRatio : 贷记卡_服务商占比. CREDIT_CHNL_RATIO: NUMBER(5) 
	 */
	public void setCreditChnlRatio(Long creditChnlRatio){
		this.creditChnlRatio = creditChnlRatio;	
	}
	
	/**
	 * Get creditChnlRatio : 贷记卡_服务商占比. CREDIT_CHNL_RATIO: NUMBER(5) 
	 */
	public Long getCreditChnlRatio(){
		return this.creditChnlRatio;	
	}
}