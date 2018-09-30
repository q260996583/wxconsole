package com.jiuyv.yl.console.orgmngr.entity;
/**
 * 虚拟外部机具信息表Vo
 * @author Administrator
 *
 */
public class MerOuterTidVo {
	private String version;//VERSION
	private String bankCode;//银行
	private String tid;//终端号
	private String mid;//商户号
	private String tidOut;//外部终端号
	private String merOutCode;//外部银行商户号
	private String tidOutStlm;//外部终端对帐号
	private String status;//终端状态
	private String statusZh;//终端状态中文
	
	private String key;//加密之后的秘钥
	
	private String keyStatusZh;//是否已经获取了秘钥
	private String keyStatus;//秘钥状态，1已经获取，0没有获取
	
	private String confStat;//审核状态
	private String confStatZh;//审核状态中文
	
	private String confTime;//审批时间
	private String confRmk;//审批意见
	private String confAcc;//审批人
	
	private String oprAcc;//录入人
	private String oprTime;//录入时间
	private String remark;//备注
	
	
	
	
	public String getOprAcc() {
		return oprAcc;
	}
	public void setOprAcc(String oprAcc) {
		this.oprAcc = oprAcc;
	}
	public String getOprTime() {
		return oprTime;
	}
	public void setOprTime(String oprTime) {
		this.oprTime = oprTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getConfStat() {
		return confStat;
	}
	public void setConfStat(String confStat) {
		this.confStat = confStat;
	}
	public String getConfStatZh() {
		return confStatZh;
	}
	public void setConfStatZh(String confStatZh) {
		this.confStatZh = confStatZh;
	}
	public String getConfTime() {
		return confTime;
	}
	public void setConfTime(String confTime) {
		this.confTime = confTime;
	}
	public String getConfRmk() {
		return confRmk;
	}
	public void setConfRmk(String confRmk) {
		this.confRmk = confRmk;
	}
	public String getConfAcc() {
		return confAcc;
	}
	public void setConfAcc(String confAcc) {
		this.confAcc = confAcc;
	}
	public String getKeyStatus() {
		return keyStatus;
	}
	public void setKeyStatus(String keyStatus) {
		this.keyStatus = keyStatus;
	}
	public String getKeyStatusZh() {
		return keyStatusZh;
	}
	public void setKeyStatusZh(String keyStatusZh) {
		this.keyStatusZh = keyStatusZh;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getStatusZh() {
		return statusZh;
	}
	public void setStatusZh(String statusZh) {
		this.statusZh = statusZh;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTidOut() {
		return tidOut;
	}
	public void setTidOut(String tidOut) {
		this.tidOut = tidOut;
	}
	public String getMerOutCode() {
		return merOutCode;
	}
	public void setMerOutCode(String merOutCode) {
		this.merOutCode = merOutCode;
	}
	public String getTidOutStlm() {
		return tidOutStlm;
	}
	public void setTidOutStlm(String tidOutStlm) {
		this.tidOutStlm = tidOutStlm;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
