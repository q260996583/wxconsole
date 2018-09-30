/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.action;
import java.text.SimpleDateFormat; 
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.exception.BussnissException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.action.DefaultPageSupportAction;
import com.jiuyv.yl.console.consoleoper.entity.OperatorLogVo;
import com.jiuyv.yl.console.consoleoper.entity.OperatorVo;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.entity.TblConsoleOprLogVo;
import com.jiuyv.yl.console.consoleoper.service.impl.ConsoleOperServiceImpl;
import com.jiuyv.yl.console.consoleoper.service.inter.IConsoleOperService;
import com.jiuyv.yl.console.orgmngr.util.AES;
import com.jiuyv.yl.console.security.entity.User;


// TODO: Auto-generated Javadoc
/**
 * The Class ConsoleOperAction.
 */
public class ConsoleOperAction extends DefaultPageSupportAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 过期天数  */
	private static final Integer EXPIRE_DAYS = 180; 
	
	/** 日期格式  */
	private static final String DATE_FMT = "yyyyMMddHHmmss";
	
	/** 日期极小值用户密码重置后立即失效 */
	private static final String MIN_TIME = "19000101000000";
	
	/** The service. */
	private IConsoleOperService service;

	/**
	 * Gets the service.
	 * 
	 * @return the service
	 */
	public IConsoleOperService getService() {
		return service;
	}

	/**
	 * Sets the service.
	 * 
	 * @param service
	 *            the new service
	 */
	public void setService(IConsoleOperService service) {
		this.service = service;
	}
	/**
	 * 日志查询
	 * @return
	 * @throws Exception
	 */
	public String goOperLog() throws Exception{
		return SUCCESS;
	}
	public String findOperLog() throws Exception {
		ExtData<TblConsoleOprLogVo> resdata = service.findOperLogs(this.getFilters(),
				this.getPageInfo());
		this.setResData(resdata);
		return SUCCESS;
	}
	
	
	 //* 系统配置参数管理
	 
	public String goParamMngr() throws Exception{
		return SUCCESS;
	}

	/**
	 * Do insert oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String doInsertOper() throws Exception {
		OperatorVo vo = (OperatorVo) getVaidateBean(OperatorVo.class);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, EXPIRE_DAYS);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FMT);
		vo.setPasswd_expire_time(sdf.format(c.getTime()));
		String username = getUserInfo().getLoginNm();
		vo.setCreate_oprid(username);
		service.doInsertOper(vo);
		return SUCCESS;
	}

	/**
	 * Del oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String delOper() throws Exception {
		OperatorVo vo = (OperatorVo) getVaidateBean(OperatorVo.class);
		String username = getUserInfo().getLoginNm();
		vo.setLast_upd_opid(username);
		service.delOper(vo);
		return SUCCESS;
	}

	/**
	 * Find oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String findPageOper() throws Exception {
	
		ExtData<OperatorVo> resdata = service.findPageOper(this.getOrgFilters("orgCode"),
				getPageInfo());
		this.setResData(resdata);
		return SUCCESS;
	}

	
	
	
	
	/**
	 * 加载选择的角色列表.
	 * 
	 * @return the string
	 * 
	 * @throws Exception the exception
	 */
	public String loadUserWithRole() throws Exception{	
		OperatorVo user=(OperatorVo) getVaidateBean(OperatorVo.class);	   
		this.setResData(service.loadUserWithRole(user.getOpr_id()));
		return SUCCESS;
	}
	
	
	
	
	
	/**
	 * Do update oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String doUpdateOper() throws Exception {
		OperatorVo vo = (OperatorVo) getVaidateBean(OperatorVo.class);
		String username = getUserInfo().getLoginNm();
		vo.setLast_upd_opid(username);
		service.doUpdateOper(vo);
		return SUCCESS;
	}

	/**
	 * Find oper log.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String findPageOperLog() throws Exception {
		ExtData<OperatorLogVo> resdata = service.findPageOperLog(getFilters(),
				getPageInfo());
		this.setResData(resdata);
		return SUCCESS;
	}
	
	
	
	public String doResetUserPasswd() throws Exception {		
		OperatorVo vo=new OperatorVo();
		vo.setOpr_id(ServletActionContext.getRequest().getParameter("oprId"));
		String newPasswdEncrypted = AES.encrypt("aaa1111!");
		
		vo.setPassword(newPasswdEncrypted);		
		//重置密码后立即失效，用户需重新修改
		vo.setPasswd_expire_time(MIN_TIME);
		service.doUpdateOperPwd(vo);	
		ExtData<OperatorVo> data=new ExtData<OperatorVo>();
		data.setSuccess(true);
		this.setResData(data);
		return SUCCESS;
	}
	
	
	public String doResetAccountPasswd() throws Exception {
		String oldPwd=ServletActionContext.getRequest().getParameter("oldpwd");
		String newPwd=ServletActionContext.getRequest().getParameter("newpwd");
		String phoCheCode=ServletActionContext.getRequest().getParameter("phoCheCode");
		if(this.getUserDetailInfo().getPassword().equals(oldPwd)){
			OperatorVo vo=new OperatorVo();
			Calendar c = Calendar.getInstance();
			c.add(Calendar.DATE, EXPIRE_DAYS);
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FMT);
			
//			//wxb
//			String login_nm=getUserInfo().getLoginNm();
//			String phoneNo = service.getPhoneNoByLogNm(login_nm);
//			String[] keys = { "PLATFORM", "TYPE", "MOBILE","VERIFYCODE" };
//	        String[] params = { "SX_POS_MANAGEMENT", "IDENTIFY_CODE", phoneNo,phoCheCode};
//	        String checkService="RequestIdentifyVerify";
//	        String respString = PhoCheCodeUtil.build(keys, params, checkService);
	        ExtData<OperatorVo> data=new ExtData<OperatorVo>();
	        //if(!org.apache.commons.lang3.StringUtils.isEmpty(respString)){
	        	//if(respString.contains("\"verifyStatus\":\"S\"")){
    		vo.setPasswd_expire_time(sdf.format(c.getTime()));
			vo.setOpr_id(this.getUserDetailInfo().getOprId());
			String newPasswdEncrypted = AES.encrypt(newPwd);
			vo.setPassword(newPasswdEncrypted);	    			
			service.doUpdateOperPwd(vo);
			getUserDetailInfo().setPassword(newPwd);
			data.setSuccess(true);
//	        	}else{
//	        		throw new BussnissException("短信验证失败。");
//	        	}
//	        }			
			this.setResData(data);		
		}
		else {
			throw new BussnissException("原始密码不符");
		}		
		return SUCCESS;
	}
	
//	/**
//	 * 获取用户手机号
//	 * @throws Exception
//	 * @author wxb
//	 */
//	public String getMerPhoneNo() throws Exception {		
//		String login_nm=getUserInfo().getLoginNm();
//		String phoneNo = service.getPhoneNoByLogNm(login_nm);
//		String[] keys = { "PLATFORM", "TYPE", "MOBILES" };
//        String[] params = { "SX_POS_MANAGEMENT", "IDENTIFY_CODE", phoneNo };
//        String service="RequestIdentify";
//		PhoCheCodeUtil.build(keys, params, service);
//		return phoneNo;
//	}
	
