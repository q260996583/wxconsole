package com.jiuyv.yl.console.lottery.batch;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;

public class HappyTenTask {
	private static Logger LOGGER = LoggerFactory.getLogger(HappyTenTask.class);
	private static boolean lock = true;
	
	private ILotteryResultOperService lotteryResultOperService;
	
	public ILotteryResultOperService getLotteryResultOperService() {
		return lotteryResultOperService;
	}

	public void setLotteryResultOperService(
			ILotteryResultOperService lotteryResultOperService) {
		this.lotteryResultOperService = lotteryResultOperService;
	}

	//开奖信息
    public void runLotteryInfo(){
    	if(lock) {
    		lock = false;
    		LOGGER.info("TASK==================》HappyTenTask.runLotteryInfo");
            try {
            	List<LotteryInfoVo> lotteryListResults = LotteryWebUtil
            			.getLotteryInfoVos(LotteryWebUtil.FASTT_10_RESULT_URL);
            	lotteryResultOperService.processRunLotteryInfo(lotteryListResults, "10");
            	List<LotteryInfoVo> lotteryList = LotteryWebUtil
            			.getLotteryInfoVos(LotteryWebUtil.FASTT_10_RUNINFO_URL);
            	lotteryResultOperService.processRunTimeNow(lotteryList, "10");
            } catch(Exception e) {
            	lock = true;
            	LOGGER.info("Exception==================》HappyTenTask.getRunLotteryInfo:"
            			+ "!!!!"
            			+ e.getMessage());
            	e.printStackTrace();
            }
            lock = true;
    	}
    }
    
    //当前开奖时间
    public synchronized void runTimeNow() {
    	LOGGER.info("TASK==================》HappyTenTask.runTimeNow");
        try {
        	List<LotteryInfoVo> lotteryList = LotteryWebUtil
        			.getLotteryInfoVos(LotteryWebUtil.FASTT_10_RUNINFO_URL);
        	lotteryResultOperService.processRunTimeNow(lotteryList, "10");
        } catch(Exception e) {
        	LOGGER.info("Exception==================》HappyTenTask.getRunLotteryInfo:"
        			+ "!!!!"
        			+ e.getMessage());
        	e.printStackTrace();
        }
    }
}
