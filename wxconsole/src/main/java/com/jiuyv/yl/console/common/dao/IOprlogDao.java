package com.jiuyv.yl.console.common.dao;

import java.util.List;

import com.jiuyv.yl.console.common.entity.OprlogVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

/**
 * The Interface IOprlogDao.
 */
public interface IOprlogDao {

	/**
	 * Gets the current sequence.
	 * 
	 * @return the current sequence
	 * 
	 * @throws Exception the exception
	 */
	Long getCurrentSequence() throws Exception;
	
	/**
	 * Insert oprlog.
	 * 
	 * @param logVo the log vo
	 * 
	 * @throws Exception the exception
	 */
	void insertOprlog(OprlogVo logVo) throws Exception;

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
	ExtData<OprlogVo> findOprlogList(List<Filter> filters, Page page) throws Exception;
}
