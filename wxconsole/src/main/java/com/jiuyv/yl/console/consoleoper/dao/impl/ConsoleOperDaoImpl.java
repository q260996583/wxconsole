/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.yl.console.consoleoper.dao.inter.IConsoleOperDao;
import com.jiuyv.yl.console.consoleoper.entity.OperatorLogVo;
import com.jiuyv.yl.console.consoleoper.entity.OperatorVo;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.entity.TblConsoleOprLogVo;
import com.jiuyv.yl.console.orgmngr.entity.CoreTidQrcodeVo;
import com.jiuyv.yl.console.orgmngr.util.AES;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

// TODO: Auto-generated Javadoc
/**
 * The Class ConsoleOperDaoImpl.
 */
public class ConsoleOperDaoImpl extends PublicModuleDao implements
		IConsoleOperDao {

	private static Logger LOGGER = LoggerFactory.getLogger(ConsoleOperDaoImpl.class);
	
	private static final String selectRolesByUser = "CONSOLEOPER.selectRolesByUser";

	private static final String selectAllRoles = "CONSOLEOPER.selectAllRoles";
	
	private static final String updateOperPwd = "CONSOLEOPER.updateOperPassWord";
	
	
	private static final String getPhoneNoByLogNm = "CONSOLEOPER.getPhoneNoByLogNm";

	public List<RoleVo> findRoleByUserId(String userId) {
		return this.getExtendSqlMapClientTemplate().queryForList(
				selectRolesByUser, userId);
	}

	public List<RoleVo> findAllRole() {
		return this.getExtendSqlMapClientTemplate()
				.queryForList(selectAllRoles);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#doInsertOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doInsertOper(OperatorVo vo) throws SQLException {
		try {
			vo.setPassword(AES.encrypt(vo.getPassword()));
		} catch (Exception e) {
			LOGGER.error("doInsertOper failed for AES.encrypt error: ", e);
		}
//		vo.setPassword(CommUtil.md5s(vo.getPassword()));
		getExtendSqlMapClientTemplate().getSqlMapClient().insert(
				"CONSOLEOPER.insertOper", vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#delOper(com.
	 * shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void delOper(OperatorVo vo) throws SQLException {
		getExtendSqlMapClientTemplate().getSqlMapClient().insert(
				"CONSOLEOPER.delOper", vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#findOper(com
	 * .shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public OperatorVo findOper(OperatorVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 通过登录名查找当前用户
	 * @author wxb
	 */
	@Override
	public OperatorVo getPhoneNoByLogNm(String login_nm) throws SQLException {	
		OperatorVo data=(OperatorVo) getExtendSqlMapClientTemplate().queryForObject(getPhoneNoByLogNm, login_nm);				
		return data;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#findPageOper
	 * (java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	@Override
	public ExtData<OperatorVo> findPageOper(List<Filter> filters, Page page)
			throws SQLException {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(
				"CONSOLEOPER.selectPageOper", filters, page);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#doUpdateOper
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doUpdateOper(OperatorVo vo) throws SQLException {
		getExtendSqlMapClientTemplate().getSqlMapClient().update(
				"CONSOLEOPER.updateOper", vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#findOperLog(
	 * com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public OperatorLogVo findOperLog(OperatorVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#findPageOperLog
	 * (java.util.List, com.jiuyv.common.ibatis.vo.Page)
	 */
	@Override
	public ExtData<OperatorLogVo> findPageOperLog(List<Filter> filters,
			Page page) throws SQLException {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(
				"CONSOLEOPER.selectPageOperLog", filters, page);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.shfft.business.consoleoper.dao.inter.IConsoleOperDao#doUpdatePermission
	 * (com.shfft.business.consoleoper.entity.OperatorVo)
	 */
	@Override
	public void doUpdateRoles(OperatorVo vo) throws SQLException {
		SqlMapClient client = getExtendClient().getSqlClient();
		String[] rolesArr = vo.getRoles().split(",");
		String opr_id = vo.getOpr_id();
		Map<String, String> para = new HashMap<String, String>();
		para.put("opr_id", opr_id);
		client.startBatch();
		client.update("CONSOLEOPER.delRols", para);
		for (int i = 0; i < rolesArr.length; i++) {
			para.put("role_id", rolesArr[i]);
			client.insert("CONSOLEOPER.insertRols", para);
		}
		client.executeBatch();
	}

	@Override
	public List<RoleVo> findRoles(OperatorVo vo) throws SQLException {
		return (List<RoleVo>) getExtendClient().getSqlClient().queryForList(
				"CONSOLEOPER.selectRoles", vo);
	}

	@Override
	public List<RoleVo> findHadRoles(OperatorVo vo) throws SQLException {
		return (List<RoleVo>) getExtendClient().getSqlClient().queryForList(
				"CONSOLEOPER.selectHadRoles", vo);
	}

	private static final String selectParam = "CONSOLEOPER.selectParam";


	public ExtData<TblConsoleOprLogVo> findOperLogs(List<Filter> Filters, Page page)
			throws Exception {
		// TODO Auto-generated method stub
		return this.getExtendSqlMapClientTemplate().queryExtendForExtData(
				"CONSOLEOPER.selectOperatorLog", Filters, page);
	}


	@Override
	public void doUpdateOperPwd(OperatorVo vo) throws Exception {

		getExtendSqlMapClientTemplate().getSqlMapClient().update(updateOperPwd,
				vo);

	}

}
