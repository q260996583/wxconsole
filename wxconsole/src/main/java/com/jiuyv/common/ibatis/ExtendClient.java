/**
 * 
 */
package com.jiuyv.common.ibatis;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.SqlMapClientImpl;
import com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import com.ibatis.sqlmap.engine.mapping.result.ResultMap;
import com.ibatis.sqlmap.engine.mapping.result.ResultMapping;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibatis.sqlmap.engine.mapping.sql.SqlChild;
import com.ibatis.sqlmap.engine.mapping.sql.SqlText;
import com.ibatis.sqlmap.engine.mapping.sql.dynamic.DynamicSql;
import com.ibatis.sqlmap.engine.mapping.sql.stat.StaticSql;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.mapping.statement.StatementType;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.IbatisCeteria;
import com.jiuyv.common.ibatis.vo.Page;

/**
 * @author Administrator
 * 
 */
public class ExtendClient {
	
	private static Logger LOGGER = LoggerFactory.getLogger(ExtendClient.class);
	
	private SqlMapClientImpl SqlClient = null;
	private String selectcountmapmentid = null;
	private String selectgroupmapmentid = null;
	private boolean inited = false;
	private HashMap<String, StatementMap> statementmaps = new HashMap<String, StatementMap>();
	private final static String sqlstartdefine = "select ";
	private final static String sqlmiddefine = " from ";
	private final static String sqlDynclassname = "com.ibatis.sqlmap.engine.mapping.sql.dynamic.DynamicSql";
	private final static String sqlClassChildren = "children";
	private final static String sqlClassstatment = "sqlStatement";
	private final static String sqlclassname = "com.ibatis.sqlmap.engine.mapping.sql.stat.StaticSql";
	private final static String sqlCounthead = "select count(1) ";
	private List groupchildrenmodel = new ArrayList();
	private static MappedStatement countMappedStatement = null;
	private List countchildrenmodel = new ArrayList();

	public ExtendClient() {
	};

	public ExtendClient(SqlMapClient SqlClient, String Selectcountmapmentid,
			String Selectgroupmapment) throws Exception {
		setClient(SqlClient);
		setSelectcountmapmentid(Selectcountmapmentid);
		setSelectgroupmapmentid(Selectgroupmapment);
		initMapments();
	};

	public void setClient(SqlMapClient SqlClient) throws Exception {

		this.SqlClient = (SqlMapClientImpl) SqlClient;
		initMapments();
	};

	/*public void setCountmapmentid(String Selectcountmapmentid) throws Exception {

		this.selectcountmapmentid = Selectcountmapmentid;
		initMapments();
	};

	public void setGroupmapmentid(String Selectgroupmapmentid) throws Exception {

		this.selectgroupmapmentid = Selectgroupmapmentid;
		initMapments();
	};*/

	/**
	 * Inits the mapments.
	 * 
	 * @throws Exception
	 *             the exception
	 */
	public void initMapments() throws Exception {
		if (this.inited == true || SqlClient == null
				|| selectcountmapmentid == null || selectgroupmapmentid == null) {
			return;
		}
		this.inited = true;

		// 得到sqlmap的delegate
		SqlMapExecutorDelegate tempDelegate = this.SqlClient.getDelegate();

		// 初始化 count children group children
		initchildrenmodle(tempDelegate);
		// delegate mapstatement
		HashMap<String, String> MappedStatementNameMap = new HashMap<String, String>();
		Iterator<String> MappedStatementNames = tempDelegate.getMappedStatementNames();
		while (MappedStatementNames.hasNext()) {
			String tempMappedStatementName = MappedStatementNames.next();
			MappedStatementNameMap.put(tempMappedStatementName,
					tempMappedStatementName);
		}

		// Get an iterator
		Iterator itr = MappedStatementNameMap.keySet().iterator();

		while (itr.hasNext()) {
			String mappedstatementname = (String) itr.next();
			// seleccount group 
			if (!selectcountmapmentid.toLowerCase().equals(
					mappedstatementname.toLowerCase())
					&& !selectgroupmapmentid.toLowerCase().equals(
							mappedstatementname.toLowerCase())) {

				MappedStatement tempstatement = tempDelegate
						.getMappedStatement(mappedstatementname);
				// ibatis
				getibatismap(tempstatement);
			}

		}
	}

