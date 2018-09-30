/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.service.impl;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.jiuyv.yl.console.consoleoper.dao.inter.IConsoleOperDao;
import com.jiuyv.yl.console.consoleoper.entity.OperatorLogVo;
import com.jiuyv.yl.console.consoleoper.entity.OperatorVo;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.entity.TblConsoleOprLogVo;
import com.jiuyv.yl.console.consoleoper.service.inter.IConsoleOperService;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.yl.console.security.entity.User;

// TODO: Auto-generated Javadoc
/**
 * The Class ConsoleOperServiceImpl.
 */
public class ConsoleOperServiceImpl implements IConsoleOperService {

	/** The dao. */
	private IConsoleOperDao dao;

	/**
	 * Gets the dao.
	 * 
	 * @return the dao
	 */
	public IConsoleOperDao getDao() {
		return dao;
	}

	/**
	 * Sets the dao.
	 * 
	 * @param dao
	 *            the new dao
	 */
	public void setDao(IConsoleOperDao dao) {
		this.dao = dao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#doInsertOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doInsertOper(OperatorVo vo) throws Exception {
		dao.doInsertOper(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#delOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void delOper(OperatorVo vo) throws Exception {
		dao.delOper(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#findOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public OperatorVo findOper(OperatorVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#doUpdateOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doUpdateOper(OperatorVo vo) throws Exception {
		dao.doUpdateOper(vo);
	}
	
	/**
	 * 修改登录用户信息
	 * @param userInfo
	 * @param convertJsonToBean
	 * @return
	 */
	public ExtData<OperatorVo> doUpdateOperInfo(User userInfo,
			OperatorVo operVo) throws BaseException {
		OperatorVo dbVo = new OperatorVo();
		dbVo.setOpr_id(userInfo.getOprId());
		dbVo.setCert_no(operVo.getCert_no());
		dbVo.setCert_type_no(operVo.getCert_type_no());
		dbVo.setOp_name(operVo.getOp_name());
		dbVo.setPhone(operVo.getPhone());
		dbVo.setEmail(operVo.getEmail());
		dbVo.setDescription(operVo.getDescription());
		dbVo.setMisc(operVo.getMisc());
		dbVo.setReserved1(operVo.getReserved1());
		dbVo.setReserved2(operVo.getReserved2());
		dbVo.setLast_mod_oprid(userInfo.getOprId());
		dbVo.setLast_upd_opid(userInfo.getOprId());
		
		try {
			dao.doUpdateOper(dbVo);
		} catch (SQLException e) {
			throw new BaseException("记录更新出错！", e);
		}
		// copy info into userinfo
		userInfo.setCertNo(dbVo.getCert_no());
		userInfo.setCertTypeNo(dbVo.getCert_type_no());
		userInfo.setOpName(dbVo.getOp_name());
		userInfo.setPhone(dbVo.getPhone());
		userInfo.setEmail(dbVo.getEmail());
		userInfo.setDescription(dbVo.getDescription());
		userInfo.setMisc(dbVo.getMisc());
		userInfo.setReserved1(dbVo.getReserved1());
		userInfo.setReserved2(dbVo.getReserved2());
		return ExtDataUtil.genWithSingleData(dbVo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#findOperLog
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public String findOperLog(OperatorVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.shfft.business.consoleoper.service.inter.IConsoleOperService#
	 * doUpdatePermission(com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doUpdateRoles(OperatorVo vo) throws Exception {
		dao.doUpdateRoles(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.service.inter.IConsoleOperService#findPageOper
	 * (java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	@Override
	public ExtData<OperatorVo> findPageOper(List<Filter> filters, Page page)
			throws Exception {
		return dao.findPageOper(filters, page);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.shfft.business.consoleoper.service.inter.IConsoleOperService#
	 * findPageOperLog(java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	@Override
	public ExtData<OperatorLogVo> findPageOperLog(List<Filter> filters,
			Page page) throws Exception {
		return dao.findPageOperLog(filters, page);
	}

	@Override
	public List<RoleVo> findRoles(OperatorVo vo) throws Exception {
		return dao.findRoles(vo);
	}

	@Override
	public List<RoleVo> findHadRoles(OperatorVo vo) throws Exception {
		return dao.findHadRoles(vo);
	}

	@Override
	public ExtData<RoleVo> loadUserWithRole(String userId) throws Exception {

		List<RoleVo> allRole = dao.findAllRole();
		List<RoleVo> userRoles = dao.findRoleByUserId(userId);
		// 先把data map化，这样可以简化运行复杂度
		HashMap<String, RoleVo> tempdata = new HashMap<String, RoleVo>();
		for (RoleVo m : allRole) {
			tempdata.put(m.getRoleId(), m);
		}

		for (RoleVo m : userRoles) {
			RoleVo temprolevo = tempdata.get(m.getRoleId());
			if (temprolevo != null) {
				temprolevo.setCheck(true);
			}

		}
		ExtData<RoleVo> data=new ExtData<RoleVo>();
		data.setSuccess(true);
		data.setRoot(allRole);
		data.setTotalProperty(allRole.size());		
        return data;
	}


	public ExtData<TblConsoleOprLogVo> findOperLogs(List<Filter> Filters, Page page)
	throws Exception {
// TODO Auto-generated method stub
   return dao.findOperLogs(Filters, page);
}
	

	@Override
	public void doUpdateOperPwd(OperatorVo vo) throws Exception {
	   dao.doUpdateOperPwd(vo);
		
	}
	
	/**
	 * 获取商户手机号.
	 *@author wxb
	 * @return the 
	 * @throws Exception the exception
	 */
	public String getPhoneNoByLogNm(String login_nm) throws Exception {
		OperatorVo vo=new OperatorVo();
		vo =dao.getPhoneNoByLogNm(login_nm);
		String phoneNo=vo.getPhone();
		if(phoneNo!=null){
			return phoneNo;
		}
		return null;				
	}
	


}
