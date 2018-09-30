package com.jiuyv.yl.console.lottery.service.inter;

import java.util.List;
import java.util.Map;

import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public interface ILotteryResultOperService {

	ExtData<LotteryInfoVo> findLotteryInfoPate(List<Filter> filters, Page page);

	List<LotteryInfoVo> findLotteryInfo(List<Filter> filters);

	LotteryInfoVo insertLotteryInfo(LotteryInfoVo lotteryInfoVo)  throws Exception ;

	LotteryInfoVo updatetLotteryInfo(LotteryInfoVo lotteryInfoVo)
			throws BaseException;

	String processRunLotteryInfo(List<LotteryInfoVo> lotteryList,
			String lotteryType) throws Exception;

	String processRunTimeNow(List<LotteryInfoVo> lotteryList, String lotteryType)
			throws BaseException;

	List<LotteryInfoVo> selectValidOrder(String lotteryType) throws Exception;
	
	List<LotteryInfoVo> limitQueryLotteryInfo(LotteryInfoVo lottery) throws Exception;

	ExtData<TblLotteryOrder> selectLotteryOrder(Map map, Page pageInfo)
			throws Exception;
}