	public long getCountvalue(String id, List<Filter> Filters)
			throws SQLException {
		Long result = Long.valueOf(0);
		StatementMap tepstate = this.statementmaps.get(id);
		String countid = tepstate.getCountStatementid();

		IbatisCeteria tempIbatisCeteria = new IbatisCeteria();
		tempIbatisCeteria.setCriteria(CriteriaUtil.genCriteriabyFilter(Filters,
				tepstate.getBeanColumnMappings()));
		result = (Long) this.SqlClient.queryForObject(countid,
				tempIbatisCeteria);

		return result.longValue();
	}

	public List getPagequeryForList(String id, List<Filter> Filters, Page page)
			throws SQLException {
		StatementMap tepstate = this.statementmaps.get(id);
		String groupid = tepstate.getGroupStatementid();

		IbatisCeteria tempIbatisCeteria = new IbatisCeteria();
		tempIbatisCeteria.setCriteria(CriteriaUtil.genCriteriabyFilter(Filters,
				tepstate.getBeanColumnMappings()));
		tempIbatisCeteria.setPager(CriteriaUtil.genPagebyPage(page, tepstate
				.getBeanColumnMappings()));
		tempIbatisCeteria.setSorts(CriteriaUtil.genSorts(page, tepstate
				.getBeanColumnMappings()));
		return this.SqlClient.queryForList(groupid, tempIbatisCeteria);

	}

	public ExtData getPagequery(String id, List<Filter> Filters, Page page)
			throws SQLException {
		ExtData result = new ExtData();
		result.setSuccess(false);
		result.setTotalProperty(getCountvalue(id, Filters));
		result.setRoot(getPagequeryForList(id, Filters, page));
		result.setSuccess(true);
		return result;

	}

	private void initchildrenmodle(SqlMapExecutorDelegate tempDelegate)
			throws Exception {
		// count children
		MappedStatement tempcountstatement = tempDelegate
				.getMappedStatement(this.selectcountmapmentid);
		Sql tempSql = null;
		tempSql = tempcountstatement.getSql();
		Field field = null;
		field = Class.forName(sqlDynclassname).getDeclaredField(
				sqlClassChildren);
		field.setAccessible(true);
		List sqlchildrenlist = (List) field.get(tempSql);
		for (int i = 0; i < sqlchildrenlist.size();) {
			if ((sqlchildrenlist.get(i) instanceof SqlText)) {
				SqlText t1 = (SqlText) sqlchildrenlist.get(i);
				if (t1.isWhiteSpace()) {
					sqlchildrenlist.remove(i);
					i--;
				}
			}
			i++;
		}
		if (!(sqlchildrenlist.get(0) instanceof SqlText)) {
			throw new IllegalStateException();
		}
		this.countchildrenmodel = sqlchildrenlist;
		this.countMappedStatement = tempcountstatement;
		// group children 
		MappedStatement tempgroupstatement = tempDelegate
				.getMappedStatement(this.selectgroupmapmentid);
		tempSql = tempgroupstatement.getSql();

		field = Class.forName(sqlDynclassname).getDeclaredField(
				sqlClassChildren);
		field.setAccessible(true);
		List sqlchildrenlist2 = (List) field.get(tempSql);
		for (int i = 0; i < sqlchildrenlist2.size();) {
			if ((sqlchildrenlist2.get(i) instanceof SqlText)) {
				SqlText t1 = (SqlText) sqlchildrenlist2.get(i);
				if (t1.isWhiteSpace()) {
					sqlchildrenlist2.remove(i);
					i--;
				}
			}
			i++;
		}
		if (!(sqlchildrenlist2.get(1) instanceof SqlText)) {
			throw new IllegalStateException();
		}

		this.groupchildrenmodel = sqlchildrenlist2;
	}

