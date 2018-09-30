package com.jiuyv.yl.console.lottery.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.yl.console.lottery.dao.inter.ILotteryResultOperDao;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

public class LotteryResultOperServiceImpl implements ILotteryResultOperService {
	
	private ILotteryResultOperDao lotteryResultOperDao;
	private static boolean flag = true;
	
	ILotteryOrderService lotteryOrderService;
	TblLotteryMerchantService tblLotteryMerchantService;
	
	public TblLotteryMerchantService getTblLotteryMerchantService() {
		return tblLotteryMerchantService;
	}

	public void setTblLotteryMerchantService(
			TblLotteryMerchantService tblLotteryMerchantService) {
		this.tblLotteryMerchantService = tblLotteryMerchantService;
	}

	public ILotteryOrderService getLotteryOrderService() {
		return lotteryOrderService;
	}

	public void setLotteryOrderService(ILotteryOrderService lotteryOrderService) {
		this.lotteryOrderService = lotteryOrderService;
	}

	public ILotteryResultOperDao getLotteryResultOperDao() {
		return lotteryResultOperDao;
	}

	public void setLotteryResultOperDao(ILotteryResultOperDao lotteryResultOperDao) {
		this.lotteryResultOperDao = lotteryResultOperDao;
	}
	
	@Override
	public ExtData<LotteryInfoVo> findLotteryInfoPate(List<Filter> filters,Page page) {
		return lotteryResultOperDao.pageByCond(filters, page);
	}
	
	@Override
	public List<LotteryInfoVo> findLotteryInfo(List<Filter> filters) {
		return lotteryResultOperDao.listByCond(filters);
	}

	@Override
	public LotteryInfoVo insertLotteryInfo(LotteryInfoVo lotteryInfoVo) throws BaseException {
		return lotteryResultOperDao.insert(lotteryInfoVo);
	}
	
	@Override
	public LotteryInfoVo updatetLotteryInfo(LotteryInfoVo lotteryInfoVo) throws BaseException {
		return lotteryResultOperDao.update(lotteryInfoVo);
	}
	
	@Override
	public String processRunLotteryInfo(List<LotteryInfoVo> lotteryList, 
			String lotteryType) throws Exception {
		for(LotteryInfoVo vo : lotteryList) {
			LotteryInfoVo dbVo = getDbLotteryInfo(vo.getLotteryId(), lotteryType);
			if("201735011".equals(vo.getLotteryId())) {
				System.out.println(vo.getLotteryResult());
			}
			if(null == dbVo) {//只做记录
				vo.setStatus("03");//异常
				vo.setLotteryType(lotteryType);//快3
				vo.setSystemTime(DateUtil.formDateToString14(new Date()));
				this.insertLotteryInfo(vo);
			} else {
				if(null == dbVo.getLotteryResult()
						|| "".equals(dbVo.getLotteryResult())) {//更新
					//中奖图
					if(flag) {
						flag = false;
						//通过结果计算中奖域dbVo
						this.processLotteryResult(vo, dbVo, lotteryType);
						//处理中奖的订单 do 开头的加事务
						this.doProcessWinMer(dbVo, lotteryType);
						dbVo.setLotteryResult(vo.getLotteryResult());
	    				dbVo.setRunTime(vo.getRunTime());
	    				dbVo.setStatus("02");
	    				this.updatetLotteryInfo(dbVo);
	    				flag = true;
					}
				}
			}
		}
		return null;
	}
	
	private void doProcessWinMer(LotteryInfoVo dbVo, String lotteryType) throws Exception {
		TblLotteryOrder order = new TblLotteryOrder();
		order.setLotteryId(dbVo.getLotteryId());
		order.setLotteryType(dbVo.getLotteryType());
		List orderList = lotteryOrderService.selectByLotteryId(order);//本期的订单
		if(null != orderList) {//
			for(Object obj : orderList) {
				TblLotteryOrder oneOrder = (TblLotteryOrder)obj;
				this.calculate(oneOrder, dbVo);
				oneOrder.setStatus("02");
				lotteryOrderService.updateOrder(oneOrder);//查新订单状态
			}
		}
	}

