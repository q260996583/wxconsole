package com.jiuyv.yl.console.lottery.batch;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyu.batchServer.bussiness.wxrobot.action.ChatRobotAction;
import com.jiuyu.batchServer.bussiness.wxrobot.utils.ImagePanle;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrderShow;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;

public class HappyNotityTask {
	private static Logger LOGGER = LoggerFactory.getLogger(HappyNotityTask.class);
	
	private String KEY = "HELLO";
	private ILotteryResultOperService lotteryResultOperService;
	
	private ILotteryOrderService lotteryOrderService;
	
	public ILotteryOrderService getLotteryOrderService() {
		return lotteryOrderService;
	}

	public void setLotteryOrderService(ILotteryOrderService lotteryOrderService) {
		this.lotteryOrderService = lotteryOrderService;
	}

	public ILotteryResultOperService getLotteryResultOperService() {
		return lotteryResultOperService;
	}

	public void setLotteryResultOperService(
			ILotteryResultOperService lotteryResultOperService) {
		this.lotteryResultOperService = lotteryResultOperService;
	}

	//开奖信息 notify
    public void wxNotity(String lotteryType, ChatRobotAction chatRobotAction){
    	LOGGER.info("TASK==================》notity");
        try {
        	//step1: 查询status=00 时间在区间
        	List<Filter> filters = new ArrayList<Filter>();
        	List<String> notifyList =  Arrays.asList("1","4");
    		String systime = DateUtil.getFormateDate("yyyyMMdd");
    		filters.add(new Filter("systemTime",Filter.STRING, systime,Comparison.GT));//快10
    		filters.add(new Filter("systemTime",Filter.STRING, systime+"235959",Comparison.LT));//快10
    		filters.add(new Filter("status",Filter.STRING, "03",Comparison.NE));
    		filters.add(new Filter("notifyStatus",Filter.LIST, notifyList,Comparison.IN));
    		filters.add(new Filter("lotteryType",Filter.STRING, lotteryType,Comparison.EQ));
    		List<LotteryInfoVo> list = lotteryResultOperService.findLotteryInfo(filters);
    		for(LotteryInfoVo vo : list) {
    			String title = "\n" + vo.getLotteryId() + "期\n";
				if("03".equals(lotteryType)) {//快乐三分
					title = "快三"+title;
				} else {
					title = "快乐十分"+title;
				}
				Date finishTime = DateUtil.formateStringToDate(
						vo.getFinishTime(), "yyyy-MM-dd HH:mm:ss");
				Date startTime = DateUtil.formateStringToDate(
						vo.getStartTime(), "yyyy-MM-dd HH:mm:ss");
//				synchronized(KEY) {
				switch(vo.getNotifyStatus()) {
				case "1" : 
    				Date systimeDate = new Date();
    				if(finishTime.getTime()>systimeDate.getTime() && 
    						startTime.getTime()<systimeDate.getTime()) {
    					String msg = title+" \n投注时间：\n" + 
    						DateUtil.formDateToString(startTime, "yyyyMMdd") + "\n" +
    						DateUtil.formDateToString(startTime, "HH:mm:ss") + "~\n" +
    						DateUtil.formDateToString(finishTime, "HH:mm:ss");
        				if(chatRobotAction.sendGroups(msg, "00")) {
        					vo.setNotifyStatus("4");//进入第二次发送
            				lotteryResultOperService.updatetLotteryInfo(vo);
        				}
    				}
					break;
				case "4" : //开奖结果
					if(isNotNull(vo.getLotteryResult())) {
    					//String msg = title+getOrderResultMsg(vo);
						String path = chatRobotAction.retImgPath;
						String oraFileName = "public/k10.jpg";
						String destFileName = "public/10Result.jpg";
						List<LotteryInfoVo> looteryImg = lotteryResultOperService
								.limitQueryLotteryInfo(vo);
						if("10".equals(lotteryType)) {
							ImagePanle.createLottery10Img(looteryImg, path + oraFileName, 
									path + destFileName);
						} else {//03
							oraFileName = "public/k3.jpg";
							destFileName = "public/3Result.jpg";
							ImagePanle.createLottery03Img(looteryImg, path + oraFileName, 
									path + destFileName);
						}
        				if(chatRobotAction.sendGroups(destFileName, "01")) {
        					vo.setNotifyStatus("99");//进入结束
            				lotteryResultOperService.updatetLotteryInfo(vo);
        				}
    				}
					break;
				}
			}
//    		}
        	//step3: 查询status=00 时间在区间
        } catch(Exception e) {
        	LOGGER.info("Exception==================》notity:"
        			+ "!!!!"
        			+ e.getMessage());
        	e.printStackTrace();
        }
    }

