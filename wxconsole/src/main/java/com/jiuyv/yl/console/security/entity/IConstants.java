package com.jiuyv.yl.console.security.entity;

// TODO: Auto-generated Javadoc
/**
 * 常量接口。
 * 存放全局使用的常量字段信息。.
 */
public interface IConstants {
	
	/** 用户上下文信息. */
	String USER_CONTEXT = "userContext";
	
	/** 访问控制. */
	String ACCESS_AUTHOR = "ACCESS_AUTHORITY";
	/** 根节点. */
	String TREE_NODE = "-1";
	String TREE_NODETEXT = "SYSTEM";
	String ORG_ROOT="-1";
	
	/** 数据存储域. */
	String RES_DATA = "resData";
	
	/** 存储菜单信息. */
	String MENU_DATA = "menuData";
	
	/** 分页信息存储域. */
	String PAGE_FLD = "page";
	
	/** 过滤器信息存储域. */
	String FILTER_FLD = "jsonfilter";	
	
	/** Action 中存储的对象信息. */
	String JSON_FLD = "jsonObject";
	
	String resoucetypememu="0";

	String resoucetypebutton="1";
	
	String logged="0";
	String nologged="1";
	
	String CODE_FLG1 = "1";
	
	/**
	* 0  未签到
	* 1  已签到
	*/
	String NO_SIGN = "0";
	String YES_SIGN = "1";
	
	/**
	 * 批次状态
	 * 0结批结束初始化
	 * 1签到
	 * 2签退
	 * 3正在结批
	 */
	String BATCH_STAT_INIT = "0";
	String BATCH_STAT_LOGIN = "1";
	String BATCH_STAT_LOGOUT = "2";
	String BATCH_STAT_BATCHING = "3";
	
	/**
	 * 退货状态
	 * 00未提交
	 * 01已提交
	 * 02已审批
	 * 03驳回
	 */
	String BACK_STAT_FRIST = "00";
	String BACK_STAT_COMMIT = "01";
	String BACK_STAT_PROV = "02";
	String BACK_STAT_BACK= "03";
	
	/**
	 * 退款类型
	 *00 联机退款
	 *01 手工退款
	 */
	String RETURN_TYPE = "00";
	String RETURN_TYPE1 = "01";
	/**
	 *冲正标志
	 *0 未冲正
	 *1已冲正
	 */
	String ROLL_BACK1 = "0";
	String ROLL_BACK2 = "1";
	/**
	 *撤销标志
	 *0未撤销
	 *1已撤销
	 *2当日退货
	 *3非当日退货
	 */
	String CANCEL_FLAG = "0";
	String CANCEL_FLAG1 = "1";
	String CANCEL_FLAG2 = "2";
	String CANCEL_FLAG3 = "3";
	
//  终端
	/**
	 * 终端审批状态
	 * 00 草稿
	 * 01 待审批
	 * 02 审批通过
	 * 03 驳回
	 */
	String TERMINAL_STAT = "00";
	String TERMINAL_STAT1 = "01";
	String TERMINAL_STAT2 = "02";
	String TERMINAL_STAT3 = "03";
	
	/**
	*终端状态 
	* 00未启用
	* 01 启用
	* 02 停用
	* 99 注销
	*/
	String TERMINAL_NOSTART = "00" ;
	String TERMINAL_START = "01";
	String TERMINAL_DOWN = "02";
	String TERMINAL_SHUTDOWN = "99";
	
	/**
	 * 进件审批状态
	 * 00 保留
	 * 01 待审批
	 * 02 业务审批通过
	 * 03 风控审批通过
	 * 04 业务驳回
	 * 05 风控驳回
	 */
	String OUTMER_STAT = "00";
	String OUTMER_STAT1 = "01";
	String OUTMER_STAT2 = "02";
	String OUTMER_STAT3 = "03";
	String OUTMER_STAT4 = "04";
	String OUTMER_STAT5 = "05";
	
	/**
	 * 商户审批状态
	 * 00 草稿
	 * 01 待审批
	 * 02 审批通过
	 * 03 驳回
	 */
	String MERCHANT_STAT = "00";
	String MERCHANT_STAT1 = "01";
	String MERCHANT_STAT2 = "02";
	String MERCHANT_STAT3= "03";
	
	/**
	* 商户状态
	* 00未启用
	* 01 启用
	* 02 停用
	* 99 注销
	*/
	String MERCHANT_NOSTART = "00" ;
	String MERCHANT_START = "01";
	String MERCHANT_DOWN = "02";
	String MERCHANTL_SHUTDOWN = "99";
	