	private void calculate(TblLotteryOrder oneOrder, LotteryInfoVo dbVo) throws Exception {
		TblLotteryMerchant merchant = new TblLotteryMerchant();
		merchant.setMerid(oneOrder.getMerid());
		List merList = tblLotteryMerchantService.selectByMer(merchant);
		if(null != merList && merList.size() > 0) {
			merchant = (TblLotteryMerchant)merList.get(0);
			//Long merAmt = merchant.getAmt()==null?0:merchant.getAmt();//存放分
			Long amtSum = 0L;
			String totalSingleDouble =  oneOrder.getTotalSingleDouble();
			if(isNotNull(totalSingleDouble)) {//总单双
				amtSum += this.calc(totalSingleDouble, dbVo.getTotalSingleDouble(), 195);
			}
			String totalBigSmall =  oneOrder.getTotalBigSmall();
			if(isNotNull(totalBigSmall)) {//总大小
				amtSum += this.calc(totalBigSmall, dbVo.getTotalBigSmall(), 195);
			}
			String totalTailBigSmall = oneOrder.getTotalTailBigSmall();
			if(isNotNull(totalTailBigSmall)) {//尾大小
				amtSum += this.calc(totalTailBigSmall, dbVo.getTotalTailBigSmall(), 195);
			}
			String dragonTigger = oneOrder.getDragonTigger();
			if(isNotNull(dragonTigger)) {//龙虎
				amtSum += this.calc(dragonTigger, dbVo.getDragonTigger(), 195);
			}
			String leopard = oneOrder.getLeopard();
			if(isNotNull(leopard)) {
				amtSum += this.calc(leopard, dbVo.getLeopard(), 2400);
			}
			amtSum += this.processCalField(oneOrder.getField1(), dbVo.getField1(), dbVo.getLotteryType());
			amtSum += this.processCalField(oneOrder.getField2(), dbVo.getField2(), dbVo.getLotteryType());
			amtSum += this.processCalField(oneOrder.getField3(), dbVo.getField3(), dbVo.getLotteryType());
			amtSum += this.processCalField(oneOrder.getField4(), dbVo.getField4(), dbVo.getLotteryType());
			amtSum += this.processCalField(oneOrder.getField5(), dbVo.getField5(), dbVo.getLotteryType());
			//merAmt += amtSum;
			if(amtSum > 0 ) {
				merchant.setAddAmt(amtSum);
				tblLotteryMerchantService.doUpdateMerAmt(merchant);
			}
			oneOrder.setWinAmt(amtSum);
		}
	}

	private Long processCalField(String field, String runField, String lotteryType) {
		Long amtSum = 0L;
		if(isNotNull(field)) {
			String[] fieldSpl = field.split("," , -1);
			String[] runFieldSpl = runField.split(",");
			if(isNotNull(fieldSpl[0])) {
				amtSum += this.calc(fieldSpl[0], runFieldSpl[0], 195);
			}
			if(isNotNull(fieldSpl[1])) {
				amtSum += this.calc(fieldSpl[1], runFieldSpl[1], 195);
			}
			if(isNotNull(fieldSpl[2])) {
				int mul = 500;
				if("10".equals(lotteryType)) {
					mul = 1700;
				}
				amtSum += this.calc(fieldSpl[2], runFieldSpl[2], mul);
			}
			if(fieldSpl.length>3 && isNotNull(fieldSpl[3])) {
				amtSum += this.calc(fieldSpl[3], runFieldSpl[3], 195);	
			}
		}
		return amtSum;
	}

	public Long calc(String arg1, String arg2, int mul) {
		Long amtSum = 0L;
		String bs[] = arg1.split("/");
		if("和".equals(arg2)) {
			return Long.valueOf(bs[1]);
		}
		if(bs[0].equals(arg2)) {
			Long dtSum = Long.valueOf(bs[1]) * mul;
			amtSum += new BigDecimal(dtSum).movePointLeft(2).longValue();
		}
		return amtSum;
	}
	
