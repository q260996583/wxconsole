/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.entity;

// TODO: Auto-generated Javadoc
/**
 * 操作员.
 */
public class OperatorVo {

	/** ID. */
	private String opr_id;

	/** 登陆名. */
	private String login_nm;

	/** 操作员名字. */
	private String op_name;

	/** 状态. */
	private String status;

	/** 密码. */
	private String password;

	/** 证件类型. */
	private String cert_type_no;

	/** 证件号. */
	private String cert_no;

	/** 电话. */
	private String phone;

	/** 手机. */
	private String mobile;

	/** EMAIL. */
	private String email;

	/** 描述. */
	private String description;

	/** 创建时间. */
	private String create_tm;

	/** 创建的管理员号. */
	private String create_oprid;

	/** 上次修改时间. */
	private String last_mod_tm;

	/** 上次修改用户. */
	private String last_mod_oprid;

	/** 备注. */
	private String misc;

	/** 隶属机构. */
	private String org_code;

	private String org_name;

	/** 最后修改操作员号. */
	private String last_upd_opid;

	/** 最后修改交易名. */
	private String last_upd_transcode;

	/** 最后修改时刻. */
	private String last_upd_tm;

	private String passwd_expire_time;
	
	private String roles;
	/** 保留域1 */
	private String reserved1;
	/** 保留域2 */
	private String reserved2;
	
	private String groupNo;
	
	private String groupNoDesc;

	public String getOpr_id() {
		return opr_id;
	}

	public void setOpr_id(String opr_id) {
		this.opr_id = opr_id;
	}

	public String getLogin_nm() {
		return login_nm;
	}

	public void setLogin_nm(String login_nm) {
		this.login_nm = login_nm;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCert_type_no() {
		return cert_type_no;
	}

	public void setCert_type_no(String cert_type_no) {
		this.cert_type_no = cert_type_no;
	}

	public String getCert_no() {
		return cert_no;
	}

	public void setCert_no(String cert_no) {
		this.cert_no = cert_no;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreate_tm() {
		return create_tm;
	}

	public void setCreate_tm(String create_tm) {
		this.create_tm = create_tm;
	}

	public String getCreate_oprid() {
		return create_oprid;
	}

	public void setCreate_oprid(String create_oprid) {
		this.create_oprid = create_oprid;
	}

	public String getLast_mod_tm() {
		return last_mod_tm;
	}

	public void setLast_mod_tm(String last_mod_tm) {
		this.last_mod_tm = last_mod_tm;
	}

	public String getLast_mod_oprid() {
		return last_mod_oprid;
	}

	public void setLast_mod_oprid(String last_mod_oprid) {
		this.last_mod_oprid = last_mod_oprid;
	}

	public String getMisc() {
		return misc;
	}

	public void setMisc(String misc) {
		this.misc = misc;
	}

	public String getOrg_code() {
		return org_code;
	}

	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getLast_upd_opid() {
		return last_upd_opid;
	}

	public void setLast_upd_opid(String last_upd_opid) {
		this.last_upd_opid = last_upd_opid;
	}

	public String getLast_upd_transcode() {
		return last_upd_transcode;
	}

	public void setLast_upd_transcode(String last_upd_transcode) {
		this.last_upd_transcode = last_upd_transcode;
	}

	public String getLast_upd_tm() {
		return last_upd_tm;
	}

	public void setLast_upd_tm(String last_upd_tm) {
		this.last_upd_tm = last_upd_tm;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getPasswd_expire_time() {
		return passwd_expire_time;
	}

	public void setPasswd_expire_time(String passwd_expire_time) {
		this.passwd_expire_time = passwd_expire_time;
	}

	/**
	 * @return the reserved1
	 */
	public String getReserved1() {
		return reserved1;
	}

	/**
	 * @param reserved1 the reserved1 to set
	 */
	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}

	/**
	 * @return the reserved2
	 */
	public String getReserved2() {
		return reserved2;
	}

	/**
	 * @param reserved2 the reserved2 to set
	 */
	public void setReserved2(String reserved2) {
		this.reserved2 = reserved2;
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
