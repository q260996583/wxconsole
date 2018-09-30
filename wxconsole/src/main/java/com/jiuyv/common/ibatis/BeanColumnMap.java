
package com.jiuyv.common.ibatis;


// TODO: Auto-generated Javadoc
/**
 * The Class BeanColumnMap.
 * 用来对存放vo的属性与数据库字段的映射关系
 * @author Charley
 */
public class BeanColumnMap {
	
	/** The Bean property name. bean的属性名*/
	private String BeanPropertyName = null;
	
	/** The Column name. 数据库字段名*/
	private String ColumnName = null;
	
	/** The mapped. 是否已经映射过*/
	private boolean mapped = false;

	/** bean属性的类型，可以供filter使用*/
	private String propertytype=null;

	public String getPropertytype() {
		return propertytype;
	}

	public void setPropertytype(String propertytype) {
		this.propertytype = propertytype;
	}

	/**
	 * Gets the bean property name.
	 * 
	 * @return the beanPropertyName
	 */
	public String getBeanPropertyName() {
		if (BeanPropertyName != null){
			BeanPropertyName=ColumnName.trim();
		}
		return BeanPropertyName;
	}

	/**
	 * Sets the bean property name.
	 * 
	 * @param beanPropertyName the beanPropertyName to set
	 */
	public void setBeanPropertyName(String beanPropertyName) {
		BeanPropertyName = beanPropertyName;
	}

	/**
	 * Gets the column name.
	 * 
	 * @return the columnName
	 */
	public String getColumnName() {
		if (ColumnName != null){
			ColumnName=ColumnName.trim();
		}
		return ColumnName;
	}

	/**
	 * Sets the column name.
	 * 
	 * @param columnName the columnName to set
	 */
	public void setColumnName(String columnName) {
		ColumnName = columnName;
	}

	/**
	 * Checks if is mapped.
	 * 
	 * @return the mapped
	 */
	public boolean isMapped() {
		return mapped;
	}

	/**
	 * Sets the mapped.
	 * 
	 * @param mapped the mapped to set
	 */
	public void setMapped(boolean mapped) {
		this.mapped = mapped;
	}

}
