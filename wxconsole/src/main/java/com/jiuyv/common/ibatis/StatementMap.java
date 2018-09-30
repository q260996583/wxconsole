package com.jiuyv.common.ibatis;

import java.util.HashMap;
import java.util.Iterator;


/**
 * The Class StatementMap.
 * 每个ibatis的statement对应的count的id，分页的id，vo属性和数据库列名的映射关系
 */
public class StatementMap {

	
	/** The Statementid.ibaits的statement的id */
	private String Statementid = null;
	
	/** The group statementid. 对应的分页的statement的id*/
	private String groupStatementid = null;
	
	/** The Count statementid.  对应的计数的statement的id*/
	private String CountStatementid = null;
	
	/** The Bean column mappings. 对应的 vo属性-列名的映射关系*/
	private HashMap<String, BeanColumnMap> beanColumnMappings = new HashMap<String, BeanColumnMap>();
	
	/** The colunmbeans.  列名-属性名的映射*/
	private HashMap<String, String> colunmbeans = new HashMap<String, String>();

	
	public HashMap<String, BeanColumnMap> getBeanColumnMappings() {
		return beanColumnMappings;
	}

	/**
	 * Gets the statementid.
	 * 
	 * @return the statementid
	 */
	public final String getStatementid() {
		return Statementid;
	}

	/**
	 * Sets the statementid.
	 * 
	 * @param statementid the statementid to set
	 */
	public final void setStatementid(String statementid) {
		Statementid = statementid;
	}

	/**
	 * Adds the bean column mapping.
	 * 
	 * @param beanColumnMap the bean column map
	 * 
	 * @return the beanColumnMappings
	 */

	public final void addBeanColumnMapping(BeanColumnMap beanColumnMap) {
		this.beanColumnMappings.put(beanColumnMap.getBeanPropertyName()
				.toLowerCase(), beanColumnMap);
		this.colunmbeans.put(beanColumnMap.getColumnName().toLowerCase(),
				beanColumnMap.getBeanPropertyName().toLowerCase());
	}

	/**
	 * Gets the column nameby proerty name.
	 * 
	 * @param Proertyname the proertyname
	 * 
	 * @return the column nameby proerty name
	 */
	public final String getColumnNamebyProertyName(String Proertyname) {
		return this.beanColumnMappings.get(Proertyname).getColumnName();
	}

	/**
	 * Replacecolumname.
	 * 替换原有的数据库列名为新列名
	 * @param orgin_columname 老列名
	 * @param new_columname 新列名
	 */
	public final void replacecolumname(String orgin_columname,
			String new_columname) {
		String orgin_columnamex = orgin_columname.trim().toLowerCase();
		String new_columnamex = new_columname.trim().toLowerCase();
		if(this.colunmbeans.containsKey(orgin_columnamex)){
				
		String proertyname =this.colunmbeans.get(orgin_columnamex);
		this.colunmbeans.remove(orgin_columnamex);
		this.colunmbeans.put(new_columnamex, proertyname);
		BeanColumnMap beanColumnMap = this.beanColumnMappings.get(proertyname);
		beanColumnMap.setColumnName(new_columnamex);
		beanColumnMap.setMapped(true);
		}
	}

	/**
	 * Replacecolumnamebyallflag.
	 * 对所有没有映射过的关系统一加上 *前面的前缀,如 a.*的话,则对所有没有映射过的统一加上 a.
	 * @param preallflag the preallflag
	 */
	public final void replacecolumnamebyallflag(String preallflag) {
		String preallflagx = preallflag.toLowerCase();

		for (Iterator it = this.beanColumnMappings.values().iterator(); it
				.hasNext();) {

			BeanColumnMap value = (BeanColumnMap) it.next();
			if (value.isMapped() == false) {
				value.setColumnName(preallflagx + value.getColumnName());
				value.setMapped(true);

			}
		}
	}

	/**
	 * Gets the group statementid.
	 * 
	 * @return the groupStatementid
	 */
	public final String getGroupStatementid() {
		return groupStatementid;
	}

	/**
	 * Sets the group statementid.
	 * 
	 * @param groupStatementid the groupStatementid to set
	 */
	public final void setGroupStatementid(String groupStatementid) {
		this.groupStatementid = groupStatementid;
	}

	/**
	 * Gets the count statementid.
	 * 
	 * @return the countStatementid
	 */
	public final String getCountStatementid() {
		return CountStatementid;
	}

	/**
	 * Sets the count statementid.
	 * 
	 * @param countStatementid the countStatementid to set
	 */
	public final void setCountStatementid(String countStatementid) {
		CountStatementid = countStatementid;
	}
}