	private void getibatismap(MappedStatement tempstatement) throws Exception {
		LOGGER.info(tempstatement.getId() + " getibatismap start");
		// select mapmement<T>class certiera
		StatementType type = tempstatement.getStatementType();

		if (!(type.equals(StatementType.SELECT) || type
				.equals(StatementType.UNKNOWN))) {
			return;
		}

		ResultMap tempresulmap = tempstatement.getResultMap();
		Class tempResultClass = tempresulmap.getResultClass();
		Class tempParameterClass = tempstatement.getParameterClass();
		// resultclass select statement
		if (tempResultClass != null
				&& tempParameterClass != null
				&& (tempParameterClass.getName().equals(IbatisCeteria.class
						.getName()))) {
			StatementMap tempStatementMap = new StatementMap();

			ResultMapping[] tempResultMappings = tempresulmap
					.getResultMappings();
			if (tempResultMappings == null) {
				// automap class
				PropertyDescriptor[] tempPropertys = null;
				tempPropertys = PropertyUtils
						.getPropertyDescriptors(tempResultClass);
				for (PropertyDescriptor tempProperty : tempPropertys) {
					if (tempProperty.getWriteMethod() != null) {
						BeanColumnMap tempBeanColumnMap = new BeanColumnMap();
						tempBeanColumnMap.setBeanPropertyName(tempProperty
								.getName());
						tempBeanColumnMap.setColumnName(tempProperty.getName());
						tempBeanColumnMap.setPropertytype(tempProperty
								.getPropertyType().getName().toLowerCase());
						tempStatementMap
								.addBeanColumnMapping(tempBeanColumnMap);

					}

				}

			} else {
				// resulmap BeanColumnMap
				for (ResultMapping tempResultMapp : tempResultMappings) {
					BeanColumnMap tempBeanColumnMap = new BeanColumnMap();
					tempBeanColumnMap.setBeanPropertyName(tempResultMapp
							.getPropertyName());
					tempBeanColumnMap.setColumnName(tempResultMapp
							.getColumnName());
					tempStatementMap.addBeanColumnMapping(tempBeanColumnMap);
					tempBeanColumnMap.setPropertytype(tempResultMapp
							.getJavaType().getName().toLowerCase());
				}
			}
			getSqlmap(tempstatement, tempStatementMap);
			LOGGER.info(tempstatement.getId() + " getibatismap finished");
			statementmaps.put(tempstatement.getId(), tempStatementMap);
		}

	}

	private void modifySqlText(Sql sql, int index, String sqltext)
			throws Exception {
		SqlText sqltemptext = new SqlText();
		sqltemptext.setPostParseRequired(false);
		sqltemptext.setText(sqltext);

		Field field = null;
		field = Class.forName(sqlDynclassname).getDeclaredField(
				sqlClassChildren);
		field.setAccessible(true);
		List sqlchildrenlist = (List) field.get(sql);
		sqlchildrenlist.set(index, sqltext);

	}

