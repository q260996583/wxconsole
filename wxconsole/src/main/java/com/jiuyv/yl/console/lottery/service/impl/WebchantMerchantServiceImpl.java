package com.jiuyv.yl.console.lottery.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.jiuyv.yl.console.lottery.dao.inter.TblWebchantMerchantDAO;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchant;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchantExample;
import com.jiuyv.yl.console.lottery.service.inter.IWebchantMerchantService;

public class WebchantMerchantServiceImpl implements IWebchantMerchantService {
	private TblWebchantMerchantDAO tblWebchantMerchantDAO;
	
	public TblWebchantMerchantDAO getTblWebchantMerchantDAO() {
		return tblWebchantMerchantDAO;
	}

	public void setTblWebchantMerchantDAO(
			TblWebchantMerchantDAO tblWebchantMerchantDAO) {
		this.tblWebchantMerchantDAO = tblWebchantMerchantDAO;
	}

	@Override
	public TblWebchantMerchant queryWebchantByMerId(String merId)
			throws Exception {
		return tblWebchantMerchantDAO.selectByPrimaryKey(merId);
	}

	@Override
	public void doInsertWebchant(TblWebchantMerchant webchant)
			throws Exception {
		tblWebchantMerchantDAO.insert(webchant);
	}
	
	@Override
	public void doUpdateWebchant(TblWebchantMerchant webchant)
			throws Exception {
		TblWebchantMerchantExample example = new TblWebchantMerchantExample();
		example.createCriteria().andMeridEqualTo(webchant.getMerid());
		tblWebchantMerchantDAO.updateByExampleSelective(webchant, example);
	}

	@Override
	public List<TblWebchantMerchant> selectByNickname(String nickname)
			throws SQLException {
		return tblWebchantMerchantDAO.selectByNickname(nickname);
	}
}
