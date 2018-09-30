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

public class HappyTenLotteryAnalysiser implements ILotteryAnalysiser {

	@Override
	public List<TblLotteryOrder> analysiser(String content, LotteryInfoVo lottery,
			TblLotteryMerchant merchant) throws Exception {
		return this.exeHasppyOrders(content, merchant, lottery);
	}
	
	private List<TblLotteryOrder> exeHasppyOrders(String content, TblLotteryMerchant thisMer, LotteryInfoVo lottery) throws Exception {
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
				newOrder.setLotteryType("10");
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
		if(codeZh.matches("^[一二三四五].*$")) {//数值
			String zlfield = codeZh.substring(0,1);
			String zl = codeZh.substring(1,codeZh.length());
			
			String code = zl+ "/" + transAmt +",,,";//大小
			if(zl.matches("^[单双].*$")) {
				code = "," + zl+ "/" + transAmt + ",,";
			} else if(zl.matches("^[1-9]|1[0-9]|2[0-1]$")) {//数值
				code =  ",,"+ zl+"/"+transAmt+",";
			} else if(zl.matches("^(尾大)|(尾小)$")) {//尾大尾小
				code = ",,," + zl+ "/" + transAmt;
			}
			switch(zlfield) {
			case "一" : order.setField1(code);break;
			case "二" : order.setField2(code);break;
			case "三" : order.setField3(code);break;
			case "四" : order.setField4(code);break;
			case "五" : order.setField5(code);break;
			}
		} else {
			String code = codeZh + "/" + transAmt;
			
			if(codeZh.matches("^总[单双].*$")) {
				order.setTotalSingleDouble(code);
			} else if(codeZh.matches("^总[大小]$")) {
				order.setTotalBigSmall(code);
			} else if(codeZh.matches("^[龙虎]$")) {
				order.setDragonTigger(codeZh + "/" + transAmt);
			} else {//尾大尾小
				order.setTotalTailBigSmall(code);
			}
		}
		return order;
	}
}
