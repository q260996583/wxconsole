package com.jiuyv.yl.console.outmer.entity;


public class OutMerApplyVo {
	
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
	private String taxNO;//税务登记证号码
	private String certNO;//组织机构代码证
	private String personName;//商户法定代表人姓名
	private String personNO;//商户法定代表人身份证号
	private String address;//商户装机地址
	private String busiBgTime;//营业开始时间
	private String busiEndTime;//营业结束时间
	private String area;//营业面积(平方米)
	private String monthRent;//商户月租金（分）
	private String merCreateDate;//商户成立日期
	private String posNum;//收银台数
	private String bankAccntId;//机构对公账户在系统中的ID
	private String accntType;//商户账户类型
	private String accntName;//商户账户名称
	private String accntNO;//商户账户号码
	private String accntBank;//商户开户行
	private String spdFlag;//商户开户行是否浦发
	private String cardPersonNO;//商户开户人身份证号
	private String feeRate;//商户手续费率(十万级)
	private String feeType;//商户手续费收取类型
	private String feeVal;//商户手续费固定值(元)
	private String topValue;//商户手续费封顶值(元)
	private String merContact;//商户联系人
	private String merFax;//商户传真
	private String merPhone;//商户联系电话
	private String tranLimit;//单笔交易限额(分)
	private String specFlag;//特惠商户
	private String mid;//外部商户号(银联)
	private String merStatus;//录入状态
	private int merTidCount;//该商户的终端个数
	private String errorMessage;//录入商户出错信息描述
	private String merTids;//录入商户的终端号集合
	private String updDate;//录入商户时间
	private String applyDate;//录入商户时间
	private String gradeFlag;//标示
	private String firstTcn;//一级服务商号
	private String status;//审批状态
	private String admitAcc;//业务审批人
	private String admitDate;//业务审批时间
	private String admitMemo;//业务审批意见
	private String approveAcc;//风控审批人
	private String approveDate;//风控审批时间
	private String approveMemo;//风控审批意见
	private String bankNO;//银行编码
	private String bankBranchNO;//开户行行号
	private String ipFlag;//支持的业务类型位图
	private String ipFeeType;//建行分期手续费收取方式
	private String ipFeeRate;//建行分期手续费率
	private String reserved2Zh;                            //wxb
	private String statusZH;//审批状态中文名
	private String areaCodeZH;//地区中文名
	private String accntTypeZH;//帐户类型中文名
	private String spdFlagZH;//商户开户行是否为浦发银行
	public String getReserved2Zh() {
		return reserved2Zh;
	}
	public void setReserved2Zh(String reserved2Zh) {
		this.reserved2Zh = reserved2Zh;
	}
	private String fftAccntZH;//机构商户对应中文名
	private String firstTcnZH;//一级服务商对应的中文名
	private String secondTcnZH;//二级服务商对应的中文名
	private String tidStatusZH;//终端状态中文名
	private String ifCcbIpZH;//是否支持建行分期
	private String ipFeeTypeZH;//建行分期手续费收取方式中文名
	
//***************终端信息
	private String tid;//终端号
	private String charge;//流量费（分）
	private String tidBrand;//终端品牌
	private String tidType;//终端类型
	private String tidTypeZh;//终端类型
	private String tidModel;//终端型号
	private String tidUpdDate;//录入终端时间
	private String tidAddress;//安装地址
	private String tidStatus;//终端状态
	private String fftMid;
	private String fftTid;
	private String approveOrgCode;
	private String memo;
    private String sysOrgCode;
    private String terStat;
    private String terType;
    private String busiType;
    private String terPhone;
    private String terAddr;
    private String terPersonName;
    private String terMerName;
    private String busiMerNO;
    private String terSerial;
    private String terMadeFacName;
    private String terModel;
    private String terDeployTime;
    private String terCommType;
    private String terScanFunc;
    private String terBarCardFunc;
    private String terContactICFunc;
    private String terNonContactICFunc;
    private String terNoCardPayFunc;
    private String terBusiFunc;
    private String confTime;

