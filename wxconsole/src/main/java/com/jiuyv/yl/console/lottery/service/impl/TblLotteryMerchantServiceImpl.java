package com.jiuyv.yl.console.lottery.service.impl;

import java.util.List;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.lottery.dao.inter.TblLotteryMerchantDAO;
import com.jiuyv.yl.console.lottery.dao.inter.TblWebchantMerchantDAO;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchantExample;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

public class TblLotteryMerchantServiceImpl implements TblLotteryMerchantService {
	TblLotteryMerchantDAO tblLotteryMerchantDAO;
	private TblWebchantMerchantDAO tblWebchantMerchantDAO;
	
	public TblWebchantMerchantDAO getTblWebchantMerchantDAO() {
		return tblWebchantMerchantDAO;
	}

	public void setTblWebchantMerchantDAO(
			TblWebchantMerchantDAO tblWebchantMerchantDAO) {
		this.tblWebchantMerchantDAO = tblWebchantMerchantDAO;
	}
	public TblLotteryMerchantDAO getTblLotteryMerchantDAO() {
		return tblLotteryMerchantDAO;
	}

	public void setTblLotteryMerchantDAO(TblLotteryMerchantDAO tblLotteryMerchantDAO) {
		this.tblLotteryMerchantDAO = tblLotteryMerchantDAO;
	}

	@Override
	public List selectByMer(TblLotteryMerchant merchant) throws Exception {
		TblLotteryMerchantExample example = new TblLotteryMerchantExample();
		example.createCriteria().andMeridEqualTo(merchant.getMerid());
		return tblLotteryMerchantDAO.selectByExample(example);
	}
	
	@Override
	public void updateMer(TblLotteryMerchant merchant) throws Exception {
		TblLotteryMerchantExample example = new TblLotteryMerchantExample();
		example.createCriteria().andMeridEqualTo(merchant.getMerid());
		tblLotteryMerchantDAO.updateByExampleSelective(merchant, example);
	}

	@Override
	public void doUpdateMerAmt(TblLotteryMerchant merchant) throws Exception {
		tblLotteryMerchantDAO.updateMerAmt(merchant);
	}
	
	@Override
	public String getMerSeq() throws Exception {
		return tblLotteryMerchantDAO.queryMerSeq();
	}

	@Override
	public void insertMer(TblLotteryMerchant merchant) throws Exception {
		tblLotteryMerchantDAO.insertSelective(merchant);
	}
	
	public static void main(String[] args) {
		String reg = "^[单双].*$";
		System.out.println("鹏/100".matches(reg));
	}

	@Override
	public ExtData<TblLotteryMerchant> findOutQrcMerApply(List<Filter> filters,
			Page pageInfo) throws Exception {
		ExtData<TblLotteryMerchant> edate = ExtDataUtil.genWithData(tblLotteryMerchantDAO.findOutQrcMerApply(filters, pageInfo));
		List<TblLotteryMerchant> countList = tblLotteryMerchantDAO
				.findOutQrcMerApply(filters, null);
		edate.setTotalProperty(countList.size());
		return edate;
	}
	
	@Override
	public TblLotteryMerchant selectByMerId(String merid) throws Exception {
		return tblLotteryMerchantDAO.selectByPrimaryKey(merid);
	}
	
	@Override
	public void doDropLotteryMerchant(String merid) throws Exception {
		int j = tblWebchantMerchantDAO.deleteByPrimaryKey(merid);
		int i = tblLotteryMerchantDAO.deleteByPrimaryKey(merid);
		if(i==j && i!=1) {
			throw new BaseException("删除失败！" + i + "" + j);
		}
	}
}
