package com.jiuyv.yl.console.common.dao.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.ibatis.SqlMapClientCallback;

import com.jiuyv.yl.console.common.dao.inter.IBaseDao;
import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.jiuyv.common.ibatis.ExtendSqlMapClientDaoSupport;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.exception.BaseException;

/**
 * The Class BaseDaoImpl.
 *
 * @param <T> the generic type
 */
public abstract class BaseDaoImpl<T> extends ExtendSqlMapClientDaoSupport implements IBaseDao<T>{
	
	private static Logger LOGGER = LoggerFactory.getLogger(BaseDaoImpl.class);
	
	/** The Constant SELECT_SNM. */
	protected String SELECT_SNM = ".__select";
	
	/** The Constant INSERT_SNM. */
	protected String INSERT_SNM = ".__insert";
	
	/** The Constant UPDATE_SNM. */
	protected String UPDATE_SNM = ".__update";

	/** The Constant SELECT_PK_SNM */
	protected String SELECT_PK_SNM = ".__selectByPk";
	
	/** The Constant DELETE_SNM. */
	protected String DELETE_SNM = ".__delete";
	
	/** 修改后查询出对象  */
	protected boolean fetchAfterUpdate = true ; 
	
	/**
	 * get namespace.
	 *
	 * @return the string
	 */
	protected abstract String ns() ;
	
	/**
	 * 获取sequence名称
	 * @return
	 */
	protected abstract String seq();
	
	/**
	 * 根据设计的语句查询
	 * @param obj
	 * @return
	 */
	public T findByPK(T obj ) {
		List<T> lst = getExtendSqlMapClientTemplate().queryForList(ns() + SELECT_PK_SNM, obj);
		if ( lst!= null && lst.size() == 1 ) {
			return lst.get(0);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.ruleengine.dao.base.IBaseDao#pageByCond(java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	public ExtData<T> pageByCond(List<Filter> filters, Page page) {
		try {
			return getExtendSqlMapClientTemplate().queryExtendForExtData(ns() + SELECT_SNM, filters, page);
		} catch (SQLException e) {
			LOGGER.error("pageByCond failed. ",e);
		}
		return null;
	}

	
	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.ruleengine.dao.base.IBaseDao#listByCond(java.util.List)
	 */
	public List<T> listByCond(List<Filter> filters)  {
		try {
			return getExtendSqlMapClientTemplate().getPagequeryForList(ns() + SELECT_SNM, filters, null);
		} catch (SQLException e) {
			LOGGER.error("listByCond failed. ",e);
		}
		return null;
	}
	
	/**
	 * 
	 * @param filters
	 * @return
	 * @throws SQLException
	 */
	public Long countByCond(List<Filter> filters) {
		try {
			return getExtendSqlMapClientTemplate().getCountvalue(ns() + SELECT_SNM, filters);
		} catch (SQLException e) {
			LOGGER.error("countByCond failed. ",e);
		}
		return null;
	}
	/**
	 * 
	 * @param filters
	 * @return
	 */
	public List<T> listByCond(List<Filter> filters, Page page) {
		try {
			return getExtendSqlMapClientTemplate().getPagequeryForList(ns() + SELECT_SNM, filters, page);
		} catch (SQLException e) {
			LOGGER.error("listByCond failed. ",e);
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.ruleengine.dao.base.IBaseDao#insert(java.lang.Object)
	 */
	public T insert(T obj) {
		getExtendSqlMapClientTemplate().insert(ns() + INSERT_SNM, obj);
		if ( fetchAfterUpdate ){
			return findByPK(obj);
		} else { 
			return obj;
		}
	}
	
	/* (non-Javadoc)
	 * @see com.jiuyv.yl.console.ruleengine.dao.base.IBaseDao#update(java.lang.Object)
	 */
	public T update(T obj) throws BaseException{
		int er = getExtendSqlMapClientTemplate().update(ns() + UPDATE_SNM, obj);
		if ( er == 0 ) {
			throw new BaseException("","更新失败. ");
		}
		if ( fetchAfterUpdate ) {
			return findByPK(obj);
		} else {
			return obj; 
		}
	}
	
	public int delete(T obj)  throws BaseException{
		int er = getExtendSqlMapClientTemplate().delete(ns() + DELETE_SNM, obj);
		if ( er ==-1 ) {
			throw new BaseException("","删除失败. ");
		}
		return er; 
	}
	public String nextVal(){
		String seq = seq();
		if (StringUtils.isNotBlank(seq)) {
			return (String) getExtendSqlMapClientTemplate().queryForObject("dialect.__nextval", seq);
		}
		return null ; 
	}
	
	/**
	 * 批量插入
	 * @param list
	 * @return
	 */
	public int batchInsert( final Collection<T> list ) {
		return (Integer)getExtendSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				if (list != null) {
					for ( T t : list) {
						executor.insert( ns() + INSERT_SNM, t);
					}
				}
				return executor.executeBatch();
			}
		});
	}
	
	/**
	 * 批量更新
	 * @param list
	 * @return
	 */
	public int batchUpdate( final Collection<T> list ) {
		return (Integer)getExtendSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				if (list != null) {
					for ( T t : list) {
						executor.update( ns() + UPDATE_SNM, t);
					}
				}
				return executor.executeBatch();
			}
		});
	}
	/**
	 * 批量删除
	 * @param list
	 * @return
	 */
	public int batchDelete( final Collection<T> list ) {
		return (Integer)getExtendSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				if (list != null) {
					for ( T t : list) {
						executor.delete( ns() + DELETE_SNM, t);
					}
				}
				return executor.executeBatch();
			}
		});
	}
}