	/**
	 * 申鑫机构名称
	 */
	String DFS_NAME = "申鑫";
	
	/**
	 * 00 初始 
	 * 01 已签到 
	 * 02 签退
	 */
	 String SIGN_START = "00";
	 String SIGN_YES = "01";
	 String SIGN_NO = "02";
	 
	 /**
		 * 00 初始 
		 * 01 结账中
		
		 */
	 String STLM_START ="00";
	 String STLM_YES ="01";
	 
	 /**
	 * 银联内部支付机构号
	 */
	String UP_ORG_CODE = "1230000001";
	/** 建行内部机构号 */
	String CCB_ORG_CODE = "1230000002";
		
	 /** 操作符 not in */
    public static final String NOTIN="not in";
    
    /** 操作符 in */
    public static final String IN ="in";
    /** 操作符 not like */
    public static final String ULIKE = "ulike";

    /** 操作符 等于 = */
    public static final String EQ = "eq";

    /** 操作符 不等于 <> */
    public static final String NE = "ne";

    /** 操作符 大于 > */
    public static final String GT = "gt";

    /** 操作符 小于 < */
    public static final String LT = "lt";

    /** 操作符 大于等于 >= */
    public static final String GE = "ge";

    /** 操作符 小于等于 <= */
    public static final String LE = "le";
    
    /**
	 * 招商银行
	 * */
	public String MERCHANTS_BANK = "MERCHANTSBANK";
	/**
	 * 浦发银行
	 * */
	public String SPD_BANK = "SPDBANK"; 
	/**
	 * 建设银行
	 * */
	public String CONSTRUCTION_BANK="CONSTRUCTIONBANK";
	/**
	 * 民生银行
	 * */
	public String MINSHENG_BANK = "MINSHENGBANK";
	/**
	 * 光大银行
	 * */
	public String EVERBRIGHT_BANK="EVERBRIGHTBANK";
	/**
	 * 兴业银行
	 * */
	public String INDUSTRIAL_BANK="INDUSTRIALBANK";
	/**
	 * 平安银行
	 * */
	public String PINGAN_BANK="PINGANBANK";
	/**
	 * 中信银行
	 * */
	public String CITIC_BANK="CITICBANK";
	/**
	 * 帐户类别 01对公
	 * */
	public String ACCNTTYPE="01";
	/**
	 * 帐户类别 02 对私帐号
	 * */
	public String PRIVATEACCNT="02"; 
	/**
	 * 对内转帐
	 * */
	public String INNERFLAG="2";
	/**
	 * 是浦发银行
	 * */
	public String ISSPDFLAG="0";
	/**
	 * 对私
	 * */
	public String ACCNTTYPEPRIVATE="02";
	/**
	 *浦发银行
	 *	 * */
	public String SPDBANK="6";
	
	/**
	 * 0外部转账
	 * */
	public String INNERFLAG0="0";
	/**
	 * 1:同账户不转账
	 * */
	public String INNERFLAG1="1" ;
	
	/**
	 * 2:内部账户转账
	 * */
	public String INNERFLAG2="2" ;
	
	/**
	 * 不是浦发银行
	 * */
	public String NOTSPDFLAG="1" ;
	
	/**
	 * 浦发银行 开户行
	 * */
	public String BANKACCNTNAMETITLE = "浦发银行";
	/**
	 * 上海申鑫网络科技股份有限公司 帐户全称
	 * */
	public String PUBLICACCNTNAMETITLE = "上海申鑫网络科技股份有限公司";
	
