package com.jiuyv.common;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public final class AppCode {
	/**
	 * 24字节的密钥
	 */
	/*
	public static final byte[] threedeskey = { 0x68, 0x75, 0x61, 0x74, 0x65,
			0x6E, 0x67, 0x31, 0x68, 0x75, 0x61, 0x74, 0x65, 0x6E, 0x67, 0x31,
			0x68, 0x75, 0x61, 0x74, 0x65, 0x6E, 0x67, 0x31 };
	 */

	public static final String txnOrg = "0000000003";

	// 上级商户至少需要的级别
	public static final int FATHER_ORG_LEVEL = 2;
	// 商户状态 作废
	public static final String BUSIORG_STATUE_DEL = "03";
	// 一级
	public static final int LEVEL_ONE_ORG_LEVEL = 1;
	// 三级
	public static final int LEVEL_THREE_ORG_LEVEL = 3;
	// 合作运营商type
	public static final String ORG_TYPE_COOP = "999";
	// VERSION初始
	public static final long INIT_VERSION = 1;

	// 批量增删改查一次性最大数量
	public static final long MAX_BATCH_SIZE = 500;
	/** 新增定单 */
	public static final String TXN_ADD_ORDER = "112001";
	/** 修改定单 */
	public static final String TXN_UPDATE_ORDER = "112001";
	/** 确认定单 */
	public static final String TXN_CONFIRM_ORDER = "112003";
	/** 取消订单 */
	public static final String TXN_CANCEL_ORDER = "112005";
	/** 撤销已确认订单 */
	public static final String TXN_CANCEL_CFM_ORDER = "112007";
	/** 驳回订单 */
	public static final String TXN_REJECT_CFM_ORDER = "112009";
	/** 修改已确认定单 */
	public static final String TXN_UPDATE_CFM_ORDER = "112011";

	// 额度交易流水表 子序号
	public static final long LIMIT_DTL_SEQ_IN = 1L;

	public interface TickType {
		/** 020001 团队普通票 */
		String NOR_TICK = "020001";
		/** 020002 团队优惠票 */
		String PRE_TICK = "020002";
		/** 990001 赠票(普通) */
		String GIFT_TICK_NOR = "990001";

		/** 990002 赠票 (优惠) */
		String GIFT_TICK_PRE = "990002";
	}

	public interface OrderStatus {
		/** 00 草稿 */
		String CRAFT = "00";
		/** 01 待确认 */
		String TO_CONF = "01";
		/** 02 已确认 */
		String CONFIRMED = "02";
		/** 03 驳回 */
		String REVERT = "03";
		/** 09 已删除 */
		String DELETED = "09";
	}

	public interface ChangeState {
		/** 0-未换票 */
		String NOT_CHNG = "0";
		/** 1-已确认 */
		String CONFIRMED = "1";
		/** 2-已打印 */
		String PRINTED = "2";
		/** 3-已出票 */
		String TAKEN = "3";

	}

	public interface SaleType {

		String GROUP = "02";

	}

	/**
	 * 团队支付方式
	 * 
	 * @author cowyk
	 * 
	 */
	public interface PayMode {
		/** 01预付款支付 */
		String PREPAY_MODE = "01";
		/** 02现场支付 */
		String LIVEPAY_MODE = "02";
	}

	public interface LimitDef {

		/** 非指定社库 040001 */
		String TRAVEL_PUB = "040001";
	}

	public interface ORG_TYPE {
		/** 指定社 */
		String  POINTED_ORG= "11";
	}
	
	/** 备付金文件 **/
//	银行代码(浦发)
	public static final String FFT_BANK_ID="6";
//	服务商编号
	public static final String SERVICE_ID="80010000";
//	业务类型（备付金存管）
	public static final String BUSI_TYPE="7";
//	币种（人民币）
	public static final String CURRENCY_CODE="0";
//	客户类型（个人）
	public static final String CUST_TYPE="0";
//	客户账户类型（备付金）
	public static final String CUST_ACCT_TYPE="01";
//	备付金帐号状态（正常）
	public static final String CUST_ACCT_STATUS="0";
//	证件类型（身份证）
	public static final String CERTIFICATION_TYPE="1";
//	备注（默认为空）
	public static final String REMARK="";
//  付款放帐号
	public static final String PAY_ACCT_ID="98010154900000023";
//  付款方户名
	public static final String PAY_ACCT_NAME="浦发";
//  建行内部机构号
	public static final String CCB_BANK_CODE="1230000002";	
//  建行内部终端号
	public static final String CCB_INNER_TID="00000001";		
	
	public static final Map<String, String> GROUP_CHANGE_NOR2IP_MAP = new ConcurrentHashMap<String, String>() {
		{
			put("00000", "00005");
			put("00001", "00006");
			put("00002", "00007");
			put("00003", "00008");
		}
	};
	
	public static final Map<String, String> GROUP_CHANGE_IP2NOR_MAP = new ConcurrentHashMap<String, String>() {
		{
			put("00005", "00000");
			put("00006", "00001");
			put("00007", "00002");
			put("00008", "00003");
		}
	};
}