	public boolean isNotNull(String str) {
		if(null != str && !str.isEmpty()) {
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @param vo  网上查询的开奖号码
	 * @param retultVo 计算中奖的域
	 * @param lotteryType
	 */
	private void processLotteryResult(LotteryInfoVo vo, LotteryInfoVo retultVo, String lotteryType) {
		String[] lotteryNum = vo.getLotteryResult().split(",");//网上查询的结果 开奖号码
		retultVo.setField1(this.processSingle(Long.parseLong(lotteryNum[0]), lotteryType));
		retultVo.setField2(this.processSingle(Long.parseLong(lotteryNum[1]), lotteryType));
		retultVo.setField3(this.processSingle(Long.parseLong(lotteryNum[2]), lotteryType));
		Long sum = Long.parseLong(lotteryNum[0]) + Long.parseLong(lotteryNum[1])
				+ Long.parseLong(lotteryNum[2]);
		if("03".equals(lotteryType)) {
			if(sum%2 == 1) {
				retultVo.setTotalSingleDouble("总单");
			} else {
				retultVo.setTotalSingleDouble("总双");
			}
			if(sum > 10) {
				retultVo.setTotalBigSmall("总大");
			} else {
				retultVo.setTotalBigSmall("总小");
			}
			if(lotteryNum[0].equals(lotteryNum[1]) 
					&& lotteryNum[0].equals(lotteryNum[2])) {
				retultVo.setLeopard("豹子");//豹子
			}
		} if("10".equals(lotteryType)) {
			retultVo.setField4(this.processSingle(Long.parseLong(lotteryNum[3]), lotteryType));
			retultVo.setField5(this.processSingle(Long.parseLong(lotteryNum[4]), lotteryType));
			sum += Long.parseLong(lotteryNum[3]) + Long.parseLong(lotteryNum[4]);
			if(sum%2 == 1) {
				retultVo.setTotalSingleDouble("总单");
			} else {
				retultVo.setTotalSingleDouble("总双");
			}
			
			if(sum > 55) {
				retultVo.setTotalBigSmall("总大");
			} else if(sum == 55) {
				retultVo.setTotalBigSmall("和");
			} else {
				retultVo.setTotalBigSmall("总小");
			}
			if(sum%10 > 4) {
				retultVo.setTotalTailBigSmall("总尾大");
			} else {
				retultVo.setTotalTailBigSmall("总尾小");
			}
			
			if(Integer.valueOf(lotteryNum[0]) > 
					Integer.valueOf(lotteryNum[4])) {
				retultVo.setDragonTigger("龙");
			} else {
				retultVo.setDragonTigger("虎");
			}
		}
	}

	private String processSingle(Long filed, String lotteryType) {
		String prcRet = "";
		if("03".equals(lotteryType)) {
			//大小
			if(filed > 3) {
				prcRet = "大";
			} else {
				prcRet = "小";
			}
		} else if("10".equals(lotteryType)) {
			//大小
			if(21 == filed) {
				prcRet = "和";
			} else if(filed > 10) {
				prcRet = "大";
			} else {
				prcRet = "小";
			}
		}
		//单双
		if(21 == filed) {
			prcRet += ",和";
		} else if(filed%2 == 1) {
			prcRet += ",单";
		} else {
			prcRet += ",双";
		}
		//数值
		prcRet += "," + filed;
		//尾大小
		if("10".equals(lotteryType)) {
			Long tailInt = filed%10;
			if(21 == filed) {
				prcRet += ",和";
			} else if(tailInt > 4) {
				prcRet += ",尾大";
			} else {
				prcRet += ",尾小";
			}
		}
		return prcRet;
	}
	
	@Override
	public String processRunTimeNow(List<LotteryInfoVo> lotteryList, 
			String lotteryType) throws BaseException {
		for(LotteryInfoVo vo : lotteryList) {
    		LotteryInfoVo lotteryTemp = this.getDbLotteryInfo(vo.getLotteryId(), lotteryType);
    		if(null == lotteryTemp) {
    			vo.setLotteryType(lotteryType);
    			vo.setStatus("00");//开始
    			vo.setNotifyStatus("1");//发送1
    			vo.setSystemTime(DateUtil.formDateToString14(new Date()));
    			this.insertLotteryInfo(vo);
    		}
    	}
		return null;
	}

    public LotteryInfoVo getDbLotteryInfo(String lotteryId, String lotteryType) {
    	List<Filter> filters = new ArrayList<Filter>();
    	filters.add(new Filter("lotteryType",Filter.STRING, lotteryType,Comparison.EQ));
		filters.add(new Filter("lotteryId",Filter.STRING, lotteryId,Comparison.EQ));//正在开始的状态
		List<LotteryInfoVo> lotteryTemp = this.findLotteryInfo(filters);
		if(null != lotteryTemp && lotteryTemp.size() > 0) {
			return lotteryTemp.get(0);
		}
		return null;
    }
    
    @Override
    public List<LotteryInfoVo> selectValidOrder(String lotteryType)
			throws Exception {
    	return lotteryResultOperDao.selectValidOrder(lotteryType);
    }

	@Override
	public List<LotteryInfoVo> limitQueryLotteryInfo(LotteryInfoVo lottery)
			throws Exception {
		return lotteryResultOperDao.limitQueryLotteryInfo(lottery);
	}
	
	@Override
	public ExtData<TblLotteryOrder> selectLotteryOrder(Map map, Page pageInfo)
			throws Exception {
		ExtData data = ExtDataUtil.genWithData(lotteryResultOperDao.selectLotteryOrder(map, pageInfo));
		data.setTotalProperty(lotteryResultOperDao.selectLotteryOrderCount(map));
		return data;
	}
}
