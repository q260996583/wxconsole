package com.jiuyv.yl.console.orgmngr.entity;

/**
 * The Interface ChannelDict.
 */
public interface ChannelDict {

	/** MCC服务大类:CORE_MCC_TYPE. */
	String CODE_MCC_TYPE = "CORE_MCC_TYPE";

	/**
	 * 服务商结算费率变更记录控制表状态:
	 * 
	 * 00-草稿 01-提交 02-审核通过 03-审核驳回 09-删除
	 * 
	 * @author
	 *
	 */
	interface ChnlRecStatus {
		/** 00-草稿 修改当前记录 */
		String DRAFT = "00";
		/** 01-提交 不允许修改 */
		String SUBMIT = "01";
		/** 02-审核通过 新增记录 */
		String AUDIT = "02";
		/** 03-审核驳回 修改当前记录 */
		String DENY = "03";
		/** 09-删除 新增记录 */
		String DELETE = "09";
	}
	
	/**
	 * 服务商保证金变更记录控制表状态:
	 * 
	 * 00-草稿 01-提交 02-审核通过 03-审核驳回 09-删除
	 * 
	 * @author
	 *
	 */
	interface BailRecStatus {
		/** 00-草稿 修改当前记录 */
		String DRAFT = "00";
		/** 01-提交 不允许修改 */
		String SUBMIT = "01";
		/** 02-审核通过 新增记录 */
		String AUDIT = "02";
		/** 03-审核驳回 修改当前记录 */
		String DENY = "03";
		/** 09-删除 新增记录 */
		String DELETE = "09";
	}
}
