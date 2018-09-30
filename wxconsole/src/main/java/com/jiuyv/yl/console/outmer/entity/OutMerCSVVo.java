package com.jiuyv.yl.console.outmer.entity;

/**
 * 导出CSV文件用Vo
 * */
public class OutMerCSVVo {
	
	// 1.导入标识
	// I表示增加，U表示修改，D表示删除
	private String exportFlag;
	
	// 2.外部商户号(银联)
	private String mid;
	
	// 3.商户服务类型
	private String merType;
		
	// 4.商户名称
	private String merName;
	
	// 5.商户对外经营名称
	private String merOutName;
	
	// 6.收单机构号码
	// 要十位，收单机构代码前加入08
	private String sysOrgCode;
	
	// 7.国家代码
	private String countryCode;
	
	// 8.地区代码
	private String areaCode;
	
	// 9.MCC码
	private String mcc;
	
	// 10.企业性质
	private String etpsAttr;
	
	// 11.商户状态
	// 0表示注销，1表示启用，2表示冻结
	private String mchntStatus;
	
	// 12.营业证明文件类型
	private String netMchntSvcTp;
	
	// 13.营业执照号码
	private String licenseNo;
	
	// 14.商户经营地址
	private String licenseAddr;
	
	// 15.商户注册地址
	private String address;
	
	// 16.商户英文名称
	private String enName;
	
	// 17.法人代表姓名
	private String personName;
	
	// 18.法人代表证件类型
	private String personNoType;
	
	// 19.法人证件号
	private String personNo;
	
	// 20.商户联系人
	private String merContact;
	
	// 21.商户联系人通讯地址
	private String merContactAddr;
	
	// 22.商户联系人电话
	private String merPhone;
	
	// 23.移动电话
	private String phone;
	
	// 24.商户拓展方式
	private String recnclTp;
	
	// 25.收单外包服务机构
	private String principalNm;
	
	// 26.商户开票开户银行名称
	private String cooking;
	
	// 27.商户开票账号
	private String mchntIcp;
	
	// 28.商户开票账户名称
	private String trafficLine;
	
	// 29.是否申请优惠价格
	private String directAcqSettleIn;
	
	// 30.商户现场注册标识码
	private String regSeqNo;
	
	// 31.特殊计费类型
	private String specDiscTp;
	
	// 32.特殊计费档次
	private String specDiscLvl;
	
	// 33.发卡银联分润算法
	private String allotAlgo;
	
	// 34.贷记卡发卡银联分润算法
	private String allotCd;
	
	// 35.商户计费算法
	private String mchntDiscDetIndex;
	
	// 36.商户网址
	private String svcNetUrl;
	
	// 37.商户网站
	private String mchntWebSiteNm;
	
	// 38.产品功能
	private String prodFunc;
	
	// 39.产品功能说明
	private String prodFuncDesc;
	
	// 40.业务类型
	private String bussTp;
	
	// 41.单笔限额
	private String singleAtLimit;
	
	// 42.单笔限额说明
	private String singleAtLimitDesc;
	
	// 43.单卡单日累计限额
	private String singleCardDayAtLimit;
	
	// 44.单卡单日累计限额说明
	private String singleCardDayAtLimitDesc;
	
	// 45.网络商户类型
	private String submchntIn;
	
	// 46.ICP许可证编号
	private String svcInsNm;
	
	// 47.总分店标志
	private String hdqrsBranchIn;
	
	// 48.总店商户代码
	private String hdqrsMchntCd;
	
	// 49.渠道接入商代码
	private String chnlMchntCd;
	
	// 50.机构保留字段1
	private String insResv1;   

	// 51.机构保留字段2
	private String insResv2;
	
	// 52.机构保留字段3
	private String insResv3;
	
	// 53.机构保留字段4
	private String insResv4;   
	
	// 54.机构保留字段5
	private String insResv5;     
	
	// 55.机构保留字段6
	private String insResv6;
	
	// 56.机构保留字段9
	private String insResv9;
	
	// 57.机构保留字段10
	private String insResv10;
	
	// 58.分公司保留字段1
	private String cupBranchResv1;   
	
	// 59.分公司保留字段2
	private String cupBranchResv2;        
	
	// 60.分公司保留字段3
	private String cupBranchResv3; 

