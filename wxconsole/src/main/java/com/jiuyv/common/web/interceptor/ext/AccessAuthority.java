package com.jiuyv.common.web.interceptor.ext;

import java.io.Serializable;

/**
 * 存储在session中的权限访问控制的参数
 * The Class AccessAuthority.
 */
public class AccessAuthority implements Serializable {

	/** The role type. */
	private String roleType ;
	
	/** The org val list. */
	private String orgValList;
	
	/** The account name. */
	private String accountName;

	/**
	 * Gets the role type.
	 * 
	 * @return the role type
	 */
	public String getRoleType() {
		return roleType;
	}

	/**
	 * Sets the role type.
	 * 
	 * @param roleType the new role type
	 */
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	/**
	 * Gets the org val list.
	 * 
	 * @return the org val list
	 */
	public String getOrgValList() {
		return orgValList;
	}

	/**
	 * Sets the org val list.
	 * 
	 * @param orgValList the new org val list
	 */
	public void setOrgValList(String orgValList) {
		this.orgValList = orgValList;
	}

	/**
	 * Gets the account name.
	 * 
	 * @return the account name
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * Sets the account name.
	 * 
	 * @param accountName the new account name
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
}
