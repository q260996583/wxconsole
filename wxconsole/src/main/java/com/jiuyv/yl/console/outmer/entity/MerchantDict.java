package com.jiuyv.yl.console.outmer.entity;


/**
 * The Interface MerchantDict.
 *
 * @author 
 * @version 1.0.0
 * @since 2016-6-21
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public interface MerchantDict {

	/**
	 * <h1>The Interface MchntAddStatus.</h1>
	 * <p>
	 * Descriptions:进件审批状态
	 * </p>
	 * 	00:保留 01:待审批 02:业务审批通过 03:风控审批通过 04:业务驳回 05:风控审批驳回  
	 *  06:提交一级服务商复查 07:一级服务商审核驳回 09:删除
	 *
	 * @author 
	 * @version 1.0.0
	 * @since 2015
	 * @company Shanghai JinYu Software Systems CO.,LTD.
	 */
	interface MchntAddStatus {
		
		/** The create. */
		String CREATE = "00";
		
		/** The chnl checked. */
		String CHNL_CHECKED = "01";
		
		/** The buss checked. */
		String BUSS_CHECKED = "02";
		
		/** The control checked. */
		String CONTROL_CHECKED = "03";
		
		/** The buss rejected. */
		String BUSS_REJECTED = "04";
		
		/** The control rejected. */
		String CONTROL_REJECTED = "05";
		
		/** The submit. */
		String SUBMIT = "06";
		
		/** The chnl rejected. */
		String CHNL_REJECTED = "07";
		
		/** The deleted. */
		String DELETED = "09";
		
	}
}
