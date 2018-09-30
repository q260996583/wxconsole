package com.jiuyv.yl.console.finance.entity;

/**
 * 财务管理字典
 *
 * @author
 * @version 1.0.0
 * @since 2015-12-2
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public interface FinanceDict {

	/**
	 * 付款申请单类型
	 * 
	 * 01-商户付款 02-服务商分润
	 * 
	 * @author
	 *
	 */
	interface PayReqType {
		/** 01-商户付款 */
		String MCHNT = "01";
		/** 02-服务商分润 */
		String PROXY = "02";
		/** 03-无卡支付**/
		String MOBILE = "03";
	}

	/**
	 * 付款申请单状态
	 * TBL_STLM_PAY_REQ
	 */
	interface PayReqStatus {
		/** 01-已生成 */
		String INIT = "01";
		/** 02-已提交 */
		String SUBMIT = "02";
		/** 03-已审核 */
		String AUDIT = "03";
		/** 04-部分出账(商户) */
		String PART_STL = "04";
		/** 05-已确认(服务商) */
		String CONFIRM = "05";
		/** 06-已出账 */
		String SETTLE = "06";
		/** 08-已驳回 */
		String REJECT = "08";
		/** 09-已删除 */
		String DELETE = "09";
	}

	/**
	 * 支付账户状态
	 * 
	 * @author
	 *
	 */
	interface AccntFlag {
		/** 4-正常 */
		String NORMAL = "4";

	}
	
	/**
	 * 出入账标识
	 * 00:入账,01:出账
	 * @author 
	 *
	 */
	interface InoutFlag {
		/** 00:入账 */ 
		String IN = "00";
		/** 01:出账 */		
		String OUT = "01" ;
	}
	
	/** 序列名称 */
	String CHNL_FUND_SEQ = "CHNL_FUND_SEQ";
	
	/**
	 * 交易出账状态
	 * TBL_MHT_BALANCE_LOG
	 * @author
	 *
	 */
	interface transApplyStatus {
		/** 01-待处理 */
		String UNDEAL = "01";
		/** 02-出款成功 */
		String AMT_SUCCESS = "02";
		/** 03-付款单生成 */
		String CRT = "03";
		/** 04-待出账 */
		String WT_APPLY = "04";
		/** 05-出账中 */
		String APPLYING = "05";
		/** 09-剔除 */
		String REMOVE = "09";
		/** 10-不出账 */
		String UNAPPLY = "10";
		/** 11-出款失败 */
		String AMT_FAILED = "11";
	}
	
	/**
	 * 余额操作类型
	 * 
	 * @author
	 *
	 */
	interface BalanceOprType {
		/** 01-交易结算款 */
		String SETTLE_AMT = "01";
		/** 02-风控交易冻结 */
		String TRANS_LOCK = "02";
		/** 03-风控交易解冻 */
		String TRANS_UNLOCK = "03";
		/** 04-风控人工冻结金额 */
		String AMT_LOCK = "04";
		/** 05-风控人工解冻金额 */
		String AMT_UNLOCK = "05";
		/** 06-清算人工调整 */
		String SETTLE_ADJUST = "06";
		/** 07-出款失败记录 */
		String AMT_FAILED = "07";
		/** 08-出款成功记录 */
		String AMT_SUCCESS = "08";
	}
	
	/**
	 * 交易对账标识
	 * 
	 * @author
	 *
	 */
	interface TransCheckFLag {
		/** 00-未对账 */
		String UNDEAL = "00";
		/** 01-对账平 */
		String CHECK_SUCCESS = "01";
		/** 02-对账不平 */
		String CHECK_FAILED = "02";
		/** 03-日切落账 */
		String DAY = "03";
	}
	
	/**
	 * 商户冻结标识
	 * 
	 * @author
	 *
	 */
	interface MhtLockFlag {
		/** 0-正常 */
		String NORMAL = "0";
		/** 1-冻结 */
		String LOCKED = "1";

	}
	
	/**
	 * 冻结解冻标识
	 * 
	 * @author
	 *
	 */
	interface TransLockFlag {
		/** 00-已解冻 */
		String UNLOCK = "00";
		/** 01-未解冻 */
		String LOCK = "01";

	}
	
	/**
	 * 冻结解冻操作类型
	 * 
	 * @author
	 *
	 */
	interface LockType {
		/** 00-解冻 */
		String UNLOCK = "00";
		/** 01-冻结 */
		String LOCK = "01";

	}
	
	/**
	 * 余额操作记录状态
	 * 
	 * @author
	 *
	 */
	interface BalanceLogStatus {
		/** 00-未处理 */
		String UNDEAL = "00";
		/** 01-付款单生成 */
		String CRT = "01";
		/** 02-已处理 */
		String DEALED = "02";
		/** 09-已删除*/
		String DELETED = "09";
	}
	
	/**
	 * 差错记录状态
	 * 
	 * @author
	 *
	 */
	interface errStatus {
		/** 00-未处理 */
		String UNDEAL = "00";
		/** 01-商户清算已处理 */
		String MCHNT = "01";
		/** 02-待服务商分润处理 */
		String W_CHNL = "02";
		/** 03-服务商分润已处理*/
		String CHNL = "03";
		/** 04-付款单生成 */
		String PAY_REQ = "04";
		/** 09-无需处理*/
		String DELETE = "09";
	}

	/**
	 * 手工退货标记
	 * 
	 * @author
	 *
	 */
	interface returnFlag {
		/** 00-未退货*/
		String UNDEAL = "00";
		/** 01-已退货 */
		String DEALED = "01";
	}
	
	/**
	 * 原交易匹配标识
	 * 
	 * @author
	 *
	 */
	interface matchFlag {
		/** 00-未匹配 */
		String UN_MATCH = "00";
		/** 01-已匹配 */
		String MATCH = "01";
	}
	
	/**
	 * 财务结账标识
	 * 
	 * @author
	 *
	 */
	interface applyLock {
		/** fin.apply.lock 财务结账标识paramCode */
		String APPLY_LOCK_CODE = "fin.apply.lock";
		/** 1-已结账 */
		String APLLY_LOCKED = "1";
		/** 2-未结账 */
		String APLLY_UNLOCKED = "0";
	}
	
	/**
	 * 清算日报手工填写部分状态
	 *
	 */
	interface StlmManulStatus {
		/** 01-已生成 */
		String INIT = "01";
		/** 02-已提交 */
		String SUBMIT = "02";
		/** 03-已审核 */
		String AUDIT = "03";
		/** 04-临时结账 */
		String PART_LOCK = "04";
		/** 05-结账撤销 */
		String UNLOCK = "05";
		/** 08-审核驳回 */
		String DENY = "08";
		/** 09-已删除 */
		String DELETE = "09";
	}
	
	/**
	 * 清算日报手工填写部分锁定状态
	 *
	 */
	interface StlmManulLockFlag {
		/** 00-未锁定 */
		String INIT = "00";
		/** 01-已锁定 */
		String LOCKED = "01";
	}
	
	/**
	 * 余额操作记录初稿状态
	 * 
	 * @author
	 *
	 */
	interface BalanceLogUpdStatus {
		/** 01-草稿 */
		String CRT = "01";
		/** 02-提交 */
		String SUBMIT = "02";
		/** 03-审核通过 */
		String CHECKED = "03";
		/** 04-审核驳回*/
		String REJECT = "04";
		/** 09-删除*/
		String DELETED = "09";
	}
}
