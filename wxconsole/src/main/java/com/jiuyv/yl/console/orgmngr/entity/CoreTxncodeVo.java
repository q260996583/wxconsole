package com.jiuyv.yl.console.orgmngr.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 交易代码表   TBL_CORE_TXNCODE : TBL_CORE_TXNCODE
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class CoreTxncodeVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** appId : 应用ID. APP_ID: VARCHAR2(4) */
	private String appId ;
	
	/** txnCode : 交易代码. TXN_CODE: VARCHAR2(6) */
	private String txnCode ;
	
	/** txnName : 交易名称. TXN_NAME: VARCHAR2(60) */
	private String txnName ;
	
	/** msgTypeReq : 请求消息类型. MSG_TYPE_REQ: VARCHAR2(10) */
	private String msgTypeReq ;
	
	/** msgTypeRsp : 应答消息类型. MSG_TYPE_RSP: VARCHAR2(10) */
	private String msgTypeRsp ;
	
	/** procCode : 处理码. PROC_CODE: VARCHAR2(6) */
	private String procCode ;
	
	/** condCode : 服务点条件码. COND_CODE: VARCHAR2(2) */
	private String condCode ;
	
	/** txnTypeCode : 交易类型码. TXN_TYPE_CODE: VARCHAR2(2) */
	private String txnTypeCode ;
	
	/** netCode : 网络管理信息码. NET_CODE: VARCHAR2(3) */
	private String netCode ;
	
	/** reqMinBitmap : 请求最小位图. REQ_MIN_BITMAP: VARCHAR2(32) */
	private String reqMinBitmap ;
	
	/** reqMaxBitmap : 请求最大位图. REQ_MAX_BITMAP: VARCHAR2(32) */
	private String reqMaxBitmap ;
	
	/** resBitmap : 响应位图. RES_BITMAP: VARCHAR2(32) */
	private String resBitmap ;
	
	/** rejBitmap : 拒绝位图. REJ_BITMAP: VARCHAR2(32) */
	private String rejBitmap ;
	
	/** ckReqBitmap : 检查请求位图标识. CK_REQ_BITMAP: VARCHAR2(2) */
	private String ckReqBitmap ;
	
	/** ckMacSign : MAC验证标识. CK_MAC_SIGN: VARCHAR2(2) */
	private String ckMacSign ;
	
	/** ckCnlSign : 撤销交易标识. CK_CNL_SIGN: VARCHAR2(2) */
	private String ckCnlSign ;
	
	/** oldTxnCode : 原交易代码. OLD_TXN_CODE: VARCHAR2(6) */
	private String oldTxnCode ;
	
	/** oldMsgType : 原消息类型. OLD_MSG_TYPE: VARCHAR2(4) */
	private String oldMsgType ;
	
	/** recSign : 流水记录标识. REC_SIGN: VARCHAR2(2) */
	private String recSign ;
	
	/** ckAuthSign : 预授权标识. CK_AUTH_SIGN: VARCHAR2(2) */
	private String ckAuthSign ;
	
	/** dupHandle : 重复流水处理. DUP_HANDLE: VARCHAR2(2) */
	private String dupHandle ;
	
	/** errHandle : 交易失败处理. ERR_HANDLE: VARCHAR2(2) */
	private String errHandle ;
	
	/** stlmSign : 清算标识. STLM_SIGN: VARCHAR2(2) */
	private String stlmSign ;
	
	/** merPointSign : 商户积分标识. MER_POINT_SIGN: VARCHAR2(2) */
	private String merPointSign ;
	
	/** lotSign : 抽奖标识. LOT_SIGN: VARCHAR2(2) */
	private String lotSign ;
	
	/** busiType : 业务类型. BUSI_TYPE: VARCHAR2(2) */
	private String busiType ;
	
	/** status : 状态. STATUS: VARCHAR2(2) */
	private String status ;
	
	/** settleType : 批结算类型. SETTLE_TYPE: VARCHAR2(2) */
	private String settleType ;
	
	/** transType : 交易类型. TRANS_TYPE: VARCHAR2(2) */
	private String transType ;
	
	private boolean check;
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public CoreTxncodeVo() {
		// Default Construtor
	}
	
	public CoreTxncodeVo(String appId, String txnCode) {
		this.appId = appId;
		this.txnCode = txnCode;
	}
		
	// -- Setter And Getter
	/**
	 * Set appId : 应用ID. APP_ID: VARCHAR2(4) 
	 */
	public void setAppId(String appId){
		this.appId = appId;	
	}
	
	/**
	 * Get appId : 应用ID. APP_ID: VARCHAR2(4) 
	 */
	public String getAppId(){
		return this.appId;	
	}
	
	/**
	 * Set txnCode : 交易代码. TXN_CODE: VARCHAR2(6) 
	 */
	public void setTxnCode(String txnCode){
		this.txnCode = txnCode;	
	}
	
	/**
	 * Get txnCode : 交易代码. TXN_CODE: VARCHAR2(6) 
	 */
	public String getTxnCode(){
		return this.txnCode;	
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
	 * Set msgTypeRsp : 应答消息类型. MSG_TYPE_RSP: VARCHAR2(10) 
	 */
	public void setMsgTypeRsp(String msgTypeRsp){
		this.msgTypeRsp = msgTypeRsp;	
	}
	
	/**
	 * Get msgTypeRsp : 应答消息类型. MSG_TYPE_RSP: VARCHAR2(10) 
	 */
	public String getMsgTypeRsp(){
		return this.msgTypeRsp;	
	}
	
	/**
	 * Set procCode : 处理码. PROC_CODE: VARCHAR2(6) 
	 */
	public void setProcCode(String procCode){
		this.procCode = procCode;	
	}
	
	/**
	 * Get procCode : 处理码. PROC_CODE: VARCHAR2(6) 
	 */
	public String getProcCode(){
		return this.procCode;	
	}
	
	/**
	 * Set condCode : 服务点条件码. COND_CODE: VARCHAR2(2) 
	 */
	public void setCondCode(String condCode){
		this.condCode = condCode;	
	}
	
	/**
	 * Get condCode : 服务点条件码. COND_CODE: VARCHAR2(2) 
	 */
	public String getCondCode(){
		return this.condCode;	
	}
	
	/**
	 * Set txnTypeCode : 交易类型码. TXN_TYPE_CODE: VARCHAR2(2) 
	 */
	public void setTxnTypeCode(String txnTypeCode){
		this.txnTypeCode = txnTypeCode;	
	}
	
	/**
	 * Get txnTypeCode : 交易类型码. TXN_TYPE_CODE: VARCHAR2(2) 
	 */
	public String getTxnTypeCode(){
		return this.txnTypeCode;	
	}
	
	/**
	 * Set netCode : 网络管理信息码. NET_CODE: VARCHAR2(3) 
	 */
	public void setNetCode(String netCode){
		this.netCode = netCode;	
	}
	
	/**
	 * Get netCode : 网络管理信息码. NET_CODE: VARCHAR2(3) 
	 */
	public String getNetCode(){
		return this.netCode;	
	}
	
	/**
	 * Set reqMinBitmap : 请求最小位图. REQ_MIN_BITMAP: VARCHAR2(32) 
	 */
	public void setReqMinBitmap(String reqMinBitmap){
		this.reqMinBitmap = reqMinBitmap;	
	}
	
	/**
	 * Get reqMinBitmap : 请求最小位图. REQ_MIN_BITMAP: VARCHAR2(32) 
	 */
	public String getReqMinBitmap(){
		return this.reqMinBitmap;	
	}
	
	/**
	 * Set reqMaxBitmap : 请求最大位图. REQ_MAX_BITMAP: VARCHAR2(32) 
	 */
	public void setReqMaxBitmap(String reqMaxBitmap){
		this.reqMaxBitmap = reqMaxBitmap;	
	}
	
	/**
	 * Get reqMaxBitmap : 请求最大位图. REQ_MAX_BITMAP: VARCHAR2(32) 
	 */
	public String getReqMaxBitmap(){
		return this.reqMaxBitmap;	
	}
	
	/**
	 * Set resBitmap : 响应位图. RES_BITMAP: VARCHAR2(32) 
	 */
	public void setResBitmap(String resBitmap){
		this.resBitmap = resBitmap;	
	}
	
	/**
	 * Get resBitmap : 响应位图. RES_BITMAP: VARCHAR2(32) 
	 */
	public String getResBitmap(){
		return this.resBitmap;	
	}
	
	/**
	 * Set rejBitmap : 拒绝位图. REJ_BITMAP: VARCHAR2(32) 
	 */
	public void setRejBitmap(String rejBitmap){
		this.rejBitmap = rejBitmap;	
	}
	
	/**
	 * Get rejBitmap : 拒绝位图. REJ_BITMAP: VARCHAR2(32) 
	 */
	public String getRejBitmap(){
		return this.rejBitmap;	
	}
	
	/**
	 * Set ckReqBitmap : 检查请求位图标识. CK_REQ_BITMAP: VARCHAR2(2) 
	 */
	public void setCkReqBitmap(String ckReqBitmap){
		this.ckReqBitmap = ckReqBitmap;	
	}
	
	/**
	 * Get ckReqBitmap : 检查请求位图标识. CK_REQ_BITMAP: VARCHAR2(2) 
	 */
	public String getCkReqBitmap(){
		return this.ckReqBitmap;	
	}
	
	/**
	 * Set ckMacSign : MAC验证标识. CK_MAC_SIGN: VARCHAR2(2) 
	 */
	public void setCkMacSign(String ckMacSign){
		this.ckMacSign = ckMacSign;	
	}
	
	/**
	 * Get ckMacSign : MAC验证标识. CK_MAC_SIGN: VARCHAR2(2) 
	 */
	public String getCkMacSign(){
		return this.ckMacSign;	
	}
	
	/**
	 * Set ckCnlSign : 撤销交易标识. CK_CNL_SIGN: VARCHAR2(2) 
	 */
	public void setCkCnlSign(String ckCnlSign){
		this.ckCnlSign = ckCnlSign;	
	}
	
	/**
	 * Get ckCnlSign : 撤销交易标识. CK_CNL_SIGN: VARCHAR2(2) 
	 */
	public String getCkCnlSign(){
		return this.ckCnlSign;	
	}
	
	/**
	 * Set oldTxnCode : 原交易代码. OLD_TXN_CODE: VARCHAR2(6) 
	 */
	public void setOldTxnCode(String oldTxnCode){
		this.oldTxnCode = oldTxnCode;	
	}
	
	/**
	 * Get oldTxnCode : 原交易代码. OLD_TXN_CODE: VARCHAR2(6) 
	 */
	public String getOldTxnCode(){
		return this.oldTxnCode;	
	}
	
	/**
	 * Set oldMsgType : 原消息类型. OLD_MSG_TYPE: VARCHAR2(4) 
	 */
	public void setOldMsgType(String oldMsgType){
		this.oldMsgType = oldMsgType;	
	}
	
	/**
	 * Get oldMsgType : 原消息类型. OLD_MSG_TYPE: VARCHAR2(4) 
	 */
	public String getOldMsgType(){
		return this.oldMsgType;	
	}
	
	/**
	 * Set recSign : 流水记录标识. REC_SIGN: VARCHAR2(2) 
	 */
	public void setRecSign(String recSign){
		this.recSign = recSign;	
	}
	
	/**
	 * Get recSign : 流水记录标识. REC_SIGN: VARCHAR2(2) 
	 */
	public String getRecSign(){
		return this.recSign;	
	}
	
	/**
	 * Set ckAuthSign : 预授权标识. CK_AUTH_SIGN: VARCHAR2(2) 
	 */
	public void setCkAuthSign(String ckAuthSign){
		this.ckAuthSign = ckAuthSign;	
	}
	
	/**
	 * Get ckAuthSign : 预授权标识. CK_AUTH_SIGN: VARCHAR2(2) 
	 */
	public String getCkAuthSign(){
		return this.ckAuthSign;	
	}
	
	/**
	 * Set dupHandle : 重复流水处理. DUP_HANDLE: VARCHAR2(2) 
	 */
	public void setDupHandle(String dupHandle){
		this.dupHandle = dupHandle;	
	}
	
	/**
	 * Get dupHandle : 重复流水处理. DUP_HANDLE: VARCHAR2(2) 
	 */
	public String getDupHandle(){
		return this.dupHandle;	
	}
	
	/**
	 * Set errHandle : 交易失败处理. ERR_HANDLE: VARCHAR2(2) 
	 */
	public void setErrHandle(String errHandle){
		this.errHandle = errHandle;	
	}
	
	/**
	 * Get errHandle : 交易失败处理. ERR_HANDLE: VARCHAR2(2) 
	 */
	public String getErrHandle(){
		return this.errHandle;	
	}
	
	/**
	 * Set stlmSign : 清算标识. STLM_SIGN: VARCHAR2(2) 
	 */
	public void setStlmSign(String stlmSign){
		this.stlmSign = stlmSign;	
	}
	
	/**
	 * Get stlmSign : 清算标识. STLM_SIGN: VARCHAR2(2) 
	 */
	public String getStlmSign(){
		return this.stlmSign;	
	}
	
	/**
	 * Set merPointSign : 商户积分标识. MER_POINT_SIGN: VARCHAR2(2) 
	 */
	public void setMerPointSign(String merPointSign){
		this.merPointSign = merPointSign;	
	}
	
	/**
	 * Get merPointSign : 商户积分标识. MER_POINT_SIGN: VARCHAR2(2) 
	 */
	public String getMerPointSign(){
		return this.merPointSign;	
	}
	
	/**
	 * Set lotSign : 抽奖标识. LOT_SIGN: VARCHAR2(2) 
	 */
	public void setLotSign(String lotSign){
		this.lotSign = lotSign;	
	}
	
	/**
	 * Get lotSign : 抽奖标识. LOT_SIGN: VARCHAR2(2) 
	 */
	public String getLotSign(){
		return this.lotSign;	
	}
	
	/**
	 * Set busiType : 业务类型. BUSI_TYPE: VARCHAR2(2) 
	 */
	public void setBusiType(String busiType){
		this.busiType = busiType;	
	}
	
	/**
	 * Get busiType : 业务类型. BUSI_TYPE: VARCHAR2(2) 
	 */
	public String getBusiType(){
		return this.busiType;	
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
	 * Set settleType : 批结算类型. SETTLE_TYPE: VARCHAR2(2) 
	 */
	public void setSettleType(String settleType){
		this.settleType = settleType;	
	}
	
	/**
	 * Get settleType : 批结算类型. SETTLE_TYPE: VARCHAR2(2) 
	 */
	public String getSettleType(){
		return this.settleType;	
	}
	
	/**
	 * Set transType : 交易类型. TRANS_TYPE: VARCHAR2(2) 
	 */
	public void setTransType(String transType){
		this.transType = transType;	
	}
	
	/**
	 * Get transType : 交易类型. TRANS_TYPE: VARCHAR2(2) 
	 */
	public String getTransType(){
		return this.transType;	
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
	
}