	private String getOrderResultMsg(LotteryInfoVo vo) throws Exception {
		String msg = "";
		String result = vo.getLotteryResult().replace(",", "-");
		result += "\n总[";
		String sum = "";
		if(isNotNull(vo.getTotalSingleDouble())) {
			sum += "," + vo.getTotalSingleDouble() +" ";
		}
		if(isNotNull(vo.getTotalBigSmall())) {
			sum += "," + vo.getTotalBigSmall()+" ";
		}
		if(isNotNull(vo.getTotalTailBigSmall())) {
			sum += "," + vo.getTotalTailBigSmall()+" ";
		}
		if(isNotNull(vo.getDragonTigger())) {
			sum += "," + vo.getDragonTigger()+" ";
		}
		if(isNotNull(vo.getLeopard())) {
			sum += "," + vo.getLeopard()+" ";
		}
		result += isNotNull(sum)?sum.substring(1):"";
		result += "]\n";
		
		if(isNotNull(vo.getField1())) {
			result += "码1[" + vo.getField1() + "] ";
		}
		if(isNotNull(vo.getField2())) {
			result += "码2[" + vo.getField2() + "] ";
		}
		if(isNotNull(vo.getField3())) {
			result += "码3[" + vo.getField3() + "] ";
		}
		if(isNotNull(vo.getField4())) {
			result += "码4[" + vo.getField4() + "] ";
		}
		if(isNotNull(vo.getField5())) {
			result += "码5[" + vo.getField5() + "] ";
		}
		msg += result + "\n";
		TblLotteryOrder order = new TblLotteryOrder();
		order.setLotteryId(vo.getLotteryId());
		order.setLotteryType(vo.getLotteryType());
		List<TblLotteryOrder> list = lotteryOrderService
				.selectByLotteryId(order.getLotteryId(), order.getLotteryType());
		Map<String, TblLotteryOrderShow> sumResult = new HashMap<String, TblLotteryOrderShow>();
		for(TblLotteryOrder od : list) {
			if(sumResult.get(od.getMerid()) != null) {
				TblLotteryOrderShow temp = sumResult.get(od.getMerid());
				temp.addLotteryOrder(od);
			} else {
				TblLotteryOrderShow show = new TblLotteryOrderShow();
				show.setDragonTigger(od.getDragonTigger());
				show.setField1(od.getField1());
				show.setField2(od.getField2());
				show.setField3(od.getField3());
				show.setField4(od.getField4());
				show.setField5(od.getField5());
				show.setLeopard(od.getLeopard());
				show.setLotteryId(od.getLotteryId());
				show.setLotteryType(od.getLotteryType());
				show.setMerid(od.getMerid());
				show.setNickname(od.getNickname());
				show.setTotalBigSmall(od.getTotalBigSmall());
				show.setTotalSingleDouble(od.getTotalSingleDouble());
				show.setTotalTailBigSmall(od.getTotalTailBigSmall());
				show.setWinAmt(od.getWinAmt());
				sumResult.put(show.getMerid(), show);
			}
			//msg += show.getShowWin() + "\n";
		}
//		for(String key : sumResult.keySet()) {
//			TblLotteryOrderShow show = sumResult.get(key);
//			msg += show.getShowWin() + "\n";
//		}
		return msg;
	}

	private String getOrderMsg(LotteryInfoVo vo) throws Exception {
		String msg = "━━━休战线━━━\n本次攻击内容核对\n";
		TblLotteryOrder order = new TblLotteryOrder();
		order.setLotteryId(vo.getLotteryId());
		order.setLotteryType(vo.getLotteryType());
		List<TblLotteryOrder> list = lotteryOrderService
				.selectByLotteryId(order.getLotteryId(), order.getLotteryType());
		Map<String, TblLotteryOrderShow> sumResult = 
				new HashMap<String, TblLotteryOrderShow>();
		for(TblLotteryOrder od : list) {
			if(sumResult.get(od.getMerid()) != null) {
				TblLotteryOrderShow temp = sumResult.get(od.getMerid());
				temp.addLotteryOrder(od);
			} else {
				TblLotteryOrderShow show = new TblLotteryOrderShow();
				show.setDragonTigger(od.getDragonTigger());
				show.setField1(od.getField1());
				show.setField2(od.getField2());
				show.setField3(od.getField3());
				show.setField4(od.getField4());
				show.setField5(od.getField5());
				show.setLeopard(od.getLeopard());
				show.setLotteryId(od.getLotteryId());
				show.setLotteryType(od.getLotteryType());
				show.setMerid(od.getMerid());
				show.setNickname(od.getNickname());
				show.setTotalBigSmall(od.getTotalBigSmall());
				show.setTotalSingleDouble(od.getTotalSingleDouble());
				show.setTotalTailBigSmall(od.getTotalTailBigSmall());
				show.setWinAmt(od.getWinAmt());
				sumResult.put(show.getMerid(), show);
			}
		}
		for(String key : sumResult.keySet()) {
			TblLotteryOrderShow show = sumResult.get(key);
			msg += show.getShow() + "\n";
		}
		return msg;
	}
	
	
	public static void main(String[] args) {
		System.out.println("#".substring(1));
	}
	
	public boolean isNotNull(String ms) {
		if(null != ms && !ms.isEmpty()) {
			return true;
		}
		return false;
	}
}