	private String chargeType;//流量费收取方式
	private String reserved1;//SIM卡号
	private String reserved2;//保留域2
	private String reserved3;//保留域3
	
//**************分页查询数据
	private int pageBegin;//记录起始值
	private int pageSize;//一页记录数
	private String applyDateStart;//录入开始时间
	private String applyDateEnd;//录入结束时间
	
//**************转换成CoremerchantVo所需要补全信息
	private String lastUptTime;//最后更新时间
	private String lastUptAcc;//最后更新帐户
	private String lastUptOrg; //最后更新机构
	
	private String feeTypeZh;//手续费收取类型中文
	
	private String chargeTypeZh;//流量费收取方式中文
	
	
	private String accntBankNoPrivate;//开户银行网点号
	
	/** docTransferName : 调单联系人姓名. DOC_TRANSFER_NAME: VARCHAR2(20) */
	private String docTransferName ;
	
	/** docTransferPhone : 调单联系人电话. DOC_TRANSFER_PHONE: VARCHAR2(50) */
	private String docTransferPhone ;
	
	/** docTransferEmail : 调单联系人邮件. DOC_TRANSFER_EMAIL: VARCHAR2(100) */
	private String docTransferEmail ;
	
	/** userId : 拓展人. USER_ID: VARCHAR2(100) */
	private String userId ;
	
	/** snCode : SN号. SN_CODE: VARCHAR2(50) */
	private String snCode ;
	
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
	
	/** mccGrp : 商户所属大类. MCC_GRP: VARCHAR2(4) */
	private String mccGrp ;
	
	/** mccGrpImp : 商户类别(预期). MCC_GRP_IMP: VARCHAR2(4) */
	private String mccGrpImp ;
	
	/** mccRemark : 进件类别备注. MCC_REMARK: VARCHAR2(400) */
	private String mccRemark ;
	
	/** regSeqNo : 注册标识码. REG_SEQ_NO: VARCHAR2(50) */
	private String regSeqNo;
	
	// -- extend --
	
	/**法人证件类型中文*/
	private String personNoTypeDesc;
	
	/**商户开户人证件类型中文*/
	private String cardPersonNoTypeDesc;
	
	/** 开户行大行中文 */
	private String accntBankPrivateDesc;
	
	/** 开户行中文 */
	private String bankBranchNoDesc;
	
	/** mccGrpDesc : 商户类别. MCC_GRP: VARCHAR2(4) */
	private String mccGrpDesc ;
	
	/** mccGrpImpDesc : 商户类别(预期). MCC_GRP_IMP: VARCHAR2(4) */
	private String mccGrpImpDesc ;
	
	/** wechatPayRate : 微信费率.*/
	private Long wechatPayRate ;
	
	/** outCardRate : 外卡费率.*/
	private Long outCardRate ;
	
	/** alipayPayRate : 支付宝费率 */
	private Long alipayPayRate ;
	
	/** merStatementsType : 商户结算类型.  MER_STATEMENTS_TYPE */
	private String merStatementsType ;
	
	/** merStatementsRate : 垫资手续费费率.  MER_STATEMENTS_RATE */
	private String merStatementsRate ;
	
	/** 报备数据 */
	private String[] mobileAdd;//lxl 报备 20161220
	
	private String merActiveQrcChannel;
	
	public String getMerActiveQrcChannel(){
	    return this.merActiveQrcChannel;
	}
	public void setMerActiveQrcChannel(String merActiveQrcChannel){
	    this.merActiveQrcChannel = merActiveQrcChannel;
	}
	
