package com.jiuyv.yl.console.lottery.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.lottery.dao.inter.TblLotteryMerchantDAO;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchantExample;

public class TblLotteryMerchantDAOImpl	implements TblLotteryMerchantDAO {
    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    private SqlMapClient sqlMapClient;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public TblLotteryMerchantDAOImpl(SqlMapClient sqlMapClient) {
        super();
        this.sqlMapClient = sqlMapClient;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int countByExample(TblLotteryMerchantExample example) throws SQLException {
        Integer count = (Integer)  sqlMapClient.queryForObject("tbl_lottery_merchant.ibatorgenerated_countByExample", example);
        return count.intValue();
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int deleteByExample(TblLotteryMerchantExample example) throws SQLException {
        int rows = sqlMapClient.delete("tbl_lottery_merchant.ibatorgenerated_deleteByExample", example);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int deleteByPrimaryKey(String merid) throws SQLException {
        TblLotteryMerchant key = new TblLotteryMerchant();
        key.setMerid(merid);
        int rows = sqlMapClient.delete("tbl_lottery_merchant.ibatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public void insert(TblLotteryMerchant record) throws SQLException {
        sqlMapClient.insert("tbl_lottery_merchant.ibatorgenerated_insert", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public void insertSelective(TblLotteryMerchant record) throws SQLException {
        sqlMapClient.insert("tbl_lottery_merchant.ibatorgenerated_insertSelective", record);
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public List selectByExample(TblLotteryMerchantExample example) throws SQLException {
        List list = sqlMapClient.queryForList("tbl_lottery_merchant.ibatorgenerated_selectByExample", example);
        return list;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public TblLotteryMerchant selectByPrimaryKey(String merid) throws SQLException {
        TblLotteryMerchant key = new TblLotteryMerchant();
        key.setMerid(merid);
        TblLotteryMerchant record = (TblLotteryMerchant) sqlMapClient.queryForObject("tbl_lottery_merchant.ibatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int updateByExampleSelective(TblLotteryMerchant record, TblLotteryMerchantExample example) throws SQLException {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = sqlMapClient.update("tbl_lottery_merchant.ibatorgenerated_updateByExampleSelective", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int updateByExample(TblLotteryMerchant record, TblLotteryMerchantExample example) throws SQLException {
        UpdateByExampleParms parms = new UpdateByExampleParms(record, example);
        int rows = sqlMapClient.update("tbl_lottery_merchant.ibatorgenerated_updateByExample", parms);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int updateByPrimaryKeySelective(TblLotteryMerchant record) throws SQLException {
        int rows = sqlMapClient.update("tbl_lottery_merchant.ibatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    public int updateByPrimaryKey(TblLotteryMerchant record) throws SQLException {
        int rows = sqlMapClient.update("tbl_lottery_merchant.ibatorgenerated_updateByPrimaryKey", record);
        return rows;
    }

    /**
     * This class was generated by Apache iBATIS ibator.
     * This class corresponds to the database table tbl_lottery_merchant
     *
     * @ibatorgenerated Sat Oct 21 22:17:14 CST 2017
     */
    private static class UpdateByExampleParms extends TblLotteryMerchantExample {
        private Object record;

        public UpdateByExampleParms(Object record, TblLotteryMerchantExample example) {
            super(example);
            this.record = record;
        }

        public Object getRecord() {
            return record;
        }
    }

	@Override
	public synchronized String queryMerSeq() throws Exception {
		return (String)sqlMapClient.queryForObject("tbl_lottery_merchant.queryMerSeq", null);
	}
	
    @Override
    public List<TblLotteryMerchant> findOutQrcMerApply(List<Filter> filters, Page pageInfo) throws Exception {
    	Map<String,Integer> map = new HashMap<String,Integer>();
    	if(null != pageInfo) {
    		if(null != pageInfo.getStart())
        		map.put("start", Integer.parseInt(pageInfo.getStart()));
        	if(null != pageInfo.getLimit())
        		map.put("limit", Integer.parseInt(pageInfo.getLimit()));
    	}
        return sqlMapClient.queryForList("tbl_lottery_merchant.selectLotterMerInfo", map);
    }
    
    public void updateMerAmt(TblLotteryMerchant merchant) throws Exception {
    	sqlMapClient.update("tbl_lottery_merchant.updateMerAmt", merchant);
    }
}