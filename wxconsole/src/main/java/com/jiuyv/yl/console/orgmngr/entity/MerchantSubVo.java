package com.jiuyv.yl.console.orgmngr.entity;

public class MerchantSubVo {
	
	private String bankCode;
	private String bankName;
	private String merCode;
	private String merOutCode;
	private String merOutCodeNew;
	
	private String merName;
	
	//外部标识码(32)
	private String  merOutAcqInst;
	//对银联的商户类别码（MCC）
	private String mccCups;
	//受卡方名称(43)
	private String cardAcceptName;
	//特殊计费类型(银60.3.1）
	private String sepclachargeType;
	//特殊计费级别(银60.3.2）
	private String sepclachargeLevel;
	//位商户扣率，值为扣率*10000(122.1)
	private String busiDeductionRate;
	//起效清算日
	private String startDate;
	//失效清算日
	private String endDate;
	//状态
	private String statue;
	//RSV1
	private String rsv1;
	//RSV2
	private String rsv2;
	//最后更新时间
	private String lastUpdTime;
	//最后更新账户
	private String lastUpdAcc;
	//最后更新机构
	private String lastUpdOrg;
	//版本
	private String version;
	//状态
		private String statueZh;
	
	
	public String getStatueZh() {
			return statueZh;
		}
		public void setStatueZh(String statueZh) {
			this.statueZh = statueZh;
		}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getMerOutAcqInst() {
		return merOutAcqInst;
	}
	public void setMerOutAcqInst(String merOutAcqInst) {
		this.merOutAcqInst = merOutAcqInst;
	}
	public String getMccCups() {
		return mccCups;
	}
	public void setMccCups(String mccCups) {
		this.mccCups = mccCups;
	}
	public String getCardAcceptName() {
		return cardAcceptName;
	}
	public void setCardAcceptName(String cardAcceptName) {
		this.cardAcceptName = cardAcceptName;
	}
	public String getSepclachargeType() {
		return sepclachargeType;
	}
	public void setSepclachargeType(String sepclachargeType) {
		this.sepclachargeType = sepclachargeType;
	}
	public String getSepclachargeLevel() {
		return sepclachargeLevel;
	}
	public void setSepclachargeLevel(String sepclachargeLevel) {
		this.sepclachargeLevel = sepclachargeLevel;
	}
	public String getBusiDeductionRate() {
		return busiDeductionRate;
	}
	public void setBusiDeductionRate(String busiDeductionRate) {
		this.busiDeductionRate = busiDeductionRate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStatue() {
		return statue;
	}
	public void setStatue(String statue) {
		this.statue = statue;
	}
	public String getRsv1() {
		return rsv1;
	}
	public void setRsv1(String rsv1) {
		this.rsv1 = rsv1;
	}
	public String getRsv2() {
		return rsv2;
	}
	public void setRsv2(String rsv2) {
		this.rsv2 = rsv2;
	}
	public String getLastUpdTime() {
		return lastUpdTime;
	}
	public void setLastUpdTime(String lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}
	public String getLastUpdAcc() {
		return lastUpdAcc;
	}
	public void setLastUpdAcc(String lastUpdAcc) {
		this.lastUpdAcc = lastUpdAcc;
	}
	public String getLastUpdOrg() {
		return lastUpdOrg;
	}
	public void setLastUpdOrg(String lastUpdOrg) {
		this.lastUpdOrg = lastUpdOrg;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getMerCode() {
		return merCode;
	}
	public void setMerCode(String merCode) {
		this.merCode = merCode;
	}
	public String getMerOutCode() {
		return merOutCode;
	}
	public void setMerOutCode(String merOutCode) {
		this.merOutCode = merOutCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getMerName() {
		return merName;
	}
	public void setMerName(String merName) {
		this.merName = merName;
	}
	public String getMerOutCodeNew() {
		return merOutCodeNew;
	}
	public void setMerOutCodeNew(String merOutCodeNew) {
		this.merOutCodeNew = merOutCodeNew;
	}

}
