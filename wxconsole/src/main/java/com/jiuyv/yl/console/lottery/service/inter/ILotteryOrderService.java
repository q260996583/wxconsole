package com.jiuyv.yl.console.lottery.service.inter;

import java.sql.SQLException;
import java.util.List;

import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public interface ILotteryOrderService {
	List selectByLotteryId(TblLotteryOrder order) throws SQLException;
	
	int updateOrder(TblLotteryOrder order) throws SQLException;
	
	int insertOrder(TblLotteryOrder order) throws SQLException;

	List selectByLotteryId(String orderId, String orderType)
			throws SQLException;

	List selectTodayLotteryOrder() throws SQLException;

	TblLotteryOrder selectByMsgIdAndMerId(String msgId, String merId) throws SQLException;
	
	int doCancleOrder(String msgId, String merId) throws SQLException;
}
