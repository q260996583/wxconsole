package com.jiuyv.yl.console.orgmngr.entity;

/**
 * 新增终端二维码信息
 * @author wxb
 *
 */

public class CoreTidQrcodeVo {
	
	private Long version;//version
	private String tid ; //终端号
	private String mid ; //商户号
	private String qrcodeSeq;  //主键
	private String person ; //联系人
	private String phone;  //联系电话
	private String workTime;  //工作时间
	private String openTime;  //启用时间
	private String stopTime ; //注销时间
	private String address ; //终端安装地址
	private String status ;  //二维码状态 00正常 
	private String confStat;  //二维码审批状态 00申请 01 业务通过 02 风控通过
	private String tranLimit ; //单笔交易限额
	private String dayTranLimit;  //日交易限额
	private String tranLimitParam;  //交易限额控制参数
	private String oprAcc;  //二维码录入人
	private String oprTime;  //录入时间
	private String confAcc;  //审批人
	private String confTime;  //审批时间
	private String confRmk;  //审批意见
	private byte[] content;  //BLOB 二维码图片
	private String remark; 
	private String reserved1;
	private String lastUptTime;  //最后更新时间
	private String lastUptAcc;  //最后更新用户
	private String terminalType;  //04 代表二维码
	private String instStatus;
	
	private String rTid ; //真实终端号
	private String rMid ; //真实商户号
	
	
	
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
		this.version = version;
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
	public String getQrcodeSeq() {
		return qrcodeSeq;
	}
	public void setQrcodeSeq(String qrcodeSeq) {
		this.qrcodeSeq = qrcodeSeq;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getConfStat() {
		return confStat;
	}
	public void setConfStat(String confStat) {
		this.confStat = confStat;
	}
	public String getTranLimit() {
		return tranLimit;
	}
	public void setTranLimit(String tranLimit) {
		this.tranLimit = tranLimit;
	}
	public String getDayTranLimit() {
		return dayTranLimit;
	}
	public void setDayTranLimit(String dayTranLimit) {
		this.dayTranLimit = dayTranLimit;
	}
	public String getTranLimitParam() {
		return tranLimitParam;
	}
	public void setTranLimitParam(String tranLimitParam) {
		this.tranLimitParam = tranLimitParam;
	}
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
	public String getConfAcc() {
		return confAcc;
	}
	public void setConfAcc(String confAcc) {
		this.confAcc = confAcc;
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
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getReserved1() {
		return reserved1;
	}
	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}
	public String getLastUptTime() {
		return lastUptTime;
	}
	public void setLastUptTime(String lastUptTime) {
		this.lastUptTime = lastUptTime;
	}
	public String getLastUptAcc() {
		return lastUptAcc;
	}
	public void setLastUptAcc(String lastUptAcc) {
		this.lastUptAcc = lastUptAcc;
	}
	public String getTerminalType() {
		return terminalType;
	}
	public void setTerminalType(String terminalType) {
		this.terminalType = terminalType;
	}
	public String getInstStatus() {
		return instStatus;
	}
	public void setInstStatus(String instStatus) {
		this.instStatus = instStatus;
	}
	public String getrTid() {
		return rTid;
	}
	public void setrTid(String rTid) {
		this.rTid = rTid;
	}
	public String getrMid() {
		return rMid;
	}
	public void setrMid(String rMid) {
		this.rMid = rMid;
	}
	
	
	

}
