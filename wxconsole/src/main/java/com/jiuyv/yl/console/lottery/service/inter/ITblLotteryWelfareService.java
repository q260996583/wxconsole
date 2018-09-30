package com.jiuyv.yl.console.lottery.service.inter;

import java.sql.SQLException;

import com.jiuyv.yl.console.lottery.entity.TblLotteryWelfare;

public interface ITblLotteryWelfareService {
	public void insert(TblLotteryWelfare record) throws SQLException;
}
