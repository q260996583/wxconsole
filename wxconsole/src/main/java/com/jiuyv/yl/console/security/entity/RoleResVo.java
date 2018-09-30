package com.jiuyv.yl.console.security.entity;



/**
 * 角色和资源关系VO
 */
public class RoleResVo {
	
	/** 角色ID */
	
	private String roleId;
	
	/** 资源ID. */
	private String resourceID;
	
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
	
	/**
	 * Gets the resource id.
	 * 
	 * @return the resource id
	 */
	public String getResourceID() {
		return resourceID;
	}
	
	/**
	 * Sets the resource id.
	 * 
	 * @param resourceID the new resource id
	 */
	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
	}
}