	public String[] getMobileAdd() {
		return mobileAdd;
	}
	public void setMobileAdd(String[] mobileAdd) {
		this.mobileAdd = mobileAdd;
	}
	public Long getWechatPayRate() {
		return wechatPayRate;
	}
	public void setWechatPayRate(Long wechatPayRate) {
		this.wechatPayRate = wechatPayRate;
	}
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
	/***移动支付商户报备文件--新增字段（Add by XG）**/
	private String instId;
	private String instMerId;
	private String instMerName;
	private String merPhoneNO;
	private String merAddr;
	private String merCardInfo;
	private String merCardBank;
	private String merIDType;
	private String merIDNO;
	private String merStat;
	private String merShortName;
	private String channelMerId;
	public void setInstId(String instId){
		this.instId = instId;
	}
	public String getInstId(){
		return this.instId;
	}
	public void setInstMerId(String instMerId){
		this.instMerId = instMerId;
	}
	public String getInstMerId(){
		return this.instMerId;
	}
	public void setInstMerName(String instMerName){
		this.instMerName = instMerName;
	}
	public String getInstMerName(){
		return this.instMerName;
	}
	public void setMerPhoneNO(String merPhoneNO){
		this.merPhoneNO = merPhoneNO;
	}
	public String getMerPhoneNO(){
		return this.merPhoneNO;
	}
	public void setMerAddr(String merAddr){
		this.merAddr = merAddr;
	}
	public String getMerAddr(){
		return this.merAddr;
	}
	public void setMerCardInfo(String merCardInfo){
		this.merCardInfo = merCardInfo;
	}
	public String getMerCardInfo(){
		return this.merCardInfo;
	}
	public void setMerCardBank(String merCardBank){
		this.merCardBank = merCardBank;
	}
	public String getMerCardBank(){
		return this.merCardBank;
	}
	public void setMerIDType(String merIDType){
		this.merIDType = merIDType;
	}
	public String getMerIDtype(){
		return this.merIDType;
	}
	public void setMerIDNO(String merIDNO){
		this.merIDNO = merIDNO;
	}
	public String getMerIDNO(){
		return this.merIDNO;
	}
	public void setMerStat(String merStat){
		this.merStat = merStat;
	}
	public String getMerStat(){
		return this.merStat;
	}
	public void setMerShortName(String merShortName){
		this.merShortName = merShortName;
	}
	public String getMerShortName(){
		return this.merShortName;
	}
	public void setChannelMerId(String channelMerId){
		this.channelMerId = channelMerId;
	}
	public String getChannelMerId(){
		return this.channelMerId;
	}	
	
	
	/***支付方式描述**/
	private String payDesc;
	
	/***支付来源**/
	private String transMethod;
	
	/***支付费率**/
	private String merFee;
	
	/***MCC大类描述**/
	private String mccDesc;
	
	/***区域码描述**/
	private String codeName;
	
	/** accntNoPrivate : 对私帐户号码. ACCNT_NO_PRIVATE: VARCHAR2(20) */
	private String accntNoPrivate ;
	
	/** accntNamePrivate : 对私帐户名称. ACCNT_NAME_PRIVATE: VARCHAR2(100) */
	private String accntNamePrivate ;
	