	/** 报表. */
	public String PAY_APPLY_INNER_PATH = "/com/console/ireport/clear/PayApplyInner.jasper";
	public String PAY_APPLY_PUBLIC_PATH = "/com/console/ireport/clear/PayApplyPublic.jasper";
	public String BANK_PAY_APPLY_SUM_PATH = "/com/console/ireport/clear/BankPayApplySum.jasper";
	public String BANK_PAY_APPLY_SUM_FINANCE_PATH = "/com/console/ireport/clear/BankPayApplySumFinance.jasper";
	public String SZDF_PAY_APPLY_SUM_PATH = "/com/console/ireport/clear/szdfPayApplySumRpt.jasper";
	public String SPD_BANK_PAY_APPLY_PATH = "/com/console/ireport/clear/posReportSPDPayApplySummary.jasper";
	public String NONFIN_INST_APPLY_PATH = "/com/console/ireport/clear/NonFinINstPayApply.jasper";
	public String BANK_DEVIDE_FEE_NETTING_PATH = "/com/console/ireport/clear/BankDevideFeeNetting.jasper";
	public String FIRST_DEV_PROFIT_PATH = "/com/console/ireport/clear/firstDevProfit.jasper";
	public String FFT_PROFIT_PATH = "/com/console/ireport/clear/fftProfit.jasper";
	public String FFT_FLOW_FEE_PATH = "/com/console/ireport/clear/fftFlowFee.jasper";
	public String MER_FLOW_FEE_PATH = "/com/console/ireport/clear/merFlowFee.jasper";
	public String MER_BACK_CLEAR_DETAIL_PATH = "/com/console/ireport/clear/merBackClearDetailRpt.jasper";
	public String MER_BACK_CLEAR_SUM_PATH = "/com/console/ireport/clear/merBackClearSumRpt.jasper";
	public String BANK_BACK_CLEAR_DETAIL_PATH = "/com/console/ireport/clear/bankBackClearDetailRpt.jasper";
	public String BANK_BACK_CLEAR_SUM_PATH = "/com/console/ireport/clear/bankBackClearSumRpt.jasper";
	public String DAY_BANK_TO_MER_PATH = "/com/console/ireport/clear/dayBankToMerReport.jasper";
	public String DAY_MER_TO_BANK_PATH = "/com/console/ireport/clear/dayMerToBankReport.jasper";
	public String MAN_RETURN_PATH = "/com/console/ireport/clear/manReturnRpt.jasper";
	public String POS_DEV_BILL_DETAIL_PATH = "/com/console/ireport/clear/PosDevBillDetailRpt.jasper";
	public String POS_DEV_BILL_SUM_PATH = "/com/console/ireport/clear/PosDevBillSumRpt.jasper";
	public String BANK_CLEAR_FIR_PATH = "/com/console/ireport/clear/BankClearFirRpt.jasper";
	public String BANK_CLEAR_SEC_PATH = "/com/console/ireport/clear/BankClearSecRpt.jasper";
	public String BANK_CLEAR_THI_PATH = "/com/console/ireport/clear/BankClearThiRpt.jasper";
	public String BANK_BUSI_SUM_PATH = "/com/console/ireport/clear/bankBusiSum.jasper";
	
	public String SZKFT_PAY_APPLY_PATH = "/com/console/ireport/clear/SzkftPayApply.jasper";
	public String NET_CARD_PAY_PATH = "/com/console/ireport/clear/posReportNetCardPaySummary.jasper";
	public String OLD_NET_CARD_PAY_PATH = "/com/console/ireport/clear/posReportOldNetCardPaySummary.jasper";
	public String SCORE_ORG_RETURN_PATH = "/com/console/ireport/clear/scoreOrgReturn.jasper";
	public String SCORE_ORG_RETURN_EXL_PATH = "/com/console/ireport/clear/scoreOrgReturnExl.jasper";
//kft银行
	public String SZDFBANK="14";
	
	public String CUP_BANK_ACCNY_ID="15";
	

	//机构交易汇总表（收单）
	public String CHANNEL_TRANS_GATHER_PATH="/com/console/ireport/stats/channeltransferGatherNewRpt.jasper";
	//机构交易汇总表（收单-内卡）
	public String CHANNEL_TRANS_IN_GATHER_PATH="/com/console/ireport/stats/channeltransferInGatherNewRpt.jasper";
	//机构交易汇总表（收单-外卡）
	public String CHANNEL_TRANS_OUT_GATHER_PATH="/com/console/ireport/stats/channeltransferOutGatherNewRpt.jasper";
	
	//机构交易日报表（收单）
	public String CHANNEL_TRANS_GATHER_DAY_PATH="/com/console/ireport/stats/channeltransferGatherDayRpt.jasper";
	//机构交易日报表（收单-内卡）
	public String CHANNEL_TRANS_IN_GATHER_DAY_PATH="/com/console/ireport/stats/channeltransferInGatherDayRpt.jasper";
	//机构交易日报表（收单-外卡）
	public String CHANNEL_TRANS_OUT_GATHER_DAY_PATH="/com/console/ireport/stats/channeltransferOutGatherDayRpt.jasper";
	
	
	//一级服务商交易日报表（收单）
	public String CHANNEL_TRANS_DAY_PATH="/com/console/ireport/stats/firstChanneltransferGatherDayRpt.jasper";
	//一级服务商交易日报表（收单-内卡）
	public String CHANNEL_TRANS_IN_DAY_PATH="/com/console/ireport/stats/firstChanneltransferInGatherDayRpt.jasper";
	//一级服务商交易日报表（收单-外卡）
	public String CHANNEL_TRANS_OUT_DAY_PATH="/com/console/ireport/stats/firstChanneltransferOutGatherDayRpt.jasper";
		
		
	//机构手续费分润表（收单）
	public String FFT_SEC_FEE_PATH="/com/console/ireport/stats/fftSecFeeRpt.jasper";
			

