package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;
import java.util.List;



// TODO: Auto-generated Javadoc
/**
 * The Class User.
 */
public class UserInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	protected String userID;
	
	/** 用户类型. 00-管理员 01-操作员*/

	protected String user_type;
	
	/** 用户的登陆密码. */
	protected String passwd;
	

	protected String orgCode;

	/** 机构下属机构代码数组. */
	protected List<String> childorgcodes;
	/** The org name. */
	protected String orgName;

	/** 用户名. */
	protected String name;
	
	/** 身份证号 */
	protected String card_id;
	
	/** 所在城市 */
	protected String city;
	
	/** 所在省份. */
	protected String province;
	
	/** 角色信息. */
	private String roles;
	
	/** 邮编. */ 
	
	private String zip;
	
	/** 联系地址. */ 
	
	private String contact_add;
	
	/**电话. */ 
	
	private String phone;
	
	/** 用户描述. */ 
	
	private String user_desc;
	
	/** email. */ 
	
	private String email;
	
	/** 显示名称. */ 
	
	private String disp_name;
	
	/** 注册时间. */ 
	
	private String creat_time;
	
	/** 删除标识. */ 
	
	private String del_flag;
	
	/** 备注. */ 
	
	private String memo;
	
	/** 生成方记录. */ 
	
	private String auth_id;
	
	/** 最后修改操作员号. */ 
	
	private String opt_id;
	
	/** 最后修改交易名. */ 
	
	private String trans_code;
	
	/** 上次更新时间. */ 
	
	private String lupdate_time;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public List<String> getChildorgcodes() {
		return childorgcodes;
	}

	public void setChildorgcodes(List<String> childorgcodes) {
		this.childorgcodes = childorgcodes;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard_id() {
		return card_id;
	}

	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getContact_add() {
		return contact_add;
	}

	public void setContact_add(String contact_add) {
		this.contact_add = contact_add;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUser_desc() {
		return user_desc;
	}

	public void setUser_desc(String user_desc) {
		this.user_desc = user_desc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDisp_name() {
		return disp_name;
	}

	public void setDisp_name(String disp_name) {
		this.disp_name = disp_name;
	}

	public String getCreat_time() {
		return creat_time;
	}

	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getOpt_id() {
		return opt_id;
	}

	public void setOpt_id(String opt_id) {
		this.opt_id = opt_id;
	}

	public String getTrans_code() {
		return trans_code;
	}

	public void setTrans_code(String trans_code) {
		this.trans_code = trans_code;
	}

	public String getLupdate_time() {
		return lupdate_time;
	}

	public void setLupdate_time(String lupdate_time) {
		this.lupdate_time = lupdate_time;
	}
	
}