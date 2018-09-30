package com.jiuyv.yl.console.orgmngr.entity;


/**
 * 新增终端实体信息
 * @author Administrator
 *
 */
public class CoreTidinfoVo {
	
	private Long version;//version
	private String tid;//终端号
	private String mid;//商户号
	private String charge;//流量费（分）          
	private String tidBrand;//终端品牌
	private String tidType;//终端类型
	private String tidModel;//终端型号
	private String updDate;//录入终端时间
	private String address;//安装地址
	
	private String chargeType;//流量费收取方式
	private String reserved1;//保留域1 SIM卡号
	private String reserved2;//保留域2
	private String reserved3;//保留域3
	
	private String status;//终端转状态，0是初始状态，1是审批通过
	
	private String tidTypeZh;//终端类型中文
	private String statusZh;//终端状态中文
	private String chargeTypeZh;//流量费收取方式中文
	private String monthFlowFee;
	
	private String snCode;
	
	public String getReserved1() {
		return reserved1;
	}
	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}
	public String getReserved2() {
		return reserved2;
	}
	public void setReserved2(String reserved2) {
		this.reserved2 = reserved2;
	}
	public String getReserved3() {
		return reserved3;
	}
	public void setReserved3(String reserved3) {
		this.reserved3 = reserved3;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	
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

	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getTidBrand() {
		return tidBrand;
	}
	public void setTidBrand(String tidBrand) {
		this.tidBrand = tidBrand;
	}

	public String getTidType() {
		return tidType;
	}
	public void setTidType(String tidType) {
		this.tidType = tidType;
	}
	public String getTidModel() {
		return tidModel;
	}
	public void setTidModel(String tidModel) {
		this.tidModel = tidModel;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
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
	public String getTidTypeZh() {
		return tidTypeZh;
	}
	public void setTidTypeZh(String tidTypeZh) {
		this.tidTypeZh = tidTypeZh;
	}
	public String getStatusZh() {
		return statusZh;
	}
	public void setStatusZh(String statusZh) {
		this.statusZh = statusZh;
	}
	public String getChargeTypeZh() {
		return chargeTypeZh;
	}
	public void setChargeTypeZh(String chargeTypeZh) {
		this.chargeTypeZh = chargeTypeZh;
	}
	public String getMonthFlowFee() {
		return monthFlowFee;
	}
	public void setMonthFlowFee(String monthFlowFee) {
		this.monthFlowFee = monthFlowFee;
	}
	/**
	 * @return the snCode
	 */
	public String getSnCode() {
		return snCode;
	}
	/**
	 * @param snCode the snCode to set
	 */
	public void setSnCode(String snCode) {
		this.snCode = snCode;
	}
	
}