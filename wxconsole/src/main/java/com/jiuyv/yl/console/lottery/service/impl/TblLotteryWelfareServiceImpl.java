package com.jiuyv.yl.console.lottery.service.impl;

import java.sql.SQLException;

import com.jiuyv.yl.console.lottery.dao.inter.TblLotteryWelfareDAO;
import com.jiuyv.yl.console.lottery.entity.TblLotteryWelfare;
import com.jiuyv.yl.console.lottery.service.inter.ITblLotteryWelfareService;

public class TblLotteryWelfareServiceImpl implements ITblLotteryWelfareService {
	TblLotteryWelfareDAO lotteryWelfareDAO;

	public TblLotteryWelfareDAO getLotteryWelfareDAO() {
		return lotteryWelfareDAO;
	}

	public void setLotteryWelfareDAO(TblLotteryWelfareDAO lotteryWelfareDAO) {
		this.lotteryWelfareDAO = lotteryWelfareDAO;
	}
	
	public void insert(TblLotteryWelfare record) throws SQLException {
		lotteryWelfareDAO.insertSelective(record);
	}
}
