/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.entity;

// TODO: Auto-generated Javadoc
/**
 * The Class RoleVo.
 */
public class RoleVo {

	/** 角色ID. */
	private String roleId;

	/** 角色名称. */
	private String roleName;

	/** 角色描述. */
	private String role_desc;

	/** 机构代码. */
	private String org_code;

	/** The org_name. */
	private String org_name;

	/** 可用标志. */
	private String flag;

	/** 备注. */
	private String memo;

	/** 创建操作员号. */
	private String create_oprid;

	/** 创建时刻. */
	private String create_tm;

	/** 最后修改操作员号. */
	private String last_upd_oprid;

	/** 最后修改交易名. */
	private String last_upd_transcode;

	/** 最后修改时刻. */
	private String last_upd_tm;

	/** The resources. */
	private String[] resources;
	
	
	private String resourcesStr;
	
	
	private boolean check;
	
	private String groupNo;
	
	private String groupNoDesc;
	

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public String getResourcesStr() {
		return resourcesStr;
	}

	public void setResourcesStr(String resourcesStr) {
		this.resourcesStr = resourcesStr;
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
	 * @param roleId
	 *            the new role id
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**
	 * Gets the role name.
	 * 
	 * @return the role name
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * Sets the role name.
	 * 
	 * @param roleName
	 *            the new role name
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * Gets the role_desc.
	 * 
	 * @return the role_desc
	 */
	public String getRole_desc() {
		return role_desc;
	}

	/**
	 * Sets the role_desc.
	 * 
	 * @param role_desc
	 *            the new role_desc
	 */
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}

	public String getOrg_code() {
		return org_code;
	}

	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}

	/**
	 * Gets the flag.
	 * 
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * Sets the flag.
	 * 
	 * @param flag
	 *            the new flag
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * Gets the memo.
	 * 
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}

	/**
	 * Sets the memo.
	 * 
	 * @param memo
	 *            the new memo
	 */
	public void setMemo(String memo) {
		this.memo = memo;
	}

	/**
	 * Gets the create_oprid.
	 * 
	 * @return the create_oprid
	 */
	public String getCreate_oprid() {
		return create_oprid;
	}

	/**
	 * Sets the create_oprid.
	 * 
	 * @param create_oprid
	 *            the new create_oprid
	 */
	public void setCreate_oprid(String create_oprid) {
		this.create_oprid = create_oprid;
	}

	/**
	 * Gets the create_tm.
	 * 
	 * @return the create_tm
	 */
	public String getCreate_tm() {
		return create_tm;
	}

	/**
	 * Sets the create_tm.
	 * 
	 * @param create_tm
	 *            the new create_tm
	 */
	public void setCreate_tm(String create_tm) {
		this.create_tm = create_tm;
	}

	/**
	 * Gets the last_upd_oprid.
	 * 
	 * @return the last_upd_oprid
	 */
	public String getLast_upd_oprid() {
		return last_upd_oprid;
	}

	/**
	 * Sets the last_upd_oprid.
	 * 
	 * @param last_upd_oprid
	 *            the new last_upd_oprid
	 */
	public void setLast_upd_oprid(String last_upd_oprid) {
		this.last_upd_oprid = last_upd_oprid;
	}

	/**
	 * Gets the last_upd_transcode.
	 * 
	 * @return the last_upd_transcode
	 */
	public String getLast_upd_transcode() {
		return last_upd_transcode;
	}

	/**
	 * Sets the last_upd_transcode.
	 * 
	 * @param last_upd_transcode
	 *            the new last_upd_transcode
	 */
	public void setLast_upd_transcode(String last_upd_transcode) {
		this.last_upd_transcode = last_upd_transcode;
	}

	/**
	 * Gets the last_upd_tm.
	 * 
	 * @return the last_upd_tm
	 */
	public String getLast_upd_tm() {
		return last_upd_tm;
	}

	/**
	 * Sets the last_upd_tm.
	 * 
	 * @param last_upd_tm
	 *            the new last_upd_tm
	 */
	public void setLast_upd_tm(String last_upd_tm) {
		this.last_upd_tm = last_upd_tm;
	}


	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	/**
	 * Gets the resources.
	 * 
	 * @return the resources
	 */
	public String[] getResources() {
		return resources;
	}

	/**
	 * Sets the resources.
	 * 
	 * @param resources
	 *            the new resources
	 */
	public void setResources(String[] resources) {
		this.resources = resources;
	}

	/**
	 * @return the groupNo
	 */
	public String getGroupNo() {
		return groupNo;
	}

	/**
	 * @param groupNo the groupNo to set
	 */
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	/**
	 * @return the groupNoDesc
	 */
	public String getGroupNoDesc() {
		return groupNoDesc;
	}

	/**
	 * @param groupNoDesc the groupNoDesc to set
	 */
	public void setGroupNoDesc(String groupNoDesc) {
		this.groupNoDesc = groupNoDesc;
	}

}
