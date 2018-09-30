package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;

/**
 * 新增商户实体
 * @author Administrator
 *
 */
public class MerchantAddVo implements Serializable{

	private String firstTcn;//一级服务商号
	private String gradeFlag;//标示
	private Long version;//version
	private String orgCode;//服务商内部商户号
	private String secondTcn;//二级服务商号
	private String personCode;//业务员代码
	private String merName;//商户名称
	private String merOutName;//商户对外经营名称
	private String enName;//商户英文名称
	private String enOutName;//商户对外英文名称
	private String mcc;//MCC码
	private String areaCode;//地区代码
	private String licenseNo;//营业执照号码
	private String licenseAddr;//营业执照注册地址
	private String taxNo;//税务登记证号码
	private String certNo;//组织机构代码证
	private String personName;///商户法定代表人姓名
	private String personNo;//商户法定代表人身份证号
	private String address;//商户装机地址
	private String busiBgtTime;//营业开始时间
	private String busiEndTime;//营业结束时间
	private String area;//营业面积(平方米)
	private String monthRent;//商户月租金（分）
	private String merCreatDate;//商户成立日期
	private Long posNum;//收银台数
	private String bankAccntId;//机构对公账户
	private String accntType;//商户账户类型
	
	private String accntName;//商户账户名称
	private String accntNo;//商户账户号码
	private String accntBank;//商户开户行
	private String spdFlag;//商户开户行是否浦发
	private String cardPersonNo;//商户开户人身份证号
	private String feeRate;//商户手续费率(十万级)
	private String feeType;//商户手续费收取类型
	private String feeVal;//商户手续费固定值(元)
	private String topValue;//商户手续费封顶值(元)
	private String merContact;//商户联系人
	private String merFax;//商户传真
	private String merPhone;//商户联系电话
	private String tranLimit;//单笔交易限额(分)
	private String specFlag;//特惠商户
	private String bankBranchNo;//开户行行号
	
	
	private String mid;//外部商户号(银联)
	private String merStatus;//录入状态，1成功，0失败
	private Long merTidCount;//该商户的终端个数
	private String errorMessage;//录入商户出错信息描述
	private String updDate;//录入商户时间
	
	private String status;//审批状态

	private String bankNo;//银行编码

	
	private String preserve1;//保留域1
	private String preserve2;//保留域2
	private String preserve3;//保留域3
	
	private String fileName;//商户进入的反馈文件名称
	
	private String isExport;//表示该商户是否已经导出表 0初始状态，1为已经导出，2审核已导出
	
	private String statusZh;//审批状态中文
	private String accntTypeZh;//商户账户类型中文
	private String bankAccntIdZh;//机构对公账户中文
	private String feeTypeZh;//商户手续费收取类型中文
	private String spdFlagZh;//商户开户行是否浦发中文
	private String specFlagZh;//特惠商户中文
	
	private String accntbankNo; //开户银行网点号 

	
	public String userId;//创建人
	
	private String admitAcc;//业务审批人
	private String admitMemo;//业务审批意见
	private String approveAcc;//风控审批人
	private String approveMemo;//风控审批意见
	private String admitDate;//业务审批时间
	private String approveDate;//风控审批时间
	
	
	private String startDate;//查询条件开始时间
	private String endDate;//查询条件结束时间
	
	
	private String pageSize;//页面大小
	    
    private String pageIndex;//查询起始页
    
    private String pageSort;//按什么排序
    
    private String pageDir;//升序还是降序
	
    private String channelString;//登录人的所属服务商
    
    private String channel;//页面查询服务商
    
    private String lastUptTime;//最后修改时间
    
    private String ipType2;//是否支持建行分期
    
    private String ipFeeType2;//建行分期付款手续费手续类型
    
    private String ipFeeRate2;//建行分期付款手续费率
    
    private String ipFlag;//业务类型字符串位图
    
    private String ipType1;//是否支持银联分期
    
    private String ipFeeType1;//银联分期付款手续费手续类型
    
    private String ipFeeRate1;//银联分期付款手续费率
    
    private String ipFeeRateMax1;
    
    private String docTransferName; //调单联系人
    private String docTransferPhone; //调单联系人电话
    private String docTransferEmail; //调单联系人邮件
    
   
    
