package com.jiuyv.yl.console.lottery.batch;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyu.batchServer.bussiness.wxrobot.action.ChatRobotAction;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;

public class HappyThreeTask {
	private static Logger LOGGER = LoggerFactory.getLogger(HappyThreeTask.class);
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
    		LOGGER.info("TASK==================》HappyThreeTask.runLotteryInfo");
            try {
            	List<LotteryInfoVo> lotteryListResults = LotteryWebUtil
            			.getLotteryInfoVos(LotteryWebUtil.FASTT_3_RESULT_URL);
            	lotteryResultOperService.processRunLotteryInfo(lotteryListResults, "03");
            	List<LotteryInfoVo> lotteryList = LotteryWebUtil
            			.getLotteryInfoVos(LotteryWebUtil.FASTT_3_RUNINFO_URL);
            	lotteryResultOperService.processRunTimeNow(lotteryList, "03");
            } catch(Exception e) {
            	lock = true;
            	LOGGER.info("Exception==================》HappyThreeTask.getRunLotteryInfo:"
            			+ "!!!!"
            			+ e.getMessage());
            	e.printStackTrace();
            }
            lock = true;
    	}
    }
    
    //当前开奖时间
    public void runTimeNow() {
    	LOGGER.info("TASK==================》HappyThreeTask.runTimeNow");
        try {
        	List<LotteryInfoVo> lotteryList = LotteryWebUtil
        			.getLotteryInfoVos(LotteryWebUtil.FASTT_3_RUNINFO_URL);
        	lotteryResultOperService.processRunTimeNow(lotteryList, "03");
        } catch(Exception e) {
        	LOGGER.info("Exception==================》HappyThreeTask.getRunLotteryInfo:"
        			+ "!!!!"
        			+ e.getMessage());
        	e.printStackTrace();
        }
    }
}
