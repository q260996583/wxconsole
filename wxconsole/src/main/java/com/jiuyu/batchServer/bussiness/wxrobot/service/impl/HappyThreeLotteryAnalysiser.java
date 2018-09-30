package com.jiuyu.batchServer.bussiness.wxrobot.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.jiuyu.batchServer.bussiness.wxrobot.service.interfaces.ILotteryAnalysiser;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.lang.date.DateUtils;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public class HappyThreeLotteryAnalysiser implements ILotteryAnalysiser {

//	public ILotteryResultOperService lotteryResultOperService;
//	public ILotteryOrderService lotteryOrderService;
//	public TblLotteryMerchantService  tblLotteryMerchantService;
	
	@Override
	public List<TblLotteryOrder> analysiser(String content, LotteryInfoVo lottery,
			TblLotteryMerchant merchant) throws Exception {
//		Long amt = merchant.getAmt();
//		String[] inSplit = content.split("/");
//		//增大2位
//		Long transAmt = new BigDecimal(Long.parseLong(inSplit[inSplit.length-1])).movePointRight(2).longValue();
//		List<TblLotteryOrder> orders = this.exeHasppyOrders(content, merchant, lottery);
		return this.exeHasppyOrders(content, merchant, lottery);
	}

	public List<TblLotteryOrder> exeHasppyOrders(String content, TblLotteryMerchant thisMer, LotteryInfoVo lottery) 
			throws BaseException {
		Long amt = thisMer.getAmt();
		String[] inSplit = content.split("/");
		Long transAmtSum = 0L;
		List<TblLotteryOrder> orders = new ArrayList<TblLotteryOrder>();
		for(int i=0; i<inSplit.length; i+=2) {//多指令
			//增大2位
			String tempConten[] = new String[2];
			System.arraycopy(inSplit, i, tempConten, 0, tempConten.length);
			Long transAmt = new BigDecimal(Long.parseLong(tempConten[1])).movePointRight(2).longValue();
			transAmtSum += transAmt;
			if(amt >= transAmtSum) {//金额判断
				TblLotteryOrder newOrder = this.exeHappy(tempConten, transAmt);
				newOrder.setLotteryId(lottery.getLotteryId());
				newOrder.setLotteryType("03");
				newOrder.setMerid(thisMer.getMerid());
				newOrder.setStatus("00");
				newOrder.setSystemTime(DateUtils.getCurDateTime());
				newOrder.setTransAmt(transAmt);
				orders.add(newOrder);
			} else {
				throw new BaseException("您积分不足:\n" + new BigDecimal(amt).movePointLeft(2).longValue());
			}
			thisMer.setAddAmt(-transAmtSum);
		}
		return orders;
	}
	
	public TblLotteryOrder exeHappy(String[] inSplit, long transAmt) {
		TblLotteryOrder order = new TblLotteryOrder();
		String codeZh = inSplit[0];//指令
		if(codeZh.matches("^[一二三].*$")) {//数值
			String zlfield = codeZh.substring(0,1);
			String zl = codeZh.substring(1,codeZh.length());
			String code = zl+ "/" + transAmt +",,";//大小
			if(zl.matches("^[单双].*$")) {
				code = "," + zl+ "/" + transAmt + ",";
			} else if(zl.matches("^[1-6]$")){//数值
				code =  ",,"+ zl+"/"+transAmt;
			}
			switch(zlfield) {
			case "一" : order.setField1(code);break;
			case "二" : order.setField2(code);break;
			case "三" : order.setField3(code);break;
			}
		} else {//总
			String code = codeZh + "/" + transAmt;
			if(codeZh.matches("^总[单双]$")) {
				order.setTotalSingleDouble(code);
			} else if(codeZh.matches("^总[大小]$")) {
				order.setTotalBigSmall(code);
			} else {
				order.setLeopard(codeZh + "/" + transAmt);
			} 
//			else {
//				order.setTotalTailBigSmall(code);
//			}
		}
		return order;
	}
	
	public static void main(String[] args) {
		System.out.println("总双".matches("^总[单双]$"));
	}
}