    /** personNoType : 法人证件类型. PERSON_NO_TYPE: VARCHAR2(1) */
	private String personNoType;
	
	/** cardPersonNoType : 商户开户人证件类型. CARD_PERSON_NO_TYPE: VARCHAR2(1) */
	private String cardPersonNoType;
	
	/** bizLicnoExpireDate : 营业执照过期日期. BIZ_LICNO_EXPIRE_DATE: VARCHAR2(8) */
	private String bizLicnoExpireDate;
	
	/** personNoExpireDate : 法人身份证有效期. PERSON_NO_EXPIRE_DATE: VARCHAR2(8) */
	private String personNoExpireDate;
	
	/** cardLicnoExpireDate : 商户开户人证件有效期. CARD_LICNO_EXPIRE_DATE: VARCHAR2(8) */
	private String cardLicnoExpireDate;
	
	/** debitRate : 借记卡_费率. DEBIT_RATE: NUMBER(5) */
	private Long debitRate ;
	
	/** debitMaxFee : 借记卡_单笔封顶值. DEBIT_MAX_FEE: NUMBER(12) */
	private Long debitMaxFee ;
	
	/** creditRate : 贷记卡_费率. CREDIT_RATE: NUMBER(5) */
	private Long creditRate ;
	
	/** creditMaxFee : 贷记卡_单笔封顶值. CREDIT_MAX_FEE: NUMBER(12) */
	private Long creditMaxFee ;
	
	/** wechatPayRate : 微信二维码_费率. TBL_CORE_MER_RATE   wxb */
	private Long wechatPayRate ;
	/** wechatPayOrg : 微信二维码_支付机构. TBL_CORE_MER_RATE   lixl */
	private String wechatPayOrg;
	
	/** outCardRate : 外卡费率. TBL_CORE_MER_RATE   wxb */
	private Long outCardRate ;
	
	/** alipayPayRate : 外卡费率. TBL_CORE_MER_RATE   lxl */
	private Long alipayPayRate ;
	/** wechatPayOrg : 支付宝二维码_支付机构. TBL_CORE_MER_RATE   lixl */
	private String alipayPayOrg;
	
	/** mccGrp : 商户所属大类. MCC_GRP: VARCHAR2(4) */
	private String mccGrp ;
	
	/** mccGrpImp : 商户类别(预期). MCC_GRP_IMP: VARCHAR2(4) */
	private String mccGrpImp ;
	
	/** mccRemark : 进件类别备注. MCC_REMARK: VARCHAR2(400) */
	private String mccRemark ;
	
	/** merStatementsType : 商户结算类型.  MER_STATEMENTS_TYPE */
	private String merStatementsType ;
	
	/** merStatementsRate : 垫资手续费费率.  MER_STATEMENTS_RATE */
	private String merStatementsRate ;
	
	// -- extend --
	
	/**法人证件类型中文*/
	private String personNoTypeDesc;
	
	/**商户开户人证件类型中文*/
	private String cardPersonNoTypeDesc;
	
	/** 开户行大行中文 */
	private String accntBankPrivateDesc;
	
	/** 开户行中文 */
	private String bankBranchNoDesc;
	
	/** mccGrpDesc : 商户所属大类. MCC_GRP: VARCHAR2(4) */
	private String mccGrpDesc ;
	
	/** mccGrpImpDesc : 商户类别(预期). MCC_GRP_IMP: VARCHAR2(4) */
	private String mccGrpImpDesc ;
	
	/** regSeqNo : 注册标识码. REG_SEQ_NO: VARCHAR2(50) */
	private String regSeqNo;
	
	/** 一级服务商中文 */
	private String firstTcnZH;
	