//	/**
//	 * 登录界面获取用户手机号
//	 * @throws Exception
//	 * @author wxb
//	 */
//	public String getMerPhoneNoLog() throws Exception {		
//		//String login_nm=getUserInfo().getLoginNm();
//		String login_nm=ServletActionContext.getRequest().getParameter("loginNm");
//		String phoneNo = service.getPhoneNoByLogNm(login_nm);
//		String[] keys = { "PLATFORM", "TYPE", "MOBILES" };
//        String[] params = { "SX_POS_MANAGEMENT", "IDENTIFY_CODE", phoneNo };
//        String service="RequestIdentify";
//		PhoCheCodeUtil.build(keys, params, service);		
//		return phoneNo;
//	}
	
	
	/**
	 * 修改登录用户自身信息
	 * @return
	 * @throws Exception
	 */
	public String doUpdateLoginOperInfo() throws Exception {
		ExtData<OperatorVo> data = service.doUpdateOperInfo(getUserInfo(), convertJsonToBean(getJsonObject(), OperatorVo.class));
		setResData(data);
		return SUCCESS;
	}
	
	/**
	 * 加载登录用户信息
	 * @return
	 * @throws Exception
	 */
	public String loadLoginOperInfo() throws Exception {
		OperatorVo vo = new OperatorVo();
		User user = getUserInfo();
		vo.setCert_no(user.getCertNo());
		vo.setCert_type_no(user.getCertTypeNo());
		vo.setOp_name(user.getOpName());
		vo.setPhone(user.getPhone());
		vo.setEmail(user.getEmail());
		vo.setDescription(user.getDescription());
		vo.setMisc(user.getMisc());
		vo.setReserved1(user.getReserved1());
		vo.setReserved2(user.getReserved2());
		setResData(ExtDataUtil.genWithSingleData(vo));
		return SUCCESS;
	}
	

	public String findRoles() throws Exception {
		OperatorVo vo = new OperatorVo();
		String username = getUserInfo().getLoginNm();
		vo.setLogin_nm(username);
		List<RoleVo> list = service.findRoles(vo);
		ExtData<RoleVo> resdata = ExtDataUtil.genWithData(list);
		this.setResData(resdata);
		return SUCCESS;
	}

	public String findHadRoles() throws Exception {
		OperatorVo vo = (OperatorVo) getVaidateBean(OperatorVo.class);
		List<RoleVo> list = service.findHadRoles(vo);
		ExtData<RoleVo> resdata = ExtDataUtil.genWithData(list);
		this.setResData(resdata);
		return SUCCESS;
	}

	/**
	 * Do update permission.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String doUpdateRoles() throws Exception {
		OperatorVo vo = (OperatorVo) getVaidateBean(OperatorVo.class);
		service.doUpdateRoles(vo);
		return SUCCESS;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jiuyv.common.web.action.DefaultPageSupportAction#execute()
	 */
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String addPage() throws Exception {
		return SUCCESS;
	}

	public String modifyPage() throws Exception {
		return SUCCESS;
	}

	public String detailPage() throws Exception {
		return SUCCESS;
	}
}
