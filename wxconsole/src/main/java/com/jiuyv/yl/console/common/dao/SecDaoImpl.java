package com.jiuyv.yl.console.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.yl.console.orgmngr.entity.CoreMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.MerchantSubVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.ExtendSqlMapClientDaoSupport;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

/**
 * The Class SecDaoImpl.
 */
public class SecDaoImpl extends ExtendSqlMapClientDaoSupport implements ISecDao {

	private static Logger LOGGER = LoggerFactory.getLogger(SecDaoImpl.class);
	
	/** The selectid. */
	private static final String selectSecSyscode = "common.select_sec_code";
	
	/** The Constant selectSyscode. */
	private static final String selectSyscode="common.select_any_code";
	
	/** The Constant selectSendRes. */
	private static final String selectSendRes="common.select_send_res";
	
	/** The Constant SELECT_OUT_TRANS_SEC_CODE. */
	private static final String SELECT_OUT_TRANS_SEC_CODE = "common.selectOutTransSecCode";
	
	/** The Constant SELECT_ALL_OUT_MID. */
	private static final String SELECT_ALL_OUT_MID="common.select_all_out_mid";
	
	/**
	 * 查询系统参数.
	 *
	 * @param filters the filters
	 * @return the list< sec code vo>
	 * @throws Exception             the exception
	 */
	public ExtData<SecCodeVo> findSecCodeList(List<Filter> filters)
			throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtDataALL(
				selectSecSyscode, filters);
	}
	
	
	/**
	 * 系统中地区编码增加，需要支持分页功能.
	 *
	 * @param filters the filters
	 * @param page the page
	 * @return the ext data
	 * @throws Exception the exception
	 */
	@SuppressWarnings("unchecked")
	public ExtData<SecCodeVo> findSecCodePageList(List<Filter> filters,Page page) throws Exception{
		return (ExtData<SecCodeVo>)getExtendSqlMapClientTemplate().queryExtendForExtData(selectSecSyscode,filters,page);
	}

	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.common.dao.ISecDao#findSecCodeVal(java.util.List)
	 */
	public ExtData<SecCodeVo> findSecCodeVal(List<Filter> tempFilters)
			throws Exception {
		// TODO Auto-generated method stub
		return getExtendSqlMapClientTemplate().queryExtendForExtDataALL(
				selectSyscode, tempFilters);
	}

	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.common.dao.ISecDao#findSendList(java.util.List)
	 */
	public ExtData<SecCodeVo> findSendList(List<Filter> tempFilters)
			throws Exception {
		// TODO Auto-generated method stub
		return this.getExtendSqlMapClientTemplate().queryExtendForExtDataALL(selectSendRes, tempFilters);
		
	}


	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.common.dao.ISecDao#selectOutTransSecCodeList(java.util.List)
	 */
	@Override
	public ExtData<SecCodeVo> selectOutTransSecCodeList(List<Filter> filters)
			throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtDataALL(SELECT_OUT_TRANS_SEC_CODE, filters);
	}


	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.common.dao.ISecDao#findAllOutMid(java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	@Override
	public ExtData<MerchantSubVo> findAllOutMid(List<Filter> tempFilters,Page page)
			throws Exception {
		// TODO Auto-generated method stub
		return getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_ALL_OUT_MID, tempFilters,page);
	}
	
	/**
	 * 根据codeType查询参数信息.
	 *
	 * @param codeType the code type
	 * @return the map
	 * @throws Exception the exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,String> findCodeByType(String codeType) throws Exception {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("codeType", codeType);
		return getExtendSqlMapClientTemplate().getSqlMapClient().queryForMap("common.findCodeByType", params, "codeNo", "codeName");
	}
	
	/**
	 * 查询全部MCC代码.
	 *
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> findAllMccCode() {
		try {
			return getExtendSqlMapClientTemplate().getSqlMapClient().queryForMap("common.findAllMccCode", new HashMap<String,String>(), "mcc", "mccGrp");
		} catch (SQLException e) {
			LOGGER.error("findAllMccCode failed. ", e);
		}
		return null;
	}
	
	/**
	 * 查询MCC费率信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CoreMccRateVo> findCoreMccRate() {
		try {
			return getExtendSqlMapClientTemplate().getSqlMapClient().queryForList("common.findCoreMccRate");
		} catch (SQLException e) {
			LOGGER.error("findCoreMccRate failed. ", e);
		}
		return null;
	}
	
	/**
	 * 分页查询MCC费率信息
	 * @param filters
	 * @param page
	 * @return
	 */
	public ExtData<CoreMccRateVo> findCoreMccRatePage(List<Filter> filters, Page page) {
		try {
			return getExtendSqlMapClientTemplate().queryExtendForExtData("common.findCoreMccRatePage", filters, page);
		} catch (SQLException e) {
			LOGGER.error("findCoreMccRatePage failed. ", e);
		}
		return null;
	}
}



