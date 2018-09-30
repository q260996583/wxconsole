package com.jiuyu.batchServer.bussiness.wxrobot.service.interfaces;

import java.util.List;

import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public interface ILotteryAnalysiser {
	public  List<TblLotteryOrder>  analysiser(String content, LotteryInfoVo lottery, TblLotteryMerchant merchant) throws Exception;
}
