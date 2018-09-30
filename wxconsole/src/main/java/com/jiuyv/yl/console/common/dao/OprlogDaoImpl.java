package com.jiuyv.yl.console.common.dao;

import java.util.Date;
import java.util.List;

import com.jiuyv.common.Constants;
import com.jiuyv.common.ibatis.ExtendSqlMapClientDaoSupport;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.entity.OprlogVo;

/**
 * The Class OprlogDaoImpl.
 * 
 * @author gemini
 */
public class OprlogDaoImpl extends ExtendSqlMapClientDaoSupport implements IOprlogDao{

	/** The Constant SQL_NEXT_SEQ. */
	private static final String SQL_NEXT_SEQ = "common.get_next_seq";
	
	/** The Constant SQL_INSERT_LOG. */
	private static final String SQL_INSERT_LOG = "common.insert_oprlog";
	
	/** The Constant SQL_SELECT_LOG. */
	private static final String SQL_SELECT_LOG = "common.selec_opr_log";
	
	/** The Constant SEQ_NAME. */
	private static final String SEQ_NAME = "seqName";
	
	/** The Constant SEQ_FOR_OPRLOG. */
	private static final String SEQ_FOR_OPRLOG = "CONSOLE_OPRLOG_SEQ";
	
	
	/**
	 * Gets the current sequence.
	 * 
	 * @return the current sequence
	 * 
	 * @throws Exception the exception
	 */
	public Long getCurrentSequence() throws Exception {
//		Map<String, String> map = new HashMap<String, String>();
//		map.put(SEQ_NAME, SEQ_FOR_OPRLOG);
//		String res = (String) getExtendSqlMapClientTemplate().queryForObject(SQL_NEXT_SEQ, map);
		String res = String.valueOf(((new Date()).getTime()));
		return Long.valueOf(res.substring(2, res.length()));
	}
	
	/**
	 * Insert oprlog.
	 * 
	 * @param logVo the log vo
	 * 
	 * @throws Exception the exception
	 */
	public void insertOprlog(OprlogVo logVo) throws Exception {
		if ( logVo.getOprIp() == null ) {
			logVo.setOprIp(Constants.EMPTY_STRING);
		}
		if ( logVo.getOprResultInfo() == null ) {
			logVo.setOprResultInfo(Constants.EMPTY_STRING);
		}
		if ( logVo.getOprSuccess() == null ) {
			logVo.setOprSuccess(Constants.EMPTY_STRING);
		}
		if ( logVo.getOprRemark() == null ) {
			logVo.setOprRemark(Constants.EMPTY_STRING);
		}
		// 屏蔽日志记录
		getExtendSqlMapClientTemplate().insert(SQL_INSERT_LOG, logVo);
	}

	/**
	 * Find oprlog list.
	 * 
	 * @param filters the filters
	 * @param page the page
	 * 
	 * @return the ext data< oprlog vo>
	 * 
	 * @throws Exception the exception
	 */
	public ExtData<OprlogVo> findOprlogList(List<Filter> filters, Page page) throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(SQL_SELECT_LOG, filters, page);
	}
}
