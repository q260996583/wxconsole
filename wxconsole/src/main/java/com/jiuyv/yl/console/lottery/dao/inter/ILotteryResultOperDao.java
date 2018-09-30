package com.jiuyv.yl.console.lottery.dao.inter;

import java.util.List;
import java.util.Map;

import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.dao.inter.IBaseDao;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public interface ILotteryResultOperDao extends IBaseDao<LotteryInfoVo> {
	
	List<LotteryInfoVo> selectValidOrder(String lotteryType) throws Exception;
	
	List<LotteryInfoVo> limitQueryLotteryInfo(LotteryInfoVo lottery) throws Exception;

	List<TblLotteryOrder> selectLotteryOrder(Map map , Page pageInfo)
			throws Exception;

	long selectLotteryOrderCount(Map map);
}