	//服务商对应商户交易汇总表（收单）
	public String MER_OF_CHANNEL_PATH="/com/console/ireport/stats/merofchanneltransferRpt.jasper";
	//服务商对应商户交易汇总表（汇付）
	public String MER_OF_CHANNEL_PATH_PNR="/com/console/ireport/stats/merofchanneltransferPnrRpt.jasper";
	//汇付科技服务商交易日报表
	public String CHANNEL_TRANS_DAY_PATH_PNR="/com/console/ireport/stats/pnrTransFerDayRpt.jasper";
	
	//机构品牌服务费日报表/一级服务商品牌服务费日报表
	public String BANK_BRAND_DAY_PATH="/com/console/ireport/stats/bankBrandDayRpt.jasper";
			
	
	//机构品牌服务费汇总表
	public String BANK_BRAND_CHANNEL_PATH="/com/console/ireport/stats/bankBrandChannelRpt.jasper";
				
	
	//银联POS签购单
	public String POS_SIGN_BILL_PATH="/com/console/ireport/clear/posSignBill.jasper";
			
	//建行退款通知书报表
	public String JH_RETURN_PATH="/com/console/ireport/clear/bankTransReturn.jasper";
				
	//POS收单商户支付明细轧差表
	public String PAY_POS_MER_DETAIL="/com/console/ireport/merchant/payPosMerDetail.jasper";
	
	
	public String TERMIANL_COUNT_REPORT_A="/com/console/ireport/merchant/terminalCountRpt_a.jasper";
	public String TERMIANL_COUNT_REPORT_A1="/com/console/ireport/merchant/terminalCountRpt_a1.jasper";
	public String TERMIANL_COUNT_REPORT_A2="/com/console/ireport/merchant/terminalCountRpt_a2.jasper";
	
	//大润发的商户清算明细表
	public String POS_DEV_BILL_DETAIL_DRF_PATH = "/com/console/ireport/clear/PosDevBillDetailDRFRpt.jasper";
	
	//大丰收积分统计表
	public String POS_DEV_BILL_SUM_DRF_PATH = "/com/console/ireport/clear/PosDevBillSumDRFRpt.jasper";
	
	//大润发的商户清算汇总表
	public String QUERY_DRF_CRD_SOCRE_PATH = "/com/console/ireport/clear/DRFCreditScoreRpt.jasper";
	//汇付科技的商户清算明细表
	public String POS_DEV_BILL_DETAIL_PNR_PATH = "/com/console/ireport/clear/PosDevBillDetailPnrRpt.jasper";
	//汇付科技的商户清算汇总表
	public String POS_DEV_BILL_SUM_PATH_PNR = "/com/console/ireport/clear/PosDevBillSumPnrRpt.jasper";
	
	//POS交易情况统计表
	public String POS_TRANS_STATS="com/console/ireport/merchant/posTransStatsRpt.jasper";
	
	//POS业务交易情况汇总表
	public String POS_TRANS_SUMMARY="com/console/ireport/merchant/posTransSummaryRpt.jasper";
	
	//D0交易出款状态查询
	public String OUTCOME_TRANS_STAT_EXL="/com/console/ireport/merchant/outcomeTranStatExl.jasper";
	
	//机构银行卡收单业务量统计报表（受理终端）总表
	public String BANK_CARD_FATHER_RPT_PATH="com/console/ireport/merchant/bankCardCountRpt.jasper";	
	
	//机构银行卡收单业务量统计报表（受理终端）子表1
	public String BANK_CARD_CHILD1_RPT_PATH="com/console/ireport/merchant/bankCardChild1.jasper";	   
	//机构银行卡收单业务量统计报表（受理终端）子表的字表1.1
	public String BANK_CARD_CHILD1_1_RPT_PATH="com/console/ireport/merchant/bankCardChild1.1.jasper";	 
	
	//新增商户终端表
	public String NEW_MERTID_STATS="com/console/ireport/stats/newMerTidStatsRpt.jasper";
						
	//商户交易排名表
	public String POS_MER_TANSRANK_STATS="com/console/ireport/stats/merTransRankRpt.jasper";
				
	//终端交易排名表
	public String POS_TID_TANSRANK_STATS="com/console/ireport/stats/tidTransRankRpt.jasper";
				

	//POS交易发展情况统计表
	public String POS_DEVELOP_STATS="com/console/ireport/stats/posMccDevelopStatsRpt.jasper";
	
