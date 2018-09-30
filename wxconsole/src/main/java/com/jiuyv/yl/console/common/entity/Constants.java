package com.jiuyv.yl.console.common.entity;

/**
 * <h1>The Interface McnhtDict.</h1>
 * <p>
 * Descriptions:
 * </p>
 * 
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author
 * @since 2015
 * @version 1.0.0
 */
public interface Constants {

	/**
	 * <h1>The Interface MainType.</h1>
	 * <p>
	 * Descriptions:主体类型
	 * </p>
	 * 00:商户 01:终端  02:终端新增
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface MainType {
		
		String MCHNT = "00";
		
		String TID = "01";
		
	}
	
	/**
	 * <h1>The Interface MainType.</h1>
	 * <p>
	 * Descriptions:表单组
	 * </p>
	 * 00:商户信息变更 01:终端信息变更  02:终端状态变更 03:终端新增 04:商户延迟结算
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface FormGroup {
		
		String MCHNT_INFO = "00";
		
		String TID_INFO = "01";
		
		String TID_STATUS = "02";
		
		String TID_ADD = "03";
		
		String MCHNT_DELAY_STLM = "04";
	}
	
	/**
	 * <h1>The Interface AppFormStatus.</h1>
	 * <p>
	 * Descriptions:申请表状态
	 * </p>
	 * 	00:初稿 01:草稿 02:提交 03:一级代理审核 04:通过管控台审核 08:一级代理审核驳回 09管控台审核驳回 10:已删除
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface AppFormStatus {
		
		String CREATE = "00";
		
		String MODIFY = "01";
		
		String SUBMIT = "02";
		
		String CHNL_CHECKED = "03";
		
		String SYS_CHECKED = "04";
		
		String CHNL_REJECTED = "08";
		
		String SYS_REJECTED = "09";
		
		String DELETED = "10";
	}
	
	/**
	 * <h1>The Interface TidStatus.</h1>
	 * <p>
	 * Descriptions:终端状态
	 * </p>
	 * 	00:未启用 01:启用 02:停用 99:注销
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface TidStatus {
		
		String TERMINAL_NOSTART = "00" ;
		
		String TERMINAL_START = "01";
		
		String TERMINAL_DOWN = "02";
		
		String TERMINAL_SHUTDOWN = "99";
	}
	
	/**
	 * <h1>The Interface MchntStatus.</h1>
	 * <p>
	 * Descriptions:商户状态
	 * </p>
	 * 	00:未启用 01:启用 02:停用 99:注销
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface MchntStatus {
		
		String MERCHANT_NOSTART = "00" ;
		
		String MERCHANT_START = "01";
		
		String MERCHANT_DOWN = "02";
		
		String MERCHANTL_SHUTDOWN = "99";
	}
	
	/**
	 * <h1>The Interface FormCode.</h1>
	 * <p>
	 * Descriptions:表单类型
	 * </p>
	 * 	tidInfoModify: 终端信息变更 
	 *  tidAddressModify: 终端装机地址变更
	 *  tidStart: 终端启用
	 *  tidDown: 终端停用
	 *  tidShutdown: 终端注销
	 *  mchntSettleFeeModify: 商户结算费率变更
	 *  mchntSettleAccountModify: 商户结算账户变更
	 *  mchntOutNameModify: 商户对外经营名称变更
	 *  mchntTransLimitModify: 商户交易限额变更
	 *  mchntRecAccModify: 商户拓展人变更
	 *  mchntDocTransferModify: 商户调单联系人变更
	 *  tidAdd: 终端新增
	 *  mchntDelayStlm: 商户延迟结算
	 *  mchntDelayStlmCancel：商户延迟结算解除
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface FormCode {
		
		String TID_INFO = "tidInfoModify";
		
		String TID_ADDR = "tidAddressModify";
		
		String TID_START = "tidStart";
		
		String TID_DOWN = "tidDown";
		
		String TID_SHUTDOWN = "tidShutdown";
		
		String MCHNT_SETTLE_FEE = "mchntSettleFeeModify";
		
		String MCHNT_SETTLE_ACC = "mchntSettleAccountModify";
		
		String MCHNT_OUT_NAME = "mchntOutNameModify";
		
		String MCHNT_TRANS_LIMIT = "mchntTransLimitModify";
		
		String MCHNT_REC_ACC = "mchntRecAccModify";
		
		String MCHNT_DOC_TRANSFER = "mchntDocTransferModify";
		
		String TID_ADD = "tidAdd";
		
		String DELAY = "mchntDelayStlm";
		
		String DELAY_CANCEL = "mchntDelayStlmCancel";
	}
	
	/**
	 * <h1>The Interface DelayStatus.</h1>
	 * <p>
	 * Descriptions:延迟结算状态
	 * </p>
	 * 	00:未延迟 01:延迟
	 * 
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 * @author
	 * @since 2015
	 * @version 1.0.0
	 */
	interface DelayStatus {
		
		String UNDELAY = "00" ;
		
		String DELAY = "01";
		
	}
}
