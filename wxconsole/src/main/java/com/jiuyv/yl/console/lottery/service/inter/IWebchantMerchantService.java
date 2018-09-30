package com.jiuyv.yl.console.lottery.service.inter;

import java.sql.SQLException;
import java.util.List;

import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchant;

public interface IWebchantMerchantService {
	public TblWebchantMerchant queryWebchantByMerId(String merId) throws Exception;

	void doInsertWebchant(TblWebchantMerchant webchant) throws Exception;

	void doUpdateWebchant(TblWebchantMerchant webchant) throws Exception;
	
	public List<TblWebchantMerchant> selectByNickname(String nickname)
			throws SQLException;
}
