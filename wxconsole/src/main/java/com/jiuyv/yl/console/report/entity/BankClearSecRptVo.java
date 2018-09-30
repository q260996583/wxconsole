package com.jiuyv.yl.console.report.entity;

import java.math.BigDecimal;

public class BankClearSecRptVo {
//  报表名称
	private String theName;
//	起始时间
	private String firstDate;
//	终止时间
	private String lastDate;
//	清算起始日
	private String bgDate;
//	清算结束日
	private String endDate;
//	支付机构名称
	private String bankName;
//	支付机构代码
	private String bankId;
//  交易代码
	private String transCode;
//  交易类型
	private String transType;
//  MCC码
	private String mcc;	
//	行业类别
	private String mccDesc;
//	总费率
	private Long rate;	
//	总费率页面显示数值
	private BigDecimal rateBackup;		
//  商户编码
	private String mid;
//  商户名称
	private String merName;	
//  终端数	
	private Long ter;
	
//	交易量
	private Long txn;
//	交易额
	private Long money;
//  外部手续费
	private Long outerFee;
	
//  退货交易量
	private Long backCnt;
//  退货交易金额
	private Long backAmt;
//  退货外部手续费
	private Long backOuterFee;

//  轧差交易量
	private Long difCnt;
//  轧差交易金额
	private Long difAmt;
//  轧差外部手续费
	private Long difOuterFee;
//  支付机构清算额
	private Long payFee;
//  手续费封顶值	
	private String maxFee;
	
	/** mccGrp : 商户类别. MCC_GRP: VARCHAR2(4) */
	private String mccGrp ;
	/** mccGrpDesc : 商户类别描述. */
	private String mccGrpDesc;
	
	
	public String getTheName() {
		return theName;
	}
	public void setTheName(String theName) {
		this.theName = theName;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getBgDate() {
		return bgDate;
	}
	public void setBgDate(String bgDate) {
		this.bgDate = bgDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getTransCode() {
		return transCode;
	}
	public void setTransCode(String transCode) {
		this.transCode = transCode;
	}
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public String getMcc() {
		return mcc;
	}
	public void setMcc(String mcc) {
		this.mcc = mcc;
	}
	public String getMccDesc() {
		return mccDesc;
	}
	public void setMccDesc(String mccDesc) {
		this.mccDesc = mccDesc;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMerName() {
		return merName;
	}
	public void setMerName(String merName) {
		this.merName = merName;
	}
	public Long getTer() {
		return ter;
	}
	public void setTer(Long ter) {
		this.ter = ter;
	}
	public Long getTxn() {
		return txn;
	}
	public void setTxn(Long txn) {
		this.txn = txn;
	}
	public Long getMoney() {
		return money;
	}
	public void setMoney(Long money) {
		this.money = money;
	}
	public Long getOuterFee() {
		return outerFee;
	}
	public void setOuterFee(Long outerFee) {
		this.outerFee = outerFee;
	}
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public Long getRate() {
		return rate;
	}
	public void setRate(Long rate) {
		this.rate = rate;
	}
	public BigDecimal getRateBackup() {
		return rateBackup;
	}
	public void setRateBackup(BigDecimal rateBackup) {
		this.rateBackup = rateBackup;
	}
	public Long getBackCnt() {
		return backCnt;
	}
	public void setBackCnt(Long backCnt) {
		this.backCnt = backCnt;
	}
	public Long getBackAmt() {
		return backAmt;
	}
	public void setBackAmt(Long backAmt) {
		this.backAmt = backAmt;
	}
	public Long getBackOuterFee() {
		return backOuterFee;
	}
	public void setBackOuterFee(Long backOuterFee) {
		this.backOuterFee = backOuterFee;
	}
	public Long getDifCnt() {
		return difCnt;
	}
	public void setDifCnt(Long difCnt) {
		this.difCnt = difCnt;
	}
	public Long getDifAmt() {
		return difAmt;
	}
	public void setDifAmt(Long difAmt) {
		this.difAmt = difAmt;
	}
	public Long getDifOuterFee() {
		return difOuterFee;
	}
	public void setDifOuterFee(Long difOuterFee) {
		this.difOuterFee = difOuterFee;
	}
	public Long getPayFee() {
		return payFee;
	}
	public void setPayFee(Long payFee) {
		this.payFee = payFee;
	}
	/**
	 * @return the maxFee
	 */
	public String getMaxFee() {
		return maxFee;
	}
	/**
	 * @param maxFee the maxFee to set
	 */
	public void setMaxFee(String maxFee) {
		this.maxFee = maxFee;
	}
	/**
	 * @return the mccGrp
	 */
	public String getMccGrp() {
		return mccGrp;
	}
	/**
	 * @param mccGrp the mccGrp to set
	 */
	public void setMccGrp(String mccGrp) {
		this.mccGrp = mccGrp;
	}
	/**
	 * @return the mccGrpDesc
	 */
	public String getMccGrpDesc() {
		return mccGrpDesc;
	}
	/**
	 * @param mccGrpDesc the mccGrpDesc to set
	 */
	public void setMccGrpDesc(String mccGrpDesc) {
		this.mccGrpDesc = mccGrpDesc;
	}
	
}
