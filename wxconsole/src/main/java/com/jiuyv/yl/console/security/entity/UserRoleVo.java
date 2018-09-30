package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;



/**
 * 用户和角色关联的VO
 */
public class UserRoleVo implements Serializable{
	private static final long serialVersionUID = 1L;


	private String userId;
	
	
	private String userName;
	
	
	private String roleId;
	
	
	private String roleName;
	
	
	/**
	 * Gets the user id.
	 * 
	 * @return the user id
	 */
	public String getUserId() {
		return userId;
	}
	
	/**
	 * Sets the user id.
	 * 
	 * @param userId the new user id
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	/**
	 * Gets the role id.
	 * 
	 * @return the role id
	 */
	public String getRoleId() {
		return roleId;
	}
	
	/**
	 * Sets the role id.
	 * 
	 * @param roleId the new role id
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
