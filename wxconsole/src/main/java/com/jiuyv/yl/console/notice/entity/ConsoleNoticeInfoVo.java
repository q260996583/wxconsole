package com.jiuyv.yl.console.notice.entity ;

// Generated by AutoCode4J
/**
 * EntityBean: 综控台公告信息表 TBL_CONSOLE_NOTICE_INFO : TBL_CONSOLE_NOTICE_INFO
 * This is a value object(VO). 
 * Description: 
 * 
 * @author AutoCode4J
 * @version 1.0
 */
public class ConsoleNoticeInfoVo implements java.io.Serializable {

	/** default Serial Version UID*/
	private static final long serialVersionUID = 1L;
	// -- Fields --
	/** noticeSeq : 公告序号. NOTICE_SEQ: NUMBER(10) */
	private Long noticeSeq ;
	
	/** version : VERSION. VERSION: NUMBER(10) */
	private Long version ;
	
	/** title : 标题. TITLE: NVARCHAR2(255) */
	private String title ;
	
	/** groupNo : 部门. GROUP_NO: VARCHAR2(2) */
	private String groupNo ;
	
	/** imgUrl : 图片. IMG_URL: VARCHAR2(256) */
	private String imgUrl ;
	
	/** brief : 简介. BRIEF: NVARCHAR2(400) */
	private String brief ;
	
	/** content : 内容. CONTENT: CLOB */
	private String content ;
	
	/** topFlag : 置顶标识. TOP_FLAG: CHAR(1) */
	private String topFlag ;
	
	/** startTime : 起效时间. START_TIME: CHAR(14) */
	private String startTime ;
	
	/** endTime : 失效时间. END_TIME: CHAR(14) */
	private String endTime ;
	
	/** status : 状态. STATUS: NVARCHAR2(2) */
	private String status ;
	
	/** recCrtTime : 记录创建时间. REC_CRT_TIME: CHAR(14) */
	private String recCrtTime ;
	
	/** recCrtAcc : 记录创建用户帐号. REC_CRT_ACC: NVARCHAR2(30) */
	private String recCrtAcc ;
	
	/** lastUptOrg : 最后更新机构. LAST_UPT_ORG: NVARCHAR2(30) */
	private String lastUptOrg ;
	
	/** lastUptTime : 最后修改时间. LAST_UPT_TIME: CHAR(14) */
	private String lastUptTime ;
	
	/** lastUptAcc : 最后修改用户帐号. LAST_UPT_ACC: NVARCHAR2(30) */
	private String lastUptAcc ;
	
	/** sortNo : 排序. SORT_NO: NUMBER(5) */
	private Long sortNo ;
	
	/** audUser : 审核人. AUD_USER: VARCHAR2(30) */
	private String audUser ;
	
	/** audTime : 审核时间. AUD_TIME: CHAR(14) */
	private String audTime ;
	
	/** audRemark : 审核意见. AUD_REMARK: NVARCHAR2(400) */
	private String audRemark ;
	
	// -- extend --
	/** status : 状态. STATUS: NVARCHAR2(2) */
	private String statusDesc;
	
	private String userStr;
	
	/** 部门 */
	private String groupNoDesc;
	
	/** 用户号 */
	private String userId;
	// -- Constructor --
	/**
	 * Constructor
	 * 
	 */
	public ConsoleNoticeInfoVo() {
		// Default Construtor
	}
	
