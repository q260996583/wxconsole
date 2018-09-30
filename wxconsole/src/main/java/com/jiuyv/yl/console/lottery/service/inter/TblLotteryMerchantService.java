package com.jiuyv.yl.console.lottery.service.inter;

import java.util.List;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;

public interface TblLotteryMerchantService {

	List selectByMer(TblLotteryMerchant merchant) throws Exception;

	void updateMer(TblLotteryMerchant merchant) throws Exception;
	
	String getMerSeq() throws Exception;
	
	void insertMer(TblLotteryMerchant merchant) throws Exception;
	
	public ExtData<TblLotteryMerchant> findOutQrcMerApply(List<Filter> filters, Page pageInfo)throws Exception;
	
	public void doUpdateMerAmt(TblLotteryMerchant merchant) throws Exception;

	TblLotteryMerchant selectByMerId(String merid) throws Exception;

	void doDropLotteryMerchant(String merid) throws Exception;
}
