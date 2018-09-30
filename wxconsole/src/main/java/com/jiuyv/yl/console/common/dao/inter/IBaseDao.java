package com.jiuyv.yl.console.common.dao.inter;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.exception.BaseException;


/**
 * The Interface IBaseDao.
 *
 * @param <T> the generic type
 */
public interface IBaseDao<T> {

	/**
	 * Find by cond.
	 *
	 * @param filters the filters
	 * @return the ext data
	 */
	ExtData<T> pageByCond(List<Filter> filters, Page page)  ;
	/**
	 * 
	 * @param filters
	 * @return
	 */
	List<T> listByCond(List<Filter> filters)  ;
	
	/**
	 * 
	 * @param filters
	 * @return
	 * @
	 */
	Long countByCond(List<Filter> filters)  ; 
	
	/**
	 * 
	 * @param filters
	 * @return
	 */
	List<T> listByCond(List<Filter> filters, Page page)  ;
	
	/**
	 * Insert.
	 *
	 * @param obj the obj
	 * @return 
	 */
	T insert(T obj) throws BaseException;
	
	/**
	 * Update.
	 *
	 * @param obj the obj
	 * @return 
	 */
	T update(T obj) throws BaseException;
	/**
	 * Delete.
	 *
	 * @param obj the obj
	 * @return 
	 */
	int delete(T obj) throws BaseException;
	
	/**
	 * 根据指定的sequence名称获取值
	 * @return
	 */
	String nextVal() ;
	
	/**
	 * 批量插入
	 * @param list
	 * @return
	 */
	int batchInsert( Collection<T> list );
	
	/**
	 * 批量更新
	 * @param list
	 * @return
	 */
	int batchUpdate( Collection<T> list );
	/**
	 * 批量删除
	 * @param list
	 * @return
	 */
	int batchDelete( Collection<T> list );
	// ExtData<T> exdDelete(T obj);
}