	private void getSqlmap(MappedStatement tempstatement,
			StatementMap distStatementMap) throws Exception {
		String tempsqltail = null;
		String tempsqlHead = null;
		StringBuffer tempsqls = new StringBuffer();

		Sql tempSql = tempstatement.getSql();
		if (!(tempSql instanceof StaticSql)) {
			return;
		}
		String sqlStement = tempSql.getSql(null, null);
		String sqlStementorginal = sqlStement.trim();
		String sqlStementtailString = null;
		tempsqls.append(sqlStement.trim().toLowerCase());
		// select from
		if (tempsqls != null) {
			int istart = tempsqls.indexOf(this.sqlstartdefine);
			int iend = tempsqls.indexOf(this.sqlmiddefine);
			tempsqlHead = tempsqls.substring(istart
					+ this.sqlstartdefine.length(), iend);
			//tempsqltail = tempsqls.substring(iend);
			sqlStementtailString = sqlStementorginal.substring(iend);
			// 需要重新考 function(,) as 的情况
			String[] columnstemp = tempsqlHead.split(",");
			ArrayList<String> columns = new ArrayList<String>();
			// 先对colunms 进行查找是否有( ) ,将 ( )拼凑成一个String
			int tempcount = columnstemp.length;
			int tempindex = 0;
			int columsindex = 0;
			StringBuffer tempbuilder = new StringBuffer();
			int foundbrackets = 0;
			while (tempindex < tempcount) {
				String coulmntemp = columnstemp[tempindex];

				String[] bracketspos = coulmntemp.split("\\(");

				String[] backbracketspos = coulmntemp.split("\\)");

				if (bracketspos.length > 1) {
					foundbrackets = foundbrackets + bracketspos.length - 1;
				}
				if (backbracketspos.length > 1) {
					foundbrackets = foundbrackets - backbracketspos.length - 1;
				}
				if (foundbrackets == 0) {
					tempbuilder.append(coulmntemp);
					columns.add(tempbuilder.toString());
					tempbuilder = new StringBuffer();

				} else {
					tempbuilder.append(tempbuilder);
				}
				tempindex = tempindex + 1;

			}

			int hasallflag = 0;
			String hasallflagString = null;
			for (String colmn : columns) {
				colmn = colmn.trim();
				int asflagpos = colmn.indexOf(" as ");
				int allflag = colmn.indexOf("*");
				int ipoint = colmn.indexOf(".");

				if (asflagpos == -1 && allflag == -1 && ipoint > -1) {
					distStatementMap.replacecolumname(colmn
							.substring(ipoint + 1), colmn);
				}
				if (asflagpos == -1 && allflag == -1 && ipoint == -1) {
					distStatementMap.replacecolumname(colmn, colmn);
				}
				if (asflagpos > -1) {
					distStatementMap.replacecolumname(colmn
							.substring(asflagpos + 4), colmn.substring(0,
							asflagpos));
				}
				if (allflag > -1) {
					hasallflag = hasallflag + 1;
					if (allflag > 0) {
						hasallflagString = colmn.substring(0, allflag);
					} else {
						hasallflagString = "";
					}
				}
			}

			if (hasallflag == 1) {
				distStatementMap.replacecolumnamebyallflag(hasallflagString);

			}
			if (hasallflag > 1) {
				// sql
				throw new IllegalStateException();
			}
		}

		// 添加count和分页的statment
		Random ran = new Random();
		MappedStatement countMappedStatement = (MappedStatement) BeanUtils
				.cloneBean(this.countMappedStatement);
		DynamicSql countsql = new DynamicSql(this.SqlClient.getDelegate());
		for (int i = 0; i < this.countchildrenmodel.size(); i++) {
			if (i == 0) {
				SqlText sqltemptext = new SqlText();
				sqltemptext.setPostParseRequired(false);
				sqltemptext.setText(this.sqlCounthead + sqlStementtailString);
				countsql.addChild(sqltemptext);
			} else {
				countsql.addChild((SqlChild) this.countchildrenmodel.get(i));
			}
		}
		distStatementMap.setCountStatementid(tempstatement.getId() + "_count"
				+ String.valueOf(ran.nextInt(100)));
		countMappedStatement.setId(distStatementMap.getCountStatementid());
		countMappedStatement.setSql(countsql);
		MappedStatement groupMappedStatement = (MappedStatement) BeanUtils
				.cloneBean(tempstatement);
		DynamicSql temsql = new DynamicSql(this.SqlClient.getDelegate());
		for (int i = 0; i < this.groupchildrenmodel.size(); i++) {
			if (i == 1) {
				SqlText sqltemptext = new SqlText();
				sqltemptext.setPostParseRequired(false);
				sqltemptext.setText(sqlStementorginal);
				temsql.addChild(sqltemptext);
			} else {
				temsql.addChild((SqlChild) this.groupchildrenmodel.get(i));
			}
		}
		//
		groupMappedStatement.setSql(temsql);
		distStatementMap.setGroupStatementid(tempstatement.getId() + "_group"
				+ String.valueOf(ran.nextInt(100)));
		groupMappedStatement.setId(distStatementMap.getGroupStatementid());
		this.SqlClient.getDelegate().addMappedStatement(countMappedStatement);
		this.SqlClient.getDelegate().addMappedStatement(groupMappedStatement);

	}

	public StatementMap getStatementMap(String id) {
		return this.statementmaps.get(id);
	}

	public SqlMapClientImpl getSqlClient() {
		return SqlClient;
	}

	/**
	 * @param selectcountmapmentid the selectcountmapmentid to set
	 */
	public void setSelectcountmapmentid(String selectcountmapmentid) {
		this.selectcountmapmentid = selectcountmapmentid;
		try {
			initMapments();
		} catch (Exception e) {
			LOGGER.error("init map failed ", e);
			
		}
	}

	/**
	 * @param selectgroupmapmentid the selectgroupmapmentid to set
	 */
	public void setSelectgroupmapmentid(String selectgroupmapmentid) {
		this.selectgroupmapmentid = selectgroupmapmentid;
		try {
			initMapments();
		} catch (Exception e) {
			LOGGER.error("init map failed ", e);
		}
	}

}
