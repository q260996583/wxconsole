/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.dao.inter;

import java.sql.SQLException;
import java.util.List;

import com.jiuyv.yl.console.consoleoper.entity.OperatorLogVo;
import com.jiuyv.yl.console.consoleoper.entity.OperatorVo;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.entity.TblConsoleOprLogVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

// TODO: Auto-generated Javadoc
/**
 * The Interface IConsoleOperDao.
 */
public interface IConsoleOperDao {
	

	public void doUpdateOperPwd(OperatorVo vo) throws Exception;
	
	
	/**
	 * Do insert oper.
	 * 
	 * @param vo
	 *            the vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public void doInsertOper(OperatorVo vo) throws SQLException;
	
	public List<RoleVo> findAllRole();
	public List<RoleVo> findRoleByUserId(String userId);

	/**
	 * Del oper.
	 * 
	 * @param vo
	 *            the vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public void delOper(OperatorVo vo) throws SQLException;

	/**
	 * Find oper.
	 * 
	 * @param vo
	 *            the vo
	 * @return the operator vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public OperatorVo findOper(OperatorVo vo) throws SQLException;
		
	
	/** 
	 * @param login_nm
	 * @return
	 * @throws SQLException
	 *  @author wxb
	 */
	public OperatorVo getPhoneNoByLogNm(String login_nm) throws SQLException;

	/**
	 * Find page oper.
	 * 
	 * @param filters
	 *            the filters
	 * @param page
	 *            the page
	 * @return the ext data
	 * @throws SQLException
	 *             the sQL exception
	 */
	public ExtData<OperatorVo> findPageOper(List<Filter> filters, Page page)
			throws SQLException;

	/**
	 * Do update oper.
	 * 
	 * @param vo
	 *            the vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public void doUpdateOper(OperatorVo vo) throws SQLException;

	/**
	 * Find oper log.
	 * 
	 * @param vo
	 *            the vo
	 * @return the operator log vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public OperatorLogVo findOperLog(OperatorVo vo) throws SQLException;

	/**
	 * Find page oper log.
	 * 
	 * @param filters
	 *            the filters
	 * @param page
	 *            the page
	 * @return the ext data
	 * @throws SQLException
	 *             the sQL exception
	 */
	public ExtData<OperatorLogVo> findPageOperLog(List<Filter> filters,
			Page page) throws SQLException;

	/**
	 * Do update permission.
	 * 
	 * @param vo
	 *            the vo
	 * @throws SQLException
	 *             the sQL exception
	 */
	public void doUpdateRoles(OperatorVo vo) throws SQLException;

	public List<RoleVo> findRoles(OperatorVo vo) throws SQLException;

	public List<RoleVo> findHadRoles(OperatorVo vo) throws SQLException;
	public ExtData<TblConsoleOprLogVo> findOperLogs(List<Filter> filters, Page page) throws Exception;
	
}