	// --Extend--
	// 审批状态
	private String status;
	
	// 风控审批时间
	private String approveDate;

	/**
	 * @return the exportFlag
	 */
	public String getExportFlag() {
		return exportFlag;
	}

	/**
	 * @param exportFlag the exportFlag to set
	 */
	public void setExportFlag(String exportFlag) {
		this.exportFlag = exportFlag;
	}

	/**
	 * @return the mid
	 */
	public String getMid() {
		return mid;
	}

	/**
	 * @param mid the mid to set
	 */
	public void setMid(String mid) {
		this.mid = mid;
	}

	/**
	 * @return the merType
	 */
	public String getMerType() {
		return merType;
	}

	/**
	 * @param merType the merType to set
	 */
	public void setMerType(String merType) {
		this.merType = merType;
	}

	/**
	 * @return the merName
	 */
	public String getMerName() {
		return merName;
	}

	/**
	 * @param merName the merName to set
	 */
	public void setMerName(String merName) {
		this.merName = merName;
	}

	/**
	 * @return the merOutName
	 */
	public String getMerOutName() {
		return merOutName;
	}

	/**
	 * @param merOutName the merOutName to set
	 */
	public void setMerOutName(String merOutName) {
		this.merOutName = merOutName;
	}

	/**
	 * @return the sysOrgCode
	 */
	public String getSysOrgCode() {
		return sysOrgCode;
	}

	/**
	 * @param sysOrgCode the sysOrgCode to set
	 */
	public void setSysOrgCode(String sysOrgCode) {
		this.sysOrgCode = sysOrgCode;
	}

	/**
	 * @return the countryCode
	 */
	public String getCountryCode() {
		return countryCode;
	}

	/**
	 * @param countryCode the countryCode to set
	 */
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	/**
	 * @return the areaCode
	 */
	public String getAreaCode() {
		return areaCode;
	}

	/**
	 * @param areaCode the areaCode to set
	 */
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	/**
	 * @return the mcc
	 */
	public String getMcc() {
		return mcc;
	}

	/**
	 * @param mcc the mcc to set
	 */
	public void setMcc(String mcc) {
		this.mcc = mcc;
	}

	/**
	 * @return the etpsAttr
	 */
	public String getEtpsAttr() {
		return etpsAttr;
	}

	/**
	 * @param etpsAttr the etpsAttr to set
	 */
	public void setEtpsAttr(String etpsAttr) {
		this.etpsAttr = etpsAttr;
	}

	/**
	 * @return the mchntStatus
	 */
	public String getMchntStatus() {
		return mchntStatus;
	}

	/**
	 * @param mchntStatus the mchntStatus to set
	 */
	public void setMchntStatus(String mchntStatus) {
		this.mchntStatus = mchntStatus;
	}

	/**
	 * @return the netMchntSvcTp
	 */
	public String getNetMchntSvcTp() {
		return netMchntSvcTp;
	}

	/**
	 * @param netMchntSvcTp the netMchntSvcTp to set
	 */
	public void setNetMchntSvcTp(String netMchntSvcTp) {
		this.netMchntSvcTp = netMchntSvcTp;
	}

	/**
	 * @return the licenseNo
	 */
	public String getLicenseNo() {
		return licenseNo;
	}

	/**
	 * @param licenseNo the licenseNo to set
	 */
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	/**
	 * @return the licenseAddr
	 */
	public String getLicenseAddr() {
		return licenseAddr;
	}