	public String getAlipayPayOrg() {
		return alipayPayOrg;
	}
	public void setAlipayPayOrg(String alipayPayOrg) {
		this.alipayPayOrg = alipayPayOrg;
	}
	public String getIpFeeRateMax1() {
		return ipFeeRateMax1;
	}
	public void setIpFeeRateMax1(String ipFeeRateMax1) {
		this.ipFeeRateMax1 = ipFeeRateMax1;
	}
	public String getIpType1() {
		return ipType1;
	}
	public void setIpType1(String ipType1) {
		this.ipType1 = ipType1;
	}
	public String getIpFeeType1() {
		return ipFeeType1;
	}
	public void setIpFeeType1(String ipFeeType1) {
		this.ipFeeType1 = ipFeeType1;
	}
	public String getIpFeeRate1() {
		return ipFeeRate1;
	}
	public void setIpFeeRate1(String ipFeeRate1) {
		this.ipFeeRate1 = ipFeeRate1;
	}
	public String getLastUptTime() {
		return lastUptTime;
	}
	public void setLastUptTime(String lastUptTime) {
		this.lastUptTime = lastUptTime;
	}
	public String getAccntbankNo() {
		return accntbankNo;
	}
	public void setAccntbankNo(String accntbankNo) {
		this.accntbankNo = accntbankNo;
	}
	public String getSpecFlagZh() {
		return specFlagZh;
	}
	public void setSpecFlagZh(String specFlagZh) {
		this.specFlagZh = specFlagZh;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getPageSort() {
		return pageSort;
	}
	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}
	public String getPageDir() {
		return pageDir;
	}
	public void setPageDir(String pageDir) {
		this.pageDir = pageDir;
	}
	public String getChannelString() {
		return channelString;
	}
	public void setChannelString(String channelString) {
		this.channelString = channelString;
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
	public String getAdmitAcc() {
		return admitAcc;
	}
	public void setAdmitAcc(String admitAcc) {
		this.admitAcc = admitAcc;
	}
	public String getAdmitMemo() {
		return admitMemo;
	}
	public void setAdmitMemo(String admitMemo) {
		this.admitMemo = admitMemo;
	}
	public String getApproveAcc() {
		return approveAcc;
	}
	public void setApproveAcc(String approveAcc) {
		this.approveAcc = approveAcc;
	}
	public String getApproveMemo() {
		return approveMemo;
	}
	public void setApproveMemo(String approveMemo) {
		this.approveMemo = approveMemo;
	}
	public String getAdmitDate() {
		return admitDate;
	}
	public void setAdmitDate(String admitDate) {
		this.admitDate = admitDate;
	}
	public String getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSpdFlagZh() {
		return spdFlagZh;
	}
	public void setSpdFlagZh(String spdFlagZh) {
		this.spdFlagZh = spdFlagZh;
	}
	public String getFeeTypeZh() {
		return feeTypeZh;
	}
	public void setFeeTypeZh(String feeTypeZh) {
		this.feeTypeZh = feeTypeZh;
	}
	public String getBankAccntIdZh() {
		return bankAccntIdZh;
	}
	public void setBankAccntIdZh(String bankAccntIdZh) {
		this.bankAccntIdZh = bankAccntIdZh;
	}
	public String getAccntTypeZh() {
		return accntTypeZh;
	}
	public void setAccntTypeZh(String accntTypeZh) {
		this.accntTypeZh = accntTypeZh;
	}
	public String getStatusZh() {
		return statusZh;
	}
	public void setStatusZh(String statusZh) {
		this.statusZh = statusZh;
	}
	public String getIsExport() {
		return isExport;
	}
	public void setIsExport(String isExport) {
		this.isExport = isExport;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPreserve1() {
		return preserve1;
	}
	public void setPreserve1(String preserve1) {
		this.preserve1 = preserve1;
	}
	public String getPreserve2() {
		return preserve2;
	}
	public void setPreserve2(String preserve2) {
		this.preserve2 = preserve2;
	}
	public String getPreserve3() {
		return preserve3;
	}
	public void setPreserve3(String preserve3) {
		this.preserve3 = preserve3;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
		this.version = version;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	
	public String getFirstTcn() {
		return firstTcn;
	}
	public void setFirstTcn(String firstTcn) {
		this.firstTcn = firstTcn;
	}
	public String getSecondTcn() {
		return secondTcn;
	}
	public void setSecondTcn(String secondTcn) {
		this.secondTcn = secondTcn;
	}
	public String getPersonCode() {
		return personCode;
	}
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	public String getMerName() {
		return merName;
	}
	public void setMerName(String merName) {
		this.merName = merName;
	}
	public String getMerOutName() {
		return merOutName;
	}
	public void setMerOutName(String merOutName) {
		this.merOutName = merOutName;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getEnOutName() {
		return enOutName;
	}
	public void setEnOutName(String enOutName) {
		this.enOutName = enOutName;
	}
	public String getMcc() {
		return mcc;
	}
	public void setMcc(String mcc) {
		this.mcc = mcc;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getLicenseAddr() {
		return licenseAddr;
	}
	public void setLicenseAddr(String licenseAddr) {
		this.licenseAddr = licenseAddr;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getPersonNo() {
		return personNo;
	}
	public void setPersonNo(String personNo) {
		this.personNo = personNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusiBgtTime() {
		return busiBgtTime;
	}
	public void setBusiBgtTime(String busiBgtTime) {
		this.busiBgtTime = busiBgtTime;
	}
	public String getBusiEndTime() {
		return busiEndTime;
	}
	public void setBusiEndTime(String busiEndTime) {
		this.busiEndTime = busiEndTime;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getMonthRent() {
		return monthRent;
	}
	public void setMonthRent(String monthRent) {
		this.monthRent = monthRent;
	}
	public String getMerCreatDate() {
		return merCreatDate;
	}
	public void setMerCreatDate(String merCreatDate) {
		this.merCreatDate = merCreatDate;
	}
	public Long getPosNum() {
		return posNum;
	}
	public void setPosNum(Long posNum) {
		this.posNum = posNum;
	}
	

	public String getBankAccntId() {
		return bankAccntId;
	}
	public void setBankAccntId(String bankAccntId) {
		this.bankAccntId = bankAccntId;
	}
	public String getAccntType() {
		return accntType;
	}
	public void setAccntType(String accntType) {
		this.accntType = accntType;
	}
	public String getAccntName() {
		return accntName;
	}
	public void setAccntName(String accntName) {
		this.accntName = accntName;
	}
	public String getAccntNo() {
		return accntNo;
	}
	public void setAccntNo(String accntNo) {
		this.accntNo = accntNo;
	}
	public String getAccntBank() {
		return accntBank;
	}
	public void setAccntBank(String accntBank) {
		this.accntBank = accntBank;
	}
	public String getSpdFlag() {
		return spdFlag;
	}
	public void setSpdFlag(String spdFlag) {
		this.spdFlag = spdFlag;
	}
	public String getCardPersonNo() {
		return cardPersonNo;
	}
	public void setCardPersonNo(String cardPersonNo) {
		this.cardPersonNo = cardPersonNo;
	}
	public String getFeeRate() {
		return feeRate;
	}
	public void setFeeRate(String feeRate) {
		this.feeRate = feeRate;
	}
	public String getFeeType() {
		return feeType;
	}
	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}
	public String getFeeVal() {
		return feeVal;
	}
	public void setFeeVal(String feeVal) {
		this.feeVal = feeVal;
	}
	public String getTopValue() {
		return topValue;
	}
	public void setTopValue(String topValue) {
		this.topValue = topValue;
	}
	public String getMerContact() {
		return merContact;
	}
	public void setMerContact(String merContact) {
		this.merContact = merContact;
	}
	public String getMerFax() {
		return merFax;
	}
	public void setMerFax(String merFax) {
		this.merFax = merFax;
	}
	public String getMerPhone() {
		return merPhone;
	}
	public void setMerPhone(String merPhone) {
		this.merPhone = merPhone;
	}
	
	public String getTranLimit() {
		return tranLimit;
	}
	public void setTranLimit(String tranLimit) {
		this.tranLimit = tranLimit;
	}
	public String getSpecFlag() {
		return specFlag;
	}
	public void setSpecFlag(String specFlag) {
		this.specFlag = specFlag;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMerStatus() {
		return merStatus;
	}
	public void setMerStatus(String merStatus) {
		this.merStatus = merStatus;
	}
	public Long getMerTidCount() {
		return merTidCount;
	}
	public void setMerTidCount(Long merTidCount) {
		this.merTidCount = merTidCount;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getGradeFlag() {
		return gradeFlag;
	}
	public void setGradeFlag(String gradeFlag) {
		this.gradeFlag = gradeFlag;
	}
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getBankBranchNo() {
		return bankBranchNo;
	}
	public void setBankBranchNo(String bankBranchNo) {
		this.bankBranchNo = bankBranchNo;
	}
	public String getIpType2() {
		return ipType2;
	}
	public void setIpType2(String ipType2) {
		this.ipType2 = ipType2;
	}
	public String getIpFeeType2() {
		return ipFeeType2;
	}
	public void setIpFeeType2(String ipFeeType2) {
		this.ipFeeType2 = ipFeeType2;
	}
	public String getIpFeeRate2() {
		return ipFeeRate2;
	}
	public void setIpFeeRate2(String ipFeeRate2) {
		this.ipFeeRate2 = ipFeeRate2;
	}
	public String getIpFlag() {
		return ipFlag;
	}
	public void setIpFlag(String ipFlag) {
		this.ipFlag = ipFlag;
	}
	public String getDocTransferName() {
		return docTransferName;
	}
	public void setDocTransferName(String docTransferName) {
		this.docTransferName = docTransferName;
	}
	public String getDocTransferPhone() {
		return docTransferPhone;
	}
	public void setDocTransferPhone(String docTransferPhone) {
		this.docTransferPhone = docTransferPhone;
	}
	public String getDocTransferEmail() {
		return docTransferEmail;
	}
	public void setDocTransferEmail(String docTransferEmail) {
		this.docTransferEmail = docTransferEmail;
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
	 * @return the cardPersonNoType
	 */
	public String getCardPersonNoType() {
		return cardPersonNoType;
	}
	/**
	 * @param cardPersonNoType the cardPersonNoType to set
	 */
	public void setCardPersonNoType(String cardPersonNoType) {
		this.cardPersonNoType = cardPersonNoType;
	}
	/**
	 * @return the personNoTypeDesc
	 */
	public String getPersonNoTypeDesc() {
		return personNoTypeDesc;
	}
	/**
	 * @param personNoTypeDesc the personNoTypeDesc to set
	 */
	public void setPersonNoTypeDesc(String personNoTypeDesc) {
		this.personNoTypeDesc = personNoTypeDesc;
	}
	/**
	 * @return the cardPersonNoTypeDesc
	 */
	public String getCardPersonNoTypeDesc() {
		return cardPersonNoTypeDesc;
	}
	/**
	 * @param cardPersonNoTypeDesc the cardPersonNoTypeDesc to set
	 */
	public void setCardPersonNoTypeDesc(String cardPersonNoTypeDesc) {
		this.cardPersonNoTypeDesc = cardPersonNoTypeDesc;
	}
	/**
	 * @return the accntBankPrivateDesc
	 */
	public String getAccntBankPrivateDesc() {
		return accntBankPrivateDesc;
	}
	/**
	 * @param accntBankPrivateDesc the accntBankPrivateDesc to set
	 */
	public void setAccntBankPrivateDesc(String accntBankPrivateDesc) {
		this.accntBankPrivateDesc = accntBankPrivateDesc;
	}
	/**
	 * @return the bankBranchNoDesc
	 */
	public String getBankBranchNoDesc() {
		return bankBranchNoDesc;
	}
	/**
	 * @param bankBranchNoDesc the bankBranchNoDesc to set
	 */
	public void setBankBranchNoDesc(String bankBranchNoDesc) {
		this.bankBranchNoDesc = bankBranchNoDesc;
	}
	/**
	 * @return the bizLicnoExpireDate
	 */
	public String getBizLicnoExpireDate() {
		return bizLicnoExpireDate;
	}
	/**
	 * @param bizLicnoExpireDate the bizLicnoExpireDate to set
	 */
	public void setBizLicnoExpireDate(String bizLicnoExpireDate) {
		this.bizLicnoExpireDate = bizLicnoExpireDate;
	}
	/**
	 * @return the personNoExpireDate
	 */
	public String getPersonNoExpireDate() {
		return personNoExpireDate;
	}
	/**
	 * @param personNoExpireDate the personNoExpireDate to set
	 */
	public void setPersonNoExpireDate(String personNoExpireDate) {
		this.personNoExpireDate = personNoExpireDate;
	}
	/**
	 * @return the cardLicnoExpireDate
	 */
	public String getCardLicnoExpireDate() {
		return cardLicnoExpireDate;
	}
	/**
	 * @param cardLicnoExpireDate the cardLicnoExpireDate to set
	 */
	public void setCardLicnoExpireDate(String cardLicnoExpireDate) {
		this.cardLicnoExpireDate = cardLicnoExpireDate;
	}
	/**
	 * @return the debitRate
	 */
	public Long getDebitRate() {
		return debitRate;
	}
	/**
	 * @param debitRate the debitRate to set
	 */
	public void setDebitRate(Long debitRate) {
		this.debitRate = debitRate;
	}
	/**
	 * @return the debitMaxFee
	 */
	public Long getDebitMaxFee() {
		return debitMaxFee;
	}
	/**
	 * @param debitMaxFee the debitMaxFee to set
	 */
	public void setDebitMaxFee(Long debitMaxFee) {
		this.debitMaxFee = debitMaxFee;
	}
	/**
	 * @return the creditRate
	 */
	public Long getCreditRate() {
		return creditRate;
	}
	/**
	 * @param creditRate the creditRate to set
	 */
	public void setCreditRate(Long creditRate) {
		this.creditRate = creditRate;
	}
	/**
	 * @return the creditMaxFee
	 */
	public Long getCreditMaxFee() {
		return creditMaxFee;
	}
	/**
	 * @param creditMaxFee the creditMaxFee to set
	 */
	public void setCreditMaxFee(Long creditMaxFee) {
		this.creditMaxFee = creditMaxFee;
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
	
	/**
	 * Set mccGrpImp : 预期类别. MCC_GRP_IMP: VARCHAR2(4) 
	 */
	public void setMccGrpImp(String mccGrpImp){
		this.mccGrpImp = mccGrpImp;	
	}
	
	/**
	 * Get mccGrpImp : 预期类别. MCC_GRP_IMP: VARCHAR2(4) 
	 */
	public String getMccGrpImp(){
		return this.mccGrpImp;	
	}
	
	/**
	 * Set mccRemark : 进件备注. MCC_REMARK: VARCHAR2(400) 
	 */
	public void setMccRemark(String mccRemark){
		this.mccRemark = mccRemark;	
	}
	
	/**
	 * Get mccRemark : 进件备注. MCC_REMARK: VARCHAR2(400) 
	 */
	public String getMccRemark(){
		return this.mccRemark;	
	}
	
	/**
	 * @return the mccGrpImpDesc
	 */
	public String getMccGrpImpDesc() {
		return mccGrpImpDesc;
	}
	
	/**
	 * @param mccGrpImpDesc the mccGrpImpDesc to set
	 */
	public void setMccGrpImpDesc(String mccGrpImpDesc) {
		this.mccGrpImpDesc = mccGrpImpDesc;
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
	 * @return the firstTcnZH
	 */
	public String getFirstTcnZH() {
		return firstTcnZH;
	}
	/**
	 * @param firstTcnZH the firstTcnZH to set
	 */
	public void setFirstTcnZH(String firstTcnZH) {
		this.firstTcnZH = firstTcnZH;
	}
	
	//微信费率	
	public Long getWechatPayRate() {
		return wechatPayRate;
	}
	public void setWechatPayRate(Long wechatPayRate) {
		this.wechatPayRate = wechatPayRate;
	}
	//外卡费率	
	public Long getOutCardRate() {
		return outCardRate;
	}
	public void setOutCardRate(Long outCardRate) {
		this.outCardRate = outCardRate;
	}
	public Long getAlipayPayRate() {
		return alipayPayRate;
	}
	public void setAlipayPayRate(Long alipayPayRate) {
		this.alipayPayRate = alipayPayRate;
	}
	public String getWechatPayOrg() {
		return wechatPayOrg;
	}
	public void setWechatPayOrg(String wechatPayOrg) {
		this.wechatPayOrg = wechatPayOrg;
	}
	public String getMerStatementsType() {
		return merStatementsType;
	}
	public void setMerStatementsType(String merStatementsType) {
		this.merStatementsType = merStatementsType;
	}
	public String getMerStatementsRate() {
		return merStatementsRate;
	}
	public void setMerStatementsRate(String merStatementsRate) {
		this.merStatementsRate = merStatementsRate;
	}
	
	
	
}