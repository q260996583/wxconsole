package com.jiuyv.common.ibatis;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.IbatisCeteria;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Filter.Data;

/**
 * The Class ExtendSqlMapClientTemplate. 用来扩展spring的ibatis的SqlMapClientTemplate类
 */
public class ExtendSqlMapClientTemplate extends SqlMapClientTemplate {

	private static final Logger LOGGER = LoggerFactory.getLogger(ExtendSqlMapClientTemplate.class);
	
	/** The extendclient. 用来 使用重新封装的实例 */
	private ExtendClient extendclient = new ExtendClient();
	private static final String ASC = "asc";

	/**
	 * Extend sql map client template.
	 */
	public ExtendSqlMapClientTemplate() {

	};

	public ExtendClient getExtendclient() {
		return extendclient;
	}

	public void setExtendclient(ExtendClient extendclient) {
		this.extendclient = extendclient;
		super.setSqlMapClient(extendclient.getSqlClient());
	}

	/**
	 * Extend sql map client template.
	 * 
	 * @param sqlMapClient
	 *            the sql map client
	 * @param countmodelid
	 *            the countmodelid
	 * @param pagerid
	 *            the pagerid
	 * @throws Exception 
	 */
	public ExtendSqlMapClientTemplate(SqlMapClient sqlMapClient,
			String countmodelid, String pagerid) throws Exception {
		setcountmapmentid(countmodelid);
		setgroupmapmentid(pagerid);
		setSqlMapClient(sqlMapClient);
		try {
			extendclient.initMapments();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		afterPropertiesSet();
	};

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.orm.ibatis.SqlMapClientTemplate#setSqlMapClient(com
	 *      .ibatis.sqlmap.client.SqlMapClient)
	 */
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
		try {
			this.extendclient.setClient(sqlMapClient);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
	}

	/**
	 * Sets the countmapmentid.
	 * 
	 * @param Selectcountmapmentid
	 *            the new countmapmentid
	 * @throws Exception 
	 */
	public void setcountmapmentid(String Selectcountmapmentid) throws Exception {

			this.extendclient.setSelectcountmapmentid(Selectcountmapmentid);
		
	};

	/**
	 * Sets the groupmapmentid.
	 * 
	 * @param Selectgroupmapmentid
	 *            the new groupmapmentid
	 * @throws Exception 
	 */
	public void setgroupmapmentid(String Selectgroupmapmentid) throws Exception {

	
			this.extendclient.setSelectgroupmapmentid(Selectgroupmapmentid);
		
		
	};

	/**
	 * Query extend for ext data.
	 * 
	 * @param statementName
	 *            the statement name
	 * @param Filters
	 *            the filters
	 * @param page
	 *            the page
	 * 
	 * @return the ext data
	 * @throws SQLException 
	 * 
	 * @throws DataAccessException
	 *             the data access exception
	 * @throws SQLException
	 *             the SQL exception
	 */
	public ExtData queryExtendForExtData(final String statementName,
			List<Filter> Filters, Page page) throws SQLException {

		ExtData result = new ExtData();
		result.setSuccess(false);

			result.setTotalProperty(getCountvalue(statementName, Filters));
			result.setRoot(getPagequeryForList(statementName, Filters, page));
		
		result.setSuccess(true);
		return result;
	};
	
	public ExtData queryExtendForExtDataALL(final String statementName,
			List<Filter> Filters) throws SQLException {
		Page page=new Page();
		page.setLimit(CriteriaUtil.EXCEL);
		
		return queryExtendForExtData(statementName,Filters,page);
	};
	public ExtData queryExtendForExtDataALL(final String statementName)
			throws SQLException {
		List<Filter> filters = new ArrayList<Filter>();

		return queryExtendForExtDataALL(statementName, filters);
	};
	public ExtData queryExtendForExtDataALLByFilter(final String statementName,List<Filter> filters) throws SQLException {
		//List<Filter> filters=new ArrayList<Filter>();
		
		return queryExtendForExtDataALL(statementName,filters);
	};
	
