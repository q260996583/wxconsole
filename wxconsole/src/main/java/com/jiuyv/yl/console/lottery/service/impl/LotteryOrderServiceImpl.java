package com.jiuyv.yl.console.lottery.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.jiuyv.yl.console.lottery.dao.inter.TblLotteryOrderDAO;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrderExample;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;

public class LotteryOrderServiceImpl implements ILotteryOrderService {
	private TblLotteryOrderDAO tblLotteryOrderDAO;

	public TblLotteryOrderDAO getTblLotteryOrderDAO() {
		return tblLotteryOrderDAO;
	}

	public void setTblLotteryOrderDAO(TblLotteryOrderDAO tblLotteryOrderDAO) {
		this.tblLotteryOrderDAO = tblLotteryOrderDAO;
	}

	@Override
	public List selectByLotteryId(TblLotteryOrder order)
			throws SQLException {
		TblLotteryOrderExample example = new TblLotteryOrderExample();
			example.createCriteria().andLotteryIdEqualTo(order.getLotteryId())
			.andLotteryTypeEqualTo(order.getLotteryType()).andStatusEqualTo("00");
		return tblLotteryOrderDAO.selectByExample(example);
	}

	@Override
	public List selectByLotteryId(String orderId, String orderType)
			throws SQLException {
		TblLotteryOrderExample example = new TblLotteryOrderExample();
			example.createCriteria().andLotteryIdEqualTo(orderId)
			.andLotteryTypeEqualTo(orderType);
		example.setOrderByClause("merId");
		return tblLotteryOrderDAO.selectByExample(example);
	}
	
	@Override
	public int updateOrder(TblLotteryOrder order) throws SQLException {
		TblLotteryOrderExample example = new TblLotteryOrderExample();
		example.createCriteria().andMeridEqualTo(order.getMerid())
			.andLotteryIdEqualTo(order.getLotteryId())
			.andLotteryTypeEqualTo(order.getLotteryType()).andIdEqualTo(order.getId());
		return tblLotteryOrderDAO.updateByExampleSelective(order, example);
	}

	@Override
	public int insertOrder(TblLotteryOrder order) throws SQLException {
		tblLotteryOrderDAO.insertSelective(order);
		return 1;
	}
	
	@Override
	public List selectTodayLotteryOrder()
			throws SQLException {
		return tblLotteryOrderDAO.selectOrderGroupMerid();
	}
	
	@Override
	public TblLotteryOrder selectByMsgIdAndMerId(String msgId, String merId)
			throws SQLException {
		TblLotteryOrder order = new TblLotteryOrder();
		order.setMsgId(msgId);
		order.setMerid(merId);
		return tblLotteryOrderDAO.selectOrderByMsgId(order);
	}

	@Override
	public int doCancleOrder(String msgId, String merId) throws SQLException {
		TblLotteryOrder order = new TblLotteryOrder();
		order.setMsgId(msgId);
		order.setMerid(merId);
		return tblLotteryOrderDAO.updateCancleOrder(order);
	}
}
