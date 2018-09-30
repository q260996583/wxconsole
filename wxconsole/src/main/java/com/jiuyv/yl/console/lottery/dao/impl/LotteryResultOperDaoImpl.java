package com.jiuyv.yl.console.lottery.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.dao.impl.BaseDaoImpl;
import com.jiuyv.yl.console.lottery.dao.inter.ILotteryResultOperDao;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;

public class LotteryResultOperDaoImpl extends BaseDaoImpl<LotteryInfoVo> 
	implements ILotteryResultOperDao {
	
	@Override
	protected String ns() {
		return "TBL_LOTTERY_RESULT";
	}

	@Override
	protected String seq() {
		return null;
	}

	@Override
	public List<LotteryInfoVo> selectValidOrder(String lotteryType)
			throws Exception {
		LotteryInfoVo vo = new LotteryInfoVo();
		vo.setLotteryType(lotteryType);
		return this.getExtendSqlMapClientTemplate().queryForList(ns()+".__selectValidOrder", vo);
	}
	
	@Override
	public List<LotteryInfoVo> limitQueryLotteryInfo(LotteryInfoVo lottery)
			throws Exception {
		return this.getExtendSqlMapClientTemplate().queryForList(ns()+".limitQueryLotteryInfo", lottery);
	}
	
	@Override
	public List<TblLotteryOrder> selectLotteryOrder(Map map, Page pageInfo)
			throws Exception {
		Map paramMap = new HashMap();
		paramMap.putAll(map);
    	if(null != pageInfo) {
    		if(null != pageInfo.getStart())
    			paramMap.put("start", Integer.parseInt(pageInfo.getStart()));
        	if(null != pageInfo.getLimit())
        		paramMap.put("limit", Integer.parseInt(pageInfo.getLimit()));
    	}
		return this.getExtendSqlMapClientTemplate().queryForList(ns()+".selectLotteryOrder", paramMap);
	}

	@Override
	public long selectLotteryOrderCount(Map map) {
		return this.getExtendSqlMapClientTemplate().queryForList(ns()+".selectLotteryOrder", map).size();
	}
}