	public ExtData insertExtendForExtDataAutoKey(String insertstateid,
			Object parameterObject, String keyname, String selectid,
			List<Filter> Filters) throws SQLException {
		Page page = new Page();
		if (Filters == null) {
			Filters = new ArrayList<Filter>();
		}
		Filter prikeyFilter = new Filter();
		Data prikeydata = new Data();

		page.setStart("0");
		page.setLimit("1");
		page.setDir("asc");
		page.setSort(keyname.toLowerCase());
		Object prikey = null;
		prikey = this.insert(insertstateid, parameterObject);

		prikeydata.setValue(prikey.toString());
		prikeydata.setComparison(Comparison.EQ);

		prikeyFilter.setField(keyname.toLowerCase());
		prikeyFilter.setData(prikeydata);

		Filters.add(prikeyFilter);

		ExtData tempdata = queryExtendForExtData(selectid, Filters, page);
		if (tempdata.getTotalProperty() == 0) {
			
				throw new SQLException("buisexception.InsertFail");
		

		}
		return tempdata;
	}

	
	public ExtData insertExtendForExtData(String insertstateid,
			Object parameterObject, String[] keypropertyname, String selectid,
			List<Filter> Filters) throws IllegalAccessException, 
			InvocationTargetException, NoSuchMethodException, SQLException,Exception {
		Page page = new Page();
		if (Filters == null) {
			Filters = new ArrayList<Filter>();
		}
	
		
		page.setStart("0");
		page.setLimit("1");
		page.setDir("asc");
		page.setSort(keypropertyname[0].toLowerCase());
		
		ExtData tempdata=null;

			this.insert(insertstateid, parameterObject);
		
			for(int i=0;i<keypropertyname.length;i++){
				Object prikeyprop = PropertyUtils.getProperty(parameterObject,
						keypropertyname[i]);
				Data prikeydata = new Data();
				prikeydata.setComparison(Comparison.EQ);
				Filter prikeyFilter = new Filter();
				prikeyFilter.setField(keypropertyname[i].toLowerCase());
				prikeydata.setValue(prikeyprop.toString());
				prikeyFilter.setData(prikeydata);
				Filters.add(prikeyFilter);
			}
			
			
			tempdata = queryExtendForExtData(selectid, Filters, page);
		
			if (tempdata.getTotalProperty() == 0) {
				throw new SQLException("buisexception.InsertFail");
			}
			
		return tempdata;
	}
	
	public ExtData insertExtendForExtData(String insertstateid,
			Object parameterObject, String keypropertyname, String selectid,
			List<Filter> Filters) throws IllegalAccessException, 
			InvocationTargetException, NoSuchMethodException, SQLException,Exception {
		List<Filter> tempFilter = new ArrayList<Filter>();
		if (Filters != null) {
			tempFilter.addAll(Filters);
		}
		Page page = new Page();
		Filter prikeyFilter = new Filter();
		Data prikeydata = new Data();
		page.setStart("0");
		page.setLimit("1");
		page.setDir("asc");
		page.setSort(keypropertyname.toLowerCase());
		prikeyFilter.setField(keypropertyname.toLowerCase());
		prikeydata.setComparison(Comparison.EQ);
		ExtData tempdata=null;

		this.insert(insertstateid, parameterObject);
		Object prikeyprop = PropertyUtils.getProperty(parameterObject,
				keypropertyname);

		prikeydata.setValue(prikeyprop.toString());
		prikeyFilter.setData(prikeydata);
		tempFilter.add(prikeyFilter);
		
		tempdata = queryExtendForExtData(selectid, tempFilter, page);
	
		if (tempdata.getTotalProperty() == 0) {
			throw new SQLException("buisexception.InsertFail");
		}
			
		return tempdata;
	}

	public ExtData updateSingleExtendForExtData(String updatestateid,
			Object parameterObject, String keypropertyname, String selectid,
			List<Filter> Filters) throws Exception {
		Page page = new Page();
		if (Filters == null) {
			Filters = new ArrayList<Filter>();
		}
		Filter prikeyFilter = new Filter();
		Data prikeydata = new Data();
		page.setStart("0");
		page.setLimit("1");
		page.setDir("asc");
		page.setSort(keypropertyname.toLowerCase());
		prikeyFilter.setField(keypropertyname);
		prikeydata.setComparison(Comparison.EQ);
		int updaterows = 0;
		ExtData tempdata=null;
	
			//先查一下是否允许操作
			long founded = getCountvalue(selectid, Filters);
			if (founded ==0){
				throw new SQLException("exception.not.found");
			};
			
			try {
				updaterows = this.update(updatestateid, parameterObject);
			} catch (Exception e) {			
				LOGGER.error("", e);
				throw e;
			}
			Object prikeyprop = PropertyUtils.getProperty(parameterObject,
					keypropertyname);

			prikeydata.setValue(prikeyprop.toString());
			prikeyFilter.setData(prikeydata);
			Filters.add(prikeyFilter);
			
			tempdata = queryExtendForExtData(selectid, Filters, page);
		
			if (updaterows == 0 || tempdata.getTotalProperty() == 0) {
				throw new SQLException("buisexception.updateFail");
				
			}
	

		
		return tempdata;
	}
	
