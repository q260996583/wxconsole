package com.jiuyv.yl.console.lottery.batch;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.entity.TblLotteryWelfare;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;
import com.jiuyv.yl.console.lottery.service.inter.ITblLotteryWelfareService;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

public class EveryDayHappyNotityTask {
	private static Logger LOGGER = LoggerFactory.getLogger(EveryDayHappyNotityTask.class);
	
	private ILotteryOrderService lotteryOrderService;
	private ITblLotteryWelfareService lotteryWelfareService;
	public TblLotteryMerchantService  tblLotteryMerchantService;//商户
	
	public TblLotteryMerchantService getTblLotteryMerchantService() {
		return tblLotteryMerchantService;
	}

	public void setTblLotteryMerchantService(
			TblLotteryMerchantService tblLotteryMerchantService) {
		this.tblLotteryMerchantService = tblLotteryMerchantService;
	}

	public ITblLotteryWelfareService getLotteryWelfareService() {
		return lotteryWelfareService;
	}

	public void setLotteryWelfareService(
			ITblLotteryWelfareService lotteryWelfareService) {
		this.lotteryWelfareService = lotteryWelfareService;
	}

	public ILotteryOrderService getLotteryOrderService() {
		return lotteryOrderService;
	}

	public void setLotteryOrderService(ILotteryOrderService lotteryOrderService) {
		this.lotteryOrderService = lotteryOrderService;
	}

	//开奖信息 notify
    public void welfare(){
    	LOGGER.info("TASK==================》welfare");
        try {
        	List list = lotteryOrderService.selectTodayLotteryOrder();
        	if(null != list && !list.isEmpty()) {
        		for(int i=0; i<list.size(); i++) {
        			TblLotteryOrder order = (TblLotteryOrder)list.get(i);
        			TblLotteryMerchant merchant = new TblLotteryMerchant();
        			merchant.setMerid(order.getMerid());
        			List merList = tblLotteryMerchantService.selectByMer(merchant);
        			if(null == merList || merList.isEmpty()) {
        				continue;
        			}
        			
        			TblLotteryWelfare record = new TblLotteryWelfare();
        			record.setAmt(order.getTransAmt());
        			record.setMerid(order.getMerid());
        			record.setSystemTime(order.getSystemTime());
        			record.setTransAmtSum(order.getTransAmtSum());
        			lotteryWelfareService.insert(record);
        			
        			TblLotteryMerchant updateMer = (TblLotteryMerchant)merList.get(0);
        			//long merAmt = updateMer.getAmt() + order.getTransAmt();
        			updateMer.setAddAmt(order.getTransAmt());
        			tblLotteryMerchantService.doUpdateMerAmt(updateMer);
        		}
        	}
        } catch(Exception e) {
        	LOGGER.info("Exception==================》welfare:"
        			+ "!!!!"
        			+ e.getMessage());
        	e.printStackTrace();
        }
    }
}
