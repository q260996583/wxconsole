package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;

// TODO: Auto-generated Javadoc
/**
 * The Class RoleVo.
 */
public class RoleVo implements Serializable{

	private static final long serialVersionUID = 1L;
	private String roleDesc;

	private String flag;
	private String memo;
	private String creatOprid;
	private String creatTime;


	
	//角色ID. 

	private String roleid;
	
	// 角色名称. 

	private String rolename;
	
	//
	
	private String orgCode;
	
	//. 

	private String orgName;
	
	/** 角色对应的资源. */
	private String resource;
	
	/** 是否选择 */
	private boolean checked = false;
	//修改人
	private String luOprid;
	//操作码
	private String luTranscode;
	//更新时间
	private String updateTime;
	
	/**
	 * Gets the resource.
	 * 
	 * @return the resource
	 */
	public String getResource() {
		return resource;
	}

	/**
	 * Sets the resource.
	 * 
	 * @param resource the new resource
	 */
	public void setResource(String resource) {
		this.resource = resource;
	}

	
	

	
	
	
	/**
	 * Checks if is checked.
	 * 
	 * @return true, if is checked
	 */
	public boolean isChecked() {
		return checked;
	}

	/**
	 * Sets the checked.
	 * 
	 * @param checked the new checked
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getLuOprid() {
		return luOprid;
	}

	public void setLuOprid(String luOprid) {
		this.luOprid = luOprid;
	}

	public String getLuTranscode() {
		return luTranscode;
	}

	public void setLuTranscode(String luTranscode) {
		this.luTranscode = luTranscode;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCreatOprid() {
		return creatOprid;
	}

	public void setCreatOprid(String creatOprid) {
		this.creatOprid = creatOprid;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
}