	public ExtData updateSingleExtendWithmorekeyForExtData(
			String updatestateid, Object parameterObject,
			String[] keypropertynames, String selectid, List<Filter> filters)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, SQLException {
		Page page = new Page();
		if (filters == null) {
			filters = new ArrayList<Filter>();
		}
		Filter[] prikeyfilters = new Filter[keypropertynames.length];
		Data[] prikeydatas = new Data[keypropertynames.length];
		page.setStart("0");
		page.setLimit("1");
		page.setDir(ASC);
		for (int i = 0; i < keypropertynames.length; i++) {
			prikeyfilters[i] = new Filter();
			prikeydatas[i] = new Data();
			page.setSort(keypropertynames[i].toLowerCase());
			prikeyfilters[i].setField(keypropertynames[i].toLowerCase());
			prikeydatas[i].setComparison(Comparison.EQ);
		}
		int updaterows = 0;
		ExtData tempdata = null;

		// 先查一下是否允许操作
		long founded = getCountvalue(selectid, filters);
		if (founded == 0) {
			throw new SQLException();
		}
		;
		updaterows = this.update(updatestateid, parameterObject);
		for (int i = 0; i < keypropertynames.length; i++) {
			Object prikeyprop = PropertyUtils.getProperty(parameterObject,
					keypropertynames[i]);

			prikeydatas[i].setValue(prikeyprop.toString());
			prikeyfilters[i].setData(prikeydatas[i]);
			filters.add(prikeyfilters[i]);
		}
		tempdata = queryExtendForExtData(selectid, filters, page);
		if (updaterows == 0 || tempdata.getTotalProperty() == 0) {
			throw new SQLException("buisexception.updateFail");

		}

		return tempdata;
	}
	
	/**
	 * 
	 * @param deletestateid
	 */
	public ExtData deleteSingleExtendForExtData(String deletestateid,
			Object parameterObject, String keypropertyname, String selectid,
			List<Filter> Filters) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, SQLException {
		Page page = new Page();
		if (Filters == null) {
			Filters = new ArrayList<Filter>();
		}
		Filter prikeyFilter = new Filter();
		Data prikeydata = new Data();
		page.setStart("0");
		page.setLimit("1");
		page.setDir("asc");
		page.setSort(keypropertyname.toLowerCase());
		prikeyFilter.setField(keypropertyname.toLowerCase());
		prikeydata.setComparison(Comparison.EQ);
		int deleterows = 0;
		ExtData tempdata=null;
	
			//先查一下是否允许操作
			long founded = getCountvalue(selectid, Filters);
			if (founded ==0){
				throw new SQLException();
			};
			deleterows = this.delete(deletestateid, parameterObject);
			Object prikeyprop = PropertyUtils.getProperty(parameterObject,
					keypropertyname);

			prikeydata.setValue(prikeyprop.toString());
			prikeyFilter.setData(prikeydata);
			Filters.add(prikeyFilter);
		  tempdata = queryExtendForExtData(selectid, Filters, page);
			if (deleterows == 0 || tempdata.getTotalProperty() != 0) {
				throw new SQLException("buisexception.deleteFail");
			}
		
		return tempdata;
	}

	/**
	 * Gets the countvalue.
	 * 
	 * @param id
	 *            the id
	 * @param Filters
	 *            the filters
	 * 
	 * @return the countvalue
	 * 
	 * @throws SQLException
	 *             the SQL exception
	 */
	public long getCountvalue(String id, List<Filter> Filters)
			throws SQLException {
		Long result = Long.valueOf(0);
		StatementMap tepstate = this.extendclient.getStatementMap(id);
		String countid = tepstate.getCountStatementid();
		
		IbatisCeteria tempIbatisCeteria = new IbatisCeteria();
		
		tempIbatisCeteria.setCriteria(CriteriaUtil.genCriteriabyFilter(Filters,
				tepstate.getBeanColumnMappings()));
		
		result = (Long) this.queryForObject(countid, tempIbatisCeteria);
		
		return result.longValue();
	}

	/**
	 * Gets the pagequery for list.
	 * 
	 * @param id
	 *            the id
	 * @param Filters
	 *            the filters
	 * @param page
	 *            the page
	 * 
	 * @return the pagequery for list
	 * 
	 * @throws SQLException
	 *             the SQL exception
	 */
	public List getPagequeryForList(String id, List<Filter> Filters, Page page)
			throws SQLException {
		StatementMap tepstate = this.extendclient.getStatementMap(id);
		String groupid = tepstate.getGroupStatementid();

		IbatisCeteria tempIbatisCeteria = new IbatisCeteria();
		tempIbatisCeteria.setCriteria(CriteriaUtil.genCriteriabyFilter(Filters,
				tepstate.getBeanColumnMappings()));
		tempIbatisCeteria.setPager(CriteriaUtil.genPagebyPage(page, tepstate
				.getBeanColumnMappings()));
		tempIbatisCeteria.setSorts(CriteriaUtil.genSorts(page, tepstate
				.getBeanColumnMappings()));
		
		return this.queryForList(groupid, tempIbatisCeteria);

	}

}
