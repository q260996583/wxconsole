package com.jiuyv.yl.console.security.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.security.BadCredentialsException;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.userdetails.UserDetails;
import org.springframework.security.userdetails.UserDetailsService;
import org.springframework.security.userdetails.UsernameNotFoundException;

import com.jiuyv.yl.console.orgmngr.util.AES;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.common.lang.date.DateUtils;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.yl.console.security.entity.Authority;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;
import com.jiuyv.yl.console.security.util.OrgTreeUtil;

public class SelfSecurityManager implements UserDetailsService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SelfSecurityManager.class);
	
	private SqlMapClient sqlmapclient=null;
	private String loaduserstatementid=null;
	private String loaduserresouceid=null;
	private OrgTreeUtil orgtreeutil=null;
	private String loaduserorgtype=null;
	private String filterOrdId=null;
	
	private String loginfalseTime="springsecurity.loginfalseTime";
	private String updateUser="springsecurity.updateUser";
	
	public String getFilterOrdId() {
		return filterOrdId;
	}

	public void setFilterOrdId(String filterOrdId) {
		this.filterOrdId = filterOrdId;
	}

	public String getLoaduserorgtype() {
		return loaduserorgtype;
	}

	public void setLoaduserorgtype(String loaduserorgtype) {
		this.loaduserorgtype = loaduserorgtype;
	}

	public OrgTreeUtil getOrgtreeutil() {
		return orgtreeutil;
	}

	public void setOrgtreeutil(OrgTreeUtil orgtreeutil) {
		this.orgtreeutil = orgtreeutil;
	}

	public String getLoaduserresouceid() {
		return loaduserresouceid;
	}

	public void setLoaduserresouceid(String loaduserresouceid) {
		this.loaduserresouceid = loaduserresouceid;
	}

	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException, DataAccessException {
	if (userName == null || "".equals(userName.trim())) {
			throw new BadCredentialsException("用户名不能为空");
		}
		if ( userName.getBytes().length > 50 ) {
			throw new UsernameNotFoundException("用户名过长");
		}
	
		List<SecurityUserDetail> users = null;

		//首先找到符合登陆id的用户的资料，密码判断是由spring security 通过读出user内加密过的密码自行比较的，无需再写代码判断
		try {
			users = sqlmapclient.queryForList(loaduserstatementid,userName);
		
		} catch (SQLException e) {
			throw  new DataAccessResourceFailureException("database.error");
		}

        if (users.size() > 1 ) {
            throw new IncorrectResultSizeDataAccessException("More than one user found with name '" + userName + "'", 1);
        }
        if (users.size()==0){
            throw new UsernameNotFoundException("no user found with name '" + userName + "'", 1);
        }
        
        

		// 判断时间，如果最后登陆时间距离本次登陆超过半个小时，就将错误次数清0
        if (users.size() == 1) {
			SecurityUserDetail userDetail = users.get(0);
			if (userDetail.getLastUpdTm() == null
				|| userDetail.getLastUpdTm().length() != 14) {
			    // 第一次没有最后登陆时间，不做处理
			} else {
			    // 最后登陆时间
			    Date lastLoginTime = DateUtil.formateStringToDate(
				    userDetail.getLastUpdTm(), "yyyyMMddHHmmss");
			    lastLoginTime = DateUtil.add(lastLoginTime, "minute", 30);
			    // 增加30分钟之后的时间
			    String time = DateUtil.formDateToString(lastLoginTime,
				    "yyyyMMddHHmmss");
			    // 系统时间
			    String sysTime = DateUtil.getDateyyyyMMddHHmmss();
	
			    int i = sysTime.compareTo(time);
			    if (i >= 0) {
				// 超过30分钟
				userDetail.setFalseTime(0);
				userDetail.setLastUpdTm(sysTime);
				try {
				    sqlmapclient.update(updateUser, userDetail);
				} catch (SQLException e) {
				    LOGGER.error("", e);
				}
	
			    } else {
				// 没有超过30分钟
				Integer maxLoginTime = 5;
				/*try {
				    maxLoginTime = (Integer) sqlmapclient
				    	.queryForObject(loginfalseTime);
				} catch (SQLException e) {
				    // TODO Auto-generated catch block
				    LOGGER.error("", e);
				}*/
				if (userDetail.getFalseTime() >= maxLoginTime) {
				    throw new BadCredentialsException(
					    "登陆次数超限， 半小时之后才能再次登录本系统");
				}
			    }
			}
	}
        
        
		//得到用户可以访问的资源列表，供安全的http url过滤使用
        List<Resource> resources=null;
        try {
			resources=sqlmapclient.queryForList(loaduserresouceid,userName);
			if(resources==null||resources.size()==0){
				throw  new BadCredentialsException("该用户没有任何权限 无法登陆系统");
			}
		} catch (SQLException e) {
			throw  new DataAccessResourceFailureException("database.error");
		}
	   List<GrantedAuthority> sorter = new ArrayList<GrantedAuthority>();
        for (int i = 0; i < resources.size(); i++) {
        	String roleid=resources.get(i).getResourceID();
        	GrantedAuthority authority=new  Authority(roleid);
            sorter.add(authority);
        }
        SecurityUserDetail user = users.get(0);
       //如果自行设置加密算法（除了spring security的md5 ，md4等），则需在这里要将user的密码域解密，供spring security验证
        user.setPassword(AES.decrypt(user.getPassword()));
        //得到用户的机构及其后代的机构列表
		user.setChildOrgCodes(orgtreeutil.findsuborglist(user.getOrgCode()));
		user.setAuthorities((GrantedAuthority[]) sorter.toArray(new GrantedAuthority[sorter.size()]));
		return user;
	}
	
	public SqlMapClient getSqlmapclient() {
		return sqlmapclient;
	}

	public void setSqlmapclient(SqlMapClient sqlmapclient) {
		this.sqlmapclient = sqlmapclient;
	}

	public String getLoaduserstatementid() {
		return loaduserstatementid;
	}

	public void setLoaduserstatementid(String loaduserstatementid) {
		this.loaduserstatementid = loaduserstatementid;
	}

	public String getLoginfalseTime() {
		return loginfalseTime;
	}

	public void setLoginfalseTime(String loginfalseTime) {
		this.loginfalseTime = loginfalseTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}



}
