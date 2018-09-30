package com.jiuyv.yl.console.consoleoper.service.inter;

import java.util.List;

import com.jiuyv.yl.console.consoleoper.entity.OperatorLogVo;
import com.jiuyv.yl.console.consoleoper.entity.OperatorVo;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.entity.TblConsoleOprLogVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.yl.console.security.entity.User;

public interface IConsoleOperService {
	
	void doInsertOper(OperatorVo vo) throws Exception;

	void delOper(OperatorVo vo) throws Exception;

	OperatorVo findOper(OperatorVo vo) throws Exception;

	ExtData<OperatorVo> findPageOper(List<Filter> filters, Page page)
			throws Exception;

	void doUpdateOper(OperatorVo vo) throws Exception;
	void doUpdateOperPwd(OperatorVo vo) throws Exception;
	
	
    ExtData<TblConsoleOprLogVo> findOperLogs(List<Filter> Filters,Page page) throws Exception;
	String findOperLog(OperatorVo vo) throws Exception;

	ExtData<OperatorLogVo> findPageOperLog(List<Filter> filters,
			Page page) throws Exception;

	void doUpdateRoles(OperatorVo vo) throws Exception;

	List<RoleVo> findRoles(OperatorVo vo) throws Exception;

	List<RoleVo> findHadRoles(OperatorVo vo) throws Exception;
	
	ExtData<RoleVo> loadUserWithRole(String userId) throws Exception;
	
	//获取用户手机号  wxb
	String getPhoneNoByLogNm(String login_nm) throws Exception;

	/**
	 * 修改登录用户信息
	 * @param userInfo
	 * @param convertJsonToBean
	 * @return
	 */
	ExtData<OperatorVo> doUpdateOperInfo(User userInfo,
			OperatorVo operVo) throws BaseException;
	
}