	public String getAccntBankNoPrivate() {
		return accntBankNoPrivate;
	}
	public void setAccntBankNoPrivate(String accntBankNoPrivate) {
		this.accntBankNoPrivate = accntBankNoPrivate;
	}
	public String getChargeTypeZh() {
		return chargeTypeZh;
	}
	public void setChargeTypeZh(String chargeTypeZh) {
		this.chargeTypeZh = chargeTypeZh;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
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
	public String getFeeTypeZh() {
		return feeTypeZh;
	}
	public void setFeeTypeZh(String feeTypeZh) {
		this.feeTypeZh = feeTypeZh;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
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
	public String getTaxNO() {
		return taxNO;
	}
	public void setTaxNO(String taxNO) {
		this.taxNO = taxNO;
	}
	public String getCertNO() {
		return certNO;
	}
	public void setCertNO(String certNO) {
		this.certNO = certNO;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getPersonNO() {
		return personNO;
	}
	public void setPersonNO(String personNO) {
		this.personNO = personNO;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusiBgTime() {
		return busiBgTime;
	}
	public void setBusiBgTime(String busiBgTime) {
		this.busiBgTime = busiBgTime;
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
	public String getMerCreateDate() {
		return merCreateDate;
	}
	public void setMerCreateDate(String merCreateDate) {
		this.merCreateDate = merCreateDate;
	}
	public String getPosNum() {
		return posNum;
	}
	public void setPosNum(String posNum) {
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
	public String getAccntNO() {
		return accntNO;
	}
	public void setAccntNO(String accntNO) {
		this.accntNO = accntNO;
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
	public String getCardPersonNO() {
		return cardPersonNO;
	}
	public void setCardPersonNO(String cardPersonNO) {
		this.cardPersonNO = cardPersonNO;
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
	public int getMerTidCount() {
		return merTidCount;
	}
	public void setMerTidCount(int merTidCount) {
		this.merTidCount = merTidCount;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getMerTids() {
		return merTids;
	}
	public void setMerTids(String merTids) {
		this.merTids = merTids;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getGradeFlag() {
		return gradeFlag;
	}
	public void setGradeFlag(String gradeFlag) {
		this.gradeFlag = gradeFlag;
	}
	public String getFirstTcn() {
		return firstTcn;
	}
	public void setFirstTcn(String firstTcn) {
		this.firstTcn = firstTcn;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
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
	public String getTidTypeZh() {
		return tidTypeZh;
	}
	public void setTidTypeZh(String tidTypeZh) {
		this.tidTypeZh = tidTypeZh;
	}
	public String getTidModel() {
		return tidModel;
	}
	public void setTidModel(String tidModel) {
		this.tidModel = tidModel;
	}
	public String getTidUpdDate() {
		return tidUpdDate;
	}
	public void setTidUpdDate(String tidUpdDate) {
		this.tidUpdDate = tidUpdDate;
	}
	public String getTidAddress() {
		return tidAddress;
	}
	public void setTidAddress(String tidAddress) {
		this.tidAddress = tidAddress;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusZH() {
		return statusZH;
	}
	public void setStatusZH(String statusZH) {
		this.statusZH = statusZH;
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
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getAreaCodeZH() {
		return areaCodeZH;
	}
	public void setAreaCodeZH(String areaCodeZH) {
		this.areaCodeZH = areaCodeZH;
	}
	public String getAccntTypeZH() {
		return accntTypeZH;
	}
	public void setAccntTypeZH(String accntTypeZH) {
		this.accntTypeZH = accntTypeZH;
	}
	public String getApplyDateStart() {
		return applyDateStart;
	}
	public void setApplyDateStart(String applyDateStart) {
		this.applyDateStart = applyDateStart;
	}
	public String getApplyDateEnd() {
		return applyDateEnd;
	}
	public void setApplyDateEnd(String applyDateEnd) {
		this.applyDateEnd = applyDateEnd;
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
	public String getLastUptOrg() {
		return lastUptOrg;
	}
	public void setLastUptOrg(String lastUptOrg) {
		this.lastUptOrg = lastUptOrg;
	}
	public String getSpdFlagZH() {
		return spdFlagZH;
	}
	public void setSpdFlagZH(String spdFlagZH) {
		this.spdFlagZH = spdFlagZH;
	}
	public String getBankNO() {
		return bankNO;
	}
	public void setBankNO(String bankNO) {
		this.bankNO = bankNO;
	}
	public String getBankBranchNO() {
		return bankBranchNO;
	}
	public void setBankBranchNO(String bankBranchNO) {
		this.bankBranchNO = bankBranchNO;
	}
	public String getFftAccntZH() {
		return fftAccntZH;
	}
	public void setFftAccntZH(String fftAccntZH) {
		this.fftAccntZH = fftAccntZH;
	}
	public String getFirstTcnZH() {
		return firstTcnZH;
	}
	public void setFirstTcnZH(String firstTcnZH) {
		this.firstTcnZH = firstTcnZH;
	}
	public String getSecondTcnZH() {
		return secondTcnZH;
	}
	public void setSecondTcnZH(String secondTcnZH) {
		this.secondTcnZH = secondTcnZH;
	}
	public String getTidStatus() {
		return tidStatus;
	}
	public void setTidStatus(String tidStatus) {
		this.tidStatus = tidStatus;
	}
	
	public String getApproveOrgCode() {
		return approveOrgCode;
	}
	public void setApproveOrgCode(String approveOrgCode) {
		this.approveOrgCode = approveOrgCode;
	}
	public String getTidStatusZH() {
		return tidStatusZH;
	}
	public void setTidStatusZH(String tidStatusZH) {
		this.tidStatusZH = tidStatusZH;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getFftMid() {
		return fftMid;
	}
	public void setFftMid(String fftMid) {
		this.fftMid = fftMid;
	}
	public String getFftTid() {
		return fftTid;
	}
	public void setFftTid(String fftTid) {
		this.fftTid = fftTid;
	}
	public String getIpFlag() {
		return ipFlag;
	}
	public void setIpFlag(String ipFlag) {
		this.ipFlag = ipFlag;
	}
	public String getIpFeeType() {
		return ipFeeType;
	}
	public void setIpFeeType(String ipFeeType) {
		this.ipFeeType = ipFeeType;
	}
	public String getIpFeeRate() {
		return ipFeeRate;
	}
	public void setIpFeeRate(String ipFeeRate) {
		this.ipFeeRate = ipFeeRate;
	}
	public String getIfCcbIpZH() {
		return ifCcbIpZH;
	}
	public void setIfCcbIpZH(String ifCcbIpZH) {
		this.ifCcbIpZH = ifCcbIpZH;
	}
	public String getIpFeeTypeZH() {
		return ipFeeTypeZH;
	}
	public void setIpFeeTypeZH(String ipFeeTypeZH) {
		this.ipFeeTypeZH = ipFeeTypeZH;
	}
	/**
	 * @return the docTransferName
	 */
	public String getDocTransferName() {
		return docTransferName;
	}
	/**
	 * @param docTransferName the docTransferName to set
	 */
	public void setDocTransferName(String docTransferName) {
		this.docTransferName = docTransferName;
	}
	/**
	 * @return the docTransferPhone
	 */
	public String getDocTransferPhone() {
		return docTransferPhone;
	}
	/**
	 * @param docTransferPhone the docTransferPhone to set
	 */
	public void setDocTransferPhone(String docTransferPhone) {
		this.docTransferPhone = docTransferPhone;
	}
	/**
	 * @return the docTransferEmail
	 */
	public String getDocTransferEmail() {
		return docTransferEmail;
	}
	/**
	 * @param docTransferEmail the docTransferEmail to set
	 */
	public void setDocTransferEmail(String docTransferEmail) {
		this.docTransferEmail = docTransferEmail;
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
	 * Set debitRate : 借记卡_费率. DEBIT_RATE: NUMBER(5) 
	 */
	public void setDebitRate(Long debitRate){
		this.debitRate = debitRate;	
	}
	
	/**
	 * Get debitRate : 借记卡_费率. DEBIT_RATE: NUMBER(5) 
	 */
	public Long getDebitRate(){
		return this.debitRate;	
	}
	
	/**
	 * Set debitMaxFee : 借记卡_单笔封顶值. DEBIT_MAX_FEE: NUMBER(12) 
	 */
	public void setDebitMaxFee(Long debitMaxFee){
		this.debitMaxFee = debitMaxFee;	
	}
	
	/**
	 * Get debitMaxFee : 借记卡_单笔封顶值. DEBIT_MAX_FEE: NUMBER(12) 
	 */
	public Long getDebitMaxFee(){
		return this.debitMaxFee;	
	}
	
	/**
	 * Set creditRate : 贷记卡_费率. CREDIT_RATE: NUMBER(5) 
	 */
	public void setCreditRate(Long creditRate){
		this.creditRate = creditRate;	
	}
	
	/**
	 * Get creditRate : 贷记卡_费率. CREDIT_RATE: NUMBER(5) 
	 */
	public Long getCreditRate(){
		return this.creditRate;	
	}
	
	/**
	 * Set creditMaxFee : 贷记卡_单笔封顶值. CREDIT_MAX_FEE: NUMBER(12) 
	 */
	public void setCreditMaxFee(Long creditMaxFee){
		this.creditMaxFee = creditMaxFee;	
	}
	
	/**
	 * Get creditMaxFee : 贷记卡_单笔封顶值. CREDIT_MAX_FEE: NUMBER(12) 
	 */
	public Long getCreditMaxFee(){
		return this.creditMaxFee;	
	}
	
	/**
	 * Set mccGrp : 商户所属大类. MCC_GRP: VARCHAR2(4) 
	 */
	public void setMccGrp(String mccGrp){
		this.mccGrp = mccGrp;	
	}
	
	/**
	 * Get mccGrp : 商户所属大类. MCC_GRP: VARCHAR2(4) 
	 */
	public String getMccGrp(){
		return this.mccGrp;	
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
	 * @return the payDesc
	 */
	public String getPayDesc() {
		return payDesc;
	}
	/**
	 * @param payDesc the payDesc to set
	 */
	public void setPayDesc(String payDesc) {
		this.payDesc = payDesc;
	}
	/**
	 * @return the transMethod
	 */
	public String getTransMethod() {
		return transMethod;
	}
	/**
	 * @param transMethod the transMethod to set
	 */
	public void setTransMethod(String transMethod) {
		this.transMethod = transMethod;
	}
	/**
	 * @return the merFee
	 */
	public String getMerFee() {
		return merFee;
	}
	/**
	 * @param merFee the merFee to set
	 */
	public void setMerFee(String merFee) {
		this.merFee = merFee;
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
	 * @return the codeName
	 */
	public String getCodeName() {
		return codeName;
	}
	/**
	 * @param codeName the codeName to set
	 */
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	/**
	 * @return the accntNoPrivate
	 */
	public String getAccntNoPrivate() {
		return accntNoPrivate;
	}
	/**
	 * @param accntNoPrivate the accntNoPrivate to set
	 */
	public void setAccntNoPrivate(String accntNoPrivate) {
		this.accntNoPrivate = accntNoPrivate;
	}
	/**
	 * @return the accntNamePrivate
	 */
	public String getAccntNamePrivate() {
		return accntNamePrivate;
	}
	/**
	 * @param accntNamePrivate the accntNamePrivate to set
	 */
	public void setAccntNamePrivate(String accntNamePrivate) {
		this.accntNamePrivate = accntNamePrivate;
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


  public String getTerStat() {
      return terStat;
  }


  public void setTerStat(String terStat) {
      this.terStat = terStat;
  }

  public String getTerType() {
      return terType;
  }

  public void setTerType(String terType) {
      this.terType = terType;
  }


  public String getBusiType() {
      return busiType;
  }


  public void setBusiType(String busiType) {
      this.busiType = busiType;
  }


  public String getTerPhone() {
      return terPhone;
  }

  public void setTerPhone(String terPhone) {
      this.terPhone = terPhone;
  }


  public String getTerAddr() {
      return terAddr;
  }

  public void setTerAddr(String terAddr) {
      this.terAddr = terAddr;
  }


  public String getTerPersonName() {
      return terPersonName;
  }


  public void setTerPersonName(String terPersonName) {
      this.terPersonName = terPersonName;
  }

  public String getTerMerName() {
      return terMerName;
  }


  public void setTerMerName(String terMerName) {
      this.terMerName = terMerName;
  }


  public String getBusiMerNO() {
      return busiMerNO;
  }


  public void setBusiMerNO(String busiMerNO) {
      this.busiMerNO = busiMerNO;
  }

  public String getTerSerial() {
      return terSerial;
  }


  public void setTerSerial(String terSerial) {
      this.terSerial = terSerial;
  }


  public String getTerMadeFacName() {
      return terMadeFacName;
  }


  public void setTerMadeFacName(String terMadeFacName) {
      this.terMadeFacName = terMadeFacName;
  }


  public String getTerModel() {
      return terModel;
  }


  public void setTerModel(String terModel) {
      this.terModel = terModel;
  }


  public String getTerDeployTime() {
      return terDeployTime;
  }


  public void setTerDeployTime(String terDeployTime) {
      this.terDeployTime = terDeployTime;
  }


  public String getTerCommType() {
      return terCommType;
  }


  public void setTerCommType(String terCommType) {
      this.terCommType = terCommType;
  }


  public String getTerScanFunc() {
      return terScanFunc;
  }


  public void setTerScanFunc(String terScanFunc) {
      this.terScanFunc = terScanFunc;
  }


  public String getTerBarCardFunc() {
      return terBarCardFunc;
  }


  public void setTerBarCardFunc(String terBarCardFunc) {
      this.terBarCardFunc = terBarCardFunc;
  }


  public String getTerContactICFunc() {
      return terContactICFunc;
  }


  public void setTerContactICFunc(String terContactICFunc) {
      this.terContactICFunc = terContactICFunc;
  }


  public String getTerNonContactICFunc() {
      return terNonContactICFunc;
  }


  public void setTerNonContactICFunc(String terNonContactICFunc) {
      this.terNonContactICFunc = terNonContactICFunc;
  }

  public String getTerNoCardPayFunc() {
      return terNoCardPayFunc;
  }


  public void setTerNoCardPayFunc(String terNoCardPayFunc) {
      this.terNoCardPayFunc = terNoCardPayFunc;
  }


  public String getTerBusiFunc() {
      return terBusiFunc;
  }

  public void setTerBusiFunc(String terBusiFunc) {
      this.terBusiFunc = terBusiFunc;
  }

  
  public String getConfTime() {
      return confTime;
  }

  public void setConfTime(String confTime) {
      this.confTime = confTime;
  }
  
}