	public ConsoleNoticeInfoVo(Long noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
		
	// -- Setter And Getter
	/**
	 * Set noticeSeq : 公告序号. NOTICE_SEQ: NUMBER(10) 
	 */
	public void setNoticeSeq(Long noticeSeq){
		this.noticeSeq = noticeSeq;	
	}
	
	/**
	 * Get noticeSeq : 公告序号. NOTICE_SEQ: NUMBER(10) 
	 */
	public Long getNoticeSeq(){
		return this.noticeSeq;	
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
	 * Set title : 标题. TITLE: NVARCHAR2(255) 
	 */
	public void setTitle(String title){
		this.title = title;	
	}
	
	/**
	 * Get title : 标题. TITLE: NVARCHAR2(255) 
	 */
	public String getTitle(){
		return this.title;	
	}
	
	/**
	 * Set groupNo : 部门. GROUP_NO: VARCHAR2(2) 
	 */
	public void setGroupNo(String groupNo){
		this.groupNo = groupNo;	
	}
	
	/**
	 * Get groupNo : 部门. GROUP_NO: VARCHAR2(2) 
	 */
	public String getGroupNo(){
		return this.groupNo;	
	}
	
	/**
	 * Set imgUrl : 图片. IMG_URL: VARCHAR2(256) 
	 */
	public void setImgUrl(String imgUrl){
		this.imgUrl = imgUrl;	
	}
	
	/**
	 * Get imgUrl : 图片. IMG_URL: VARCHAR2(256) 
	 */
	public String getImgUrl(){
		return this.imgUrl;	
	}
	
	/**
	 * Set brief : 简介. BRIEF: NVARCHAR2(400) 
	 */
	public void setBrief(String brief){
		this.brief = brief;	
	}
	
	/**
	 * Get brief : 简介. BRIEF: NVARCHAR2(400) 
	 */
	public String getBrief(){
		return this.brief;	
	}
	
	/**
	 * Set content : 内容. CONTENT: CLOB 
	 */
	public void setContent(String content){
		this.content = content;	
	}
	
	/**
	 * Get content : 内容. CONTENT: CLOB 
	 */
	public String getContent(){
		return this.content;	
	}
	
	/**
	 * Set topFlag : 置顶标识. TOP_FLAG: CHAR(1) 
	 */
	public void setTopFlag(String topFlag){
		this.topFlag = topFlag;	
	}
	
	/**
	 * Get topFlag : 置顶标识. TOP_FLAG: CHAR(1) 
	 */
	public String getTopFlag(){
		return this.topFlag;	
	}
	
	/**
	 * Set startTime : 起效时间. START_TIME: CHAR(14) 
	 */
	public void setStartTime(String startTime){
		this.startTime = startTime;	
	}
	
	/**
	 * Get startTime : 起效时间. START_TIME: CHAR(14) 
	 */
	public String getStartTime(){
		return this.startTime;	
	}
	
	/**
	 * Set endTime : 失效时间. END_TIME: CHAR(14) 
	 */
	public void setEndTime(String endTime){
		this.endTime = endTime;	
	}
	
	/**
	 * Get endTime : 失效时间. END_TIME: CHAR(14) 
	 */
	public String getEndTime(){
		return this.endTime;	
	}
	
	/**
	 * Set status : 状态. STATUS: NVARCHAR2(2) 
	 */
	public void setStatus(String status){
		this.status = status;	
	}
	
	/**
	 * Get status : 状态. STATUS: NVARCHAR2(2) 
	 */
	public String getStatus(){
		return this.status;	
	}
	
	/**
	 * Set recCrtTime : 记录创建时间. REC_CRT_TIME: CHAR(14) 
	 */
	public void setRecCrtTime(String recCrtTime){
		this.recCrtTime = recCrtTime;	
	}
	
	/**
	 * Get recCrtTime : 记录创建时间. REC_CRT_TIME: CHAR(14) 
	 */
	public String getRecCrtTime(){
		return this.recCrtTime;	
	}
	
	/**
	 * Set recCrtAcc : 记录创建用户帐号. REC_CRT_ACC: NVARCHAR2(30) 
	 */
	public void setRecCrtAcc(String recCrtAcc){
		this.recCrtAcc = recCrtAcc;	
	}
	
	/**
	 * Get recCrtAcc : 记录创建用户帐号. REC_CRT_ACC: NVARCHAR2(30) 
	 */
	public String getRecCrtAcc(){
		return this.recCrtAcc;	
	}
	
	/**
	 * Set lastUptOrg : 最后更新机构. LAST_UPT_ORG: NVARCHAR2(30) 
	 */
	public void setLastUptOrg(String lastUptOrg){
		this.lastUptOrg = lastUptOrg;	
	}
	
	/**
	 * Get lastUptOrg : 最后更新机构. LAST_UPT_ORG: NVARCHAR2(30) 
	 */
	public String getLastUptOrg(){
		return this.lastUptOrg;	
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
	 * Set lastUptAcc : 最后修改用户帐号. LAST_UPT_ACC: NVARCHAR2(30) 
	 */
	public void setLastUptAcc(String lastUptAcc){
		this.lastUptAcc = lastUptAcc;	
	}
	
	/**
	 * Get lastUptAcc : 最后修改用户帐号. LAST_UPT_ACC: NVARCHAR2(30) 
	 */
	public String getLastUptAcc(){
		return this.lastUptAcc;	
	}
	
	/**
	 * Set sortNo : 排序. SORT_NO: NUMBER(5) 
	 */
	public void setSortNo(Long sortNo){
		this.sortNo = sortNo;	
	}
	
	/**
	 * Get sortNo : 排序. SORT_NO: NUMBER(5) 
	 */
	public Long getSortNo(){
		return this.sortNo;	
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

	/**
	 * @return the userStr
	 */
	public String getUserStr() {
		return userStr;
	}

	/**
	 * @param userStr the userStr to set
	 */
	public void setUserStr(String userStr) {
		this.userStr = userStr;
	}

	/**
	 * @return the groupNoDesc
	 */
	public String getGroupNoDesc() {
		return groupNoDesc;
	}

	/**
	 * @param groupNoDesc the groupNoDesc to set
	 */
	public void setGroupNoDesc(String groupNoDesc) {
		this.groupNoDesc = groupNoDesc;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}