	/**
	 * @param licenseAddr the licenseAddr to set
	 */
	public void setLicenseAddr(String licenseAddr) {
		this.licenseAddr = licenseAddr;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the enName
	 */
	public String getEnName() {
		return enName;
	}

	/**
	 * @param enName the enName to set
	 */
	public void setEnName(String enName) {
		this.enName = enName;
	}

	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
	}

	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}

	/**
	 * @return the personNoType
	 */
	public String getPersonNoType() {
		return personNoType;
	}

	/**
	 * @param personNoType the personNoType to set
	 */
	public void setPersonNoType(String personNoType) {
		this.personNoType = personNoType;
	}

	/**
	 * @return the personNo
	 */
	public String getPersonNo() {
		return personNo;
	}

	/**
	 * @param personNo the personNo to set
	 */
	public void setPersonNo(String personNo) {
		this.personNo = personNo;
	}

	/**
	 * @return the merContact
	 */
	public String getMerContact() {
		return merContact;
	}

	/**
	 * @param merContact the merContact to set
	 */
	public void setMerContact(String merContact) {
		this.merContact = merContact;
	}

	/**
	 * @return the merContactAddr
	 */
	public String getMerContactAddr() {
		return merContactAddr;
	}

	/**
	 * @param merContactAddr the merContactAddr to set
	 */
	public void setMerContactAddr(String merContactAddr) {
		this.merContactAddr = merContactAddr;
	}

	/**
	 * @return the merPhone
	 */
	public String getMerPhone() {
		return merPhone;
	}

	/**
	 * @param merPhone the merPhone to set
	 */
	public void setMerPhone(String merPhone) {
		this.merPhone = merPhone;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the recnclTp
	 */
	public String getRecnclTp() {
		return recnclTp;
	}

	/**
	 * @param recnclTp the recnclTp to set
	 */
	public void setRecnclTp(String recnclTp) {
		this.recnclTp = recnclTp;
	}

	/**
	 * @return the principalNm
	 */
	public String getPrincipalNm() {
		return principalNm;
	}

	/**
	 * @param principalNm the principalNm to set
	 */
	public void setPrincipalNm(String principalNm) {
		this.principalNm = principalNm;
	}

	/**
	 * @return the cooking
	 */
	public String getCooking() {
		return cooking;
	}

	/**
	 * @param cooking the cooking to set
	 */
	public void setCooking(String cooking) {
		this.cooking = cooking;
	}

	/**
	 * @return the mchntIcp
	 */
	public String getMchntIcp() {
		return mchntIcp;
	}

	/**
	 * @param mchntIcp the mchntIcp to set
	 */
	public void setMchntIcp(String mchntIcp) {
		this.mchntIcp = mchntIcp;
	}

	/**
	 * @return the trafficLine
	 */
	public String getTrafficLine() {
		return trafficLine;
	}

	/**
	 * @param trafficLine the trafficLine to set
	 */
	public void setTrafficLine(String trafficLine) {
		this.trafficLine = trafficLine;
	}

	/**
	 * @return the directAcqSettleIn
	 */
	public String getDirectAcqSettleIn() {
		return directAcqSettleIn;
	}

	/**
	 * @param directAcqSettleIn the directAcqSettleIn to set
	 */
	public void setDirectAcqSettleIn(String directAcqSettleIn) {
		this.directAcqSettleIn = directAcqSettleIn;
	}

	/**
	 * @return the regSeqNo
	 */
	public String getRegSeqNo() {
		return regSeqNo;
	}

	/**
	 * @param regSeqNo the regSeqNo to set
	 */
	public void setRegSeqNo(String regSeqNo) {
		this.regSeqNo = regSeqNo;
	}

	/**
	 * @return the specDiscTp
	 */
	public String getSpecDiscTp() {
		return specDiscTp;
	}

	/**
	 * @param specDiscTp the specDiscTp to set
	 */
	public void setSpecDiscTp(String specDiscTp) {
		this.specDiscTp = specDiscTp;
	}

	/**
	 * @return the specDiscLvl
	 */
	public String getSpecDiscLvl() {
		return specDiscLvl;
	}

	/**
	 * @param specDiscLvl the specDiscLvl to set
	 */
	public void setSpecDiscLvl(String specDiscLvl) {
		this.specDiscLvl = specDiscLvl;
	}

	/**
	 * @return the allotAlgo
	 */
	public String getAllotAlgo() {
		return allotAlgo;
	}

	/**
	 * @param allotAlgo the allotAlgo to set
	 */
	public void setAllotAlgo(String allotAlgo) {
		this.allotAlgo = allotAlgo;
	}

	/**
	 * @return the allotCd
	 */
	public String getAllotCd() {
		return allotCd;
	}

	/**
	 * @param allotCd the allotCd to set
	 */
	public void setAllotCd(String allotCd) {
		this.allotCd = allotCd;
	}

	/**
	 * @return the mchntDiscDetIndex
	 */
	public String getMchntDiscDetIndex() {
		return mchntDiscDetIndex;
	}

	/**
	 * @param mchntDiscDetIndex the mchntDiscDetIndex to set
	 */
	public void setMchntDiscDetIndex(String mchntDiscDetIndex) {
		this.mchntDiscDetIndex = mchntDiscDetIndex;
	}

	/**
	 * @return the svcNetUrl
	 */
	public String getSvcNetUrl() {
		return svcNetUrl;
	}

	/**
	 * @param svcNetUrl the svcNetUrl to set
	 */
	public void setSvcNetUrl(String svcNetUrl) {
		this.svcNetUrl = svcNetUrl;
	}

	/**
	 * @return the mchntWebSiteNm
	 */
	public String getMchntWebSiteNm() {
		return mchntWebSiteNm;
	}

	/**
	 * @param mchntWebSiteNm the mchntWebSiteNm to set
	 */
	public void setMchntWebSiteNm(String mchntWebSiteNm) {
		this.mchntWebSiteNm = mchntWebSiteNm;
	}

	/**
	 * @return the prodFunc
	 */
	public String getProdFunc() {
		return prodFunc;
	}

	/**
	 * @param prodFunc the prodFunc to set
	 */
	public void setProdFunc(String prodFunc) {
		this.prodFunc = prodFunc;
	}

	/**
	 * @return the prodFuncDesc
	 */
	public String getProdFuncDesc() {
		return prodFuncDesc;
	}

	/**
	 * @param prodFuncDesc the prodFuncDesc to set
	 */
	public void setProdFuncDesc(String prodFuncDesc) {
		this.prodFuncDesc = prodFuncDesc;
	}

	/**
	 * @return the bussTp
	 */
	public String getBussTp() {
		return bussTp;
	}

	/**
	 * @param bussTp the bussTp to set
	 */
	public void setBussTp(String bussTp) {
		this.bussTp = bussTp;
	}

	/**
	 * @return the singleAtLimit
	 */
	public String getSingleAtLimit() {
		return singleAtLimit;
	}

	/**
	 * @param singleAtLimit the singleAtLimit to set
	 */
	public void setSingleAtLimit(String singleAtLimit) {
		this.singleAtLimit = singleAtLimit;
	}

	/**
	 * @return the singleAtLimitDesc
	 */
	public String getSingleAtLimitDesc() {
		return singleAtLimitDesc;
	}

	/**
	 * @param singleAtLimitDesc the singleAtLimitDesc to set
	 */
	public void setSingleAtLimitDesc(String singleAtLimitDesc) {
		this.singleAtLimitDesc = singleAtLimitDesc;
	}

	/**
	 * @return the singleCardDayAtLimit
	 */
	public String getSingleCardDayAtLimit() {
		return singleCardDayAtLimit;
	}

	/**
	 * @param singleCardDayAtLimit the singleCardDayAtLimit to set
	 */
	public void setSingleCardDayAtLimit(String singleCardDayAtLimit) {
		this.singleCardDayAtLimit = singleCardDayAtLimit;
	}

	/**
	 * @return the singleCardDayAtLimitDesc
	 */
	public String getSingleCardDayAtLimitDesc() {
		return singleCardDayAtLimitDesc;
	}

	/**
	 * @param singleCardDayAtLimitDesc the singleCardDayAtLimitDesc to set
	 */
	public void setSingleCardDayAtLimitDesc(String singleCardDayAtLimitDesc) {
		this.singleCardDayAtLimitDesc = singleCardDayAtLimitDesc;
	}

	/**
	 * @return the submchntIn
	 */
	public String getSubmchntIn() {
		return submchntIn;
	}

	/**
	 * @param submchntIn the submchntIn to set
	 */
	public void setSubmchntIn(String submchntIn) {
		this.submchntIn = submchntIn;
	}

	/**
	 * @return the svcInsNm
	 */
	public String getSvcInsNm() {
		return svcInsNm;
	}

	/**
	 * @param svcInsNm the svcInsNm to set
	 */
	public void setSvcInsNm(String svcInsNm) {
		this.svcInsNm = svcInsNm;
	}

	/**
	 * @return the hdqrsBranchIn
	 */
	public String getHdqrsBranchIn() {
		return hdqrsBranchIn;
	}

	/**
	 * @param hdqrsBranchIn the hdqrsBranchIn to set
	 */
	public void setHdqrsBranchIn(String hdqrsBranchIn) {
		this.hdqrsBranchIn = hdqrsBranchIn;
	}

	/**
	 * @return the hdqrsMchntCd
	 */
	public String getHdqrsMchntCd() {
		return hdqrsMchntCd;
	}

	/**
	 * @param hdqrsMchntCd the hdqrsMchntCd to set
	 */
	public void setHdqrsMchntCd(String hdqrsMchntCd) {
		this.hdqrsMchntCd = hdqrsMchntCd;
	}

	/**
	 * @return the chnlMchntCd
	 */
	public String getChnlMchntCd() {
		return chnlMchntCd;
	}

	/**
	 * @param chnlMchntCd the chnlMchntCd to set
	 */
	public void setChnlMchntCd(String chnlMchntCd) {
		this.chnlMchntCd = chnlMchntCd;
	}

	/**
	 * @return the insResv1
	 */
	public String getInsResv1() {
		return insResv1;
	}

	/**
	 * @param insResv1 the insResv1 to set
	 */
	public void setInsResv1(String insResv1) {
		this.insResv1 = insResv1;
	}

	/**
	 * @return the insResv2
	 */
	public String getInsResv2() {
		return insResv2;
	}

	/**
	 * @param insResv2 the insResv2 to set
	 */
	public void setInsResv2(String insResv2) {
		this.insResv2 = insResv2;
	}

	/**
	 * @return the insResv3
	 */
	public String getInsResv3() {
		return insResv3;
	}

	/**
	 * @param insResv3 the insResv3 to set
	 */
	public void setInsResv3(String insResv3) {
		this.insResv3 = insResv3;
	}

	/**
	 * @return the insResv4
	 */
	public String getInsResv4() {
		return insResv4;
	}

	/**
	 * @param insResv4 the insResv4 to set
	 */
	public void setInsResv4(String insResv4) {
		this.insResv4 = insResv4;
	}

	/**
	 * @return the insResv5
	 */
	public String getInsResv5() {
		return insResv5;
	}

	/**
	 * @param insResv5 the insResv5 to set
	 */
	public void setInsResv5(String insResv5) {
		this.insResv5 = insResv5;
	}

	/**
	 * @return the insResv6
	 */
	public String getInsResv6() {
		return insResv6;
	}

	/**
	 * @param insResv6 the insResv6 to set
	 */
	public void setInsResv6(String insResv6) {
		this.insResv6 = insResv6;
	}

	/**
	 * @return the insResv9
	 */
	public String getInsResv9() {
		return insResv9;
	}

	/**
	 * @param insResv9 the insResv9 to set
	 */
	public void setInsResv9(String insResv9) {
		this.insResv9 = insResv9;
	}

	/**
	 * @return the insResv10
	 */
	public String getInsResv10() {
		return insResv10;
	}

	/**
	 * @param insResv10 the insResv10 to set
	 */
	public void setInsResv10(String insResv10) {
		this.insResv10 = insResv10;
	}

	/**
	 * @return the cupBranchResv1
	 */
	public String getCupBranchResv1() {
		return cupBranchResv1;
	}

	/**
	 * @param cupBranchResv1 the cupBranchResv1 to set
	 */
	public void setCupBranchResv1(String cupBranchResv1) {
		this.cupBranchResv1 = cupBranchResv1;
	}

	/**
	 * @return the cupBranchResv2
	 */
	public String getCupBranchResv2() {
		return cupBranchResv2;
	}

	/**
	 * @param cupBranchResv2 the cupBranchResv2 to set
	 */
	public void setCupBranchResv2(String cupBranchResv2) {
		this.cupBranchResv2 = cupBranchResv2;
	}

	/**
	 * @return the cupBranchResv3
	 */
	public String getCupBranchResv3() {
		return cupBranchResv3;
	}

	/**
	 * @param cupBranchResv3 the cupBranchResv3 to set
	 */
	public void setCupBranchResv3(String cupBranchResv3) {
		this.cupBranchResv3 = cupBranchResv3;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the approveDate
	 */
	public String getApproveDate() {
		return approveDate;
	}

	/**
	 * @param approveDate the approveDate to set
	 */
	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}
	
}