	//POS交易活跃情况统计表
	public String POS_ACTIVE_STATS="com/console/ireport/stats/posMccActiveStatsRpt.jasper";

	//对账结果明细表
	public String CHECK_RESULT_DETAIL_PATH="com/console/ireport/clear/checkResultDetailRpt.jasper";
	public String CHECK_PAY_FEE_RESULT_DETAIL_PATH="com/console/ireport/clear/checkPayFeeResultDetailRpt.jasper";

	
		//pos交易流水查询表
	public String POS_TRANS_RRT="/com/console/ireport/merchant/posTransRpt.jasper";
	public String QRC_TRANS_RRT="/com/console/ireport/merchant/qrcTransRpt.jasper";
	public String POS_TRANS_ALL_CARD_RRT="/com/console/ireport/merchant/posTransRptAllCard.jasper";
	
	
	//机构银行卡收单实体特约商户数量统计报表 总表
	public String BANK_CARD_MER_FATHER_RPT_PATH="com/console/ireport/merchant/bankCardMerCountRpt.jasper";	
	
	//机构银行卡收单实体特约商户数量统计报表 子表1
	public String BANK_CARD_MER_CHILD1_RPT_PATH="com/console/ireport/merchant/bankCardMerChild1.jasper";	   
	//机构银行卡收单实体特约商户数量统计报表 子表的字表1.1
	public String BANK_CARD_MER_CHILD1_1_RPT_PATH="com/console/ireport/merchant/bankCardMerChild1.1.jasper";	 
	
	//机构手续费统计表（收单日报） 
	public String FFT_SEC_FEE_DAY_RPT="com/console/ireport/clear/fftSecFeeDayRpt.jasper";
	
	//机构手续费汇总表（收单日报） 
	public String FFT_SEC_FEE_CHANNEL_RPT="com/console/ireport/clear/fftSecFeeChannelRpt.jasper";
	
	//连续X天无交易商户明细
	public String FFT_NO_TRANS_MERCHNAT="com/console/ireport/stats/noTransMerchant.jasper";
	
	//mcc分类所有的商户及终端统计
	public String FFT_MCC_MER_TID_RPT="com/console/ireport/stats/mccMerTidRpt.jasper";
	
	//人行季报-风控
	public String FFT_PEOPLE_QUARTER_RPT="com/console/ireport/stats/peopleQuarterRpt.jasper";
	//人行定期数据报表
	public String FFT_PEOPLE_QUARTER_FIXED_RPT="com/console/ireport/stats/fftPeopleQuarterFixedRpt.jasper";

	public String SZKFT_PAY_APPLY_PAGE_EXL = "/com/console/ireport/clear/SzkftPayApplyPageExlRpt.jasper";
	public String SZKFT_PAY_PAY_DETAIL_EXL = "/com/console/ireport/clear/SzkftPayDetailExlRpt.jasper";	

	public String UNION_PAY_MER_BACKUP="/com/console/ireport/merchant/unionPayMerBackup.jasper";
	public String UNION_PAY_TID_BACKUP="/com/console/ireport/merchant/unionPayTidBackup.jasper";
	//银联代付反馈清算明细表
	public String UNION_PAY_STLM_RPT="com/console/ireport/stats/unionPayStlmRpt.jasper";
	//银联代付反馈退汇明细表
	public String UNION_PAY_STLM_RETURN_RPT="com/console/ireport/stats/unionPayStlmReturnRpt.jasper";
	//多功能平台导出商户终端信息
		public String MULTI_MER_TID_FILE_EXL="/com/console/ireport/merchant/merTidExportFileExl.jasper";
	//汇善谷代付
	public String BANK_PAY_CHANNEL_APPLY_PATH = "/com/console/ireport/clear/posReportChannelPaySummary.jasper";
	//大丰收积分查询
	public String SCORE_CHANNEL_APPLY_RRT="/com/console/ireport/merchant/scoreChannelApply.jasper";
	
	//银联差错帐报表
	public String CUPS_DIFF_RRT="/com/console/ireport/clear/cupsDiffRpt.jasper";
	
	//银联差错帐已处理
	public String CUPS_DIFF_TR_RRT="/com/console/ireport/clear/cupsDiffTrRpt.jasper";
		
	//银联差错帐未处理
	public String CUPS_DIFF_UNTR_RRT="/com/console/ireport/clear/cupsDiffUntrRpt.jasper";
		
	//银联交易汇总表
	public String CUPS_SUM_RRT="/com/console/ireport/clear/cupsSumRpt.jasper";
		
	//银联退单汇总表
	public String CUPS_ROUND_SUM_RRT="/com/console/ireport/clear/cupsRoundSumRpt.jasper";
}																			


