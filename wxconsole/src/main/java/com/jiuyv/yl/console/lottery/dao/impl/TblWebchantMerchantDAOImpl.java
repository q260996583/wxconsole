package com.jiuyv.yl.console.lottery.dao.impl;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.yl.console.lottery.dao.inter.TblWebchantMerchantDAO;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchant;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchantExample;

import java.sql.SQLException;
import java.util.List;

public class TblWebchantMerchantDAOImpl implements TblWebchantMerchantDAO {

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	private SqlMapClient sqlMapClient;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public TblWebchantMerchantDAOImpl(SqlMapClient sqlMapClient) {
		super();
		this.sqlMapClient = sqlMapClient;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int countByExample(TblWebchantMerchantExample example)
			throws SQLException {
		Integer count = (Integer) sqlMapClient
				.queryForObject(
						"tbl_webchant_merchant.ibatorgenerated_countByExample",
						example);
		return count.intValue();
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int deleteByExample(TblWebchantMerchantExample example)
			throws SQLException {
		int rows = sqlMapClient.delete(
				"tbl_webchant_merchant.ibatorgenerated_deleteByExample",
				example);
		return rows;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int deleteByPrimaryKey(String merid) throws SQLException {
		TblWebchantMerchant key = new TblWebchantMerchant();
		key.setMerid(merid);
		int rows = sqlMapClient
				.delete("tbl_webchant_merchant.ibatorgenerated_deleteByPrimaryKey",
						key);
		return rows;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public void insert(TblWebchantMerchant record) throws SQLException {
		sqlMapClient.insert("tbl_webchant_merchant.ibatorgenerated_insert",
				record);
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public void insertSelective(TblWebchantMerchant record) throws SQLException {
		sqlMapClient
				.insert("tbl_webchant_merchant.ibatorgenerated_insertSelective",
						record);
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public List selectByExample(TblWebchantMerchantExample example)
			throws SQLException {
		List list = sqlMapClient.queryForList(
				"tbl_webchant_merchant.ibatorgenerated_selectByExample",
				example);
		return list;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public TblWebchantMerchant selectByPrimaryKey(String merid)
			throws SQLException {
		TblWebchantMerchant key = new TblWebchantMerchant();
		key.setMerid(merid);
		TblWebchantMerchant record = (TblWebchantMerchant) sqlMapClient
				.queryForObject(
						"tbl_webchant_merchant.ibatorgenerated_selectByPrimaryKey",
						key);
		return record;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int updateByExampleSelective(TblWebchantMerchant record,
			TblWebchantMerchantExample example) throws SQLException {
		UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
		int rows = sqlMapClient
				.update("tbl_webchant_merchant.ibatorgenerated_updateByExampleSelective",
						parms);
		return rows;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int updateByExample(TblWebchantMerchant record,
			TblWebchantMerchantExample example) throws SQLException {
		UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
		int rows = sqlMapClient.update(
				"tbl_webchant_merchant.ibatorgenerated_updateByExample", parms);
		return rows;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int updateByPrimaryKeySelective(TblWebchantMerchant record)
			throws SQLException {
		int rows = sqlMapClient
				.update("tbl_webchant_merchant.ibatorgenerated_updateByPrimaryKeySelective",
						record);
		return rows;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	public int updateByPrimaryKey(TblWebchantMerchant record)
			throws SQLException {
		int rows = sqlMapClient.update(
				"tbl_webchant_merchant.ibatorgenerated_updateByPrimaryKey",
				record);
		return rows;
	}

	/**
	 * This class was generated by Apache iBATIS ibator. This class corresponds to the database table tbl_webchant_merchant
	 * @ibatorgenerated  Sat Oct 28 23:54:59 CST 2017
	 */
	private static class UpdateByExampleParms extends
			TblWebchantMerchantExample {
		private Object record;

		public UpdateByExampleParms(Object record,
				TblWebchantMerchantExample example) {
			super(example);
			this.record = record;
		}

		public Object getRecord() {
			return record;
		}
	}
	
	public List<TblWebchantMerchant> selectByNickname(String nickname)
			throws SQLException {
		TblWebchantMerchant key = new TblWebchantMerchant();
		key.setNickname(nickname);
		List<TblWebchantMerchant> record = sqlMapClient
				.queryForList("tbl_webchant_merchant.ibatorgenerated_selectByNickName",key);
		return record;
	}
}