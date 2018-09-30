package com.jiuyv.common;

/**
 * 常量 
 * @author 111111
 *
 */
public interface Constants {
	/**
	 * 非金机构入账银联给定字串用于MD5加密
	 */
	String MD5StrFromUnionPay = "8982C0A3D05AF23B";

	/**
	 * 字符串常量：空串
	 */	
	String EMPTY_STRING = "";
	
	/** 字符串常量："true". */
	String BOOLEAN_TRUE_STRING = "true";
	
	/** 交易代码 邮储/银联签到. */
	String TXNCODE_PLT_SIGN_IN = "181001";
	
	/** 交易代码 邮储签退. */
	String TXNCODE_PLT_SIGN_OUT = "181002";
	
	/** 交易代码 MAK重置. */
	String TXNCODE_PLT_MAK_RESET = "182001";
	
	/** 交易代码 PIK重置. */
	String TXNCODE_PLT_PIK_RESET = "182002";

	/** 交易代码 退货. */
	String TXNCODE_PLT_RETURN = "022000";
	
	/** 交易代码 终端主密钥申请. */
	String TXNCODE_TID_KEY_APP = "081003" ;
	
	/** 交易代码 消费（邮储） */
	String TXNCODE_CONSUME = "021000";
	
	/** 交易代码 预授权完成（邮储）*/
	String TXNCODE_AUTH_FINISH = "032000" ;

	/** 交易代码 银联总对总签到. */
	String TXNCODE_UPH_PLT_SIGN_IN = "381001";
	
	/** 交易代码 银联总对总签退. */
	String TXNCODE_UPH_PLT_SIGN_OUT = "381002";
	
	/** 交易代码 银联总对总线路测试. */
	String TXNCODE_UPH_TEST = "381003";
	
	/** 交易代码 银联总对总MAK重置. */
	String TXNCODE_UPH_PLT_MAK_RESET = "382001";
	
	/** 交易代码 银联总对总PIK重置. */
	String TXNCODE_UPH_PLT_PIK_RESET = "382002";
	
}
