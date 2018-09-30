package com.jiuyv.common.web.interceptor.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.context.SecurityContextHolder;

import com.jiuyv.yl.console.common.dao.IOprlogDao;
import com.jiuyv.yl.console.common.entity.OprlogVo;
import com.jiuyv.yl.console.security.entity.LogInfo;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.jiuyv.yl.console.security.entity.User;
import com.jiuyv.common.web.action.WebRequestUtil;
import com.jiuyv.common.ApplicationInfo;

/**
 * 
 *  数据库日志工具
 * 
 * @author cowyk
 *
 */
public class DBLogUtil {
	
	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(DBLogUtil.class);
	
	/**
	 * 需要记录日志的action请求
	 */
	private static Map<String, String> DEFAULT_ACTION_MAP = new HashMap<String, String>();
		
	static {
		DEFAULT_ACTION_MAP.put("success", "true");
		DEFAULT_ACTION_MAP.put("errAjax", "true");
		DEFAULT_ACTION_MAP.put("errPage", "true");
		DEFAULT_ACTION_MAP.put("input", "true");
	}
	
	
	/**
	 * 根据资源列表中的actionUrl 判断 是否需要记录日志.
	 * 
	 * @param resourceCache 所有资源的 cache
	 * 
	 * @return true, if need log in db
	 */
	public static boolean needLogInDB(ResourceCache resourceCache) {
		HttpServletRequest request = ServletActionContext.getRequest();
		String actionUrl = request.getServletPath().replaceFirst("/", "");
		Map<String, Resource> resMap = resourceCache.getLogresource();
		Resource resource = resMap.get(actionUrl);
		// if resource is not
		if ( resource == null ||"0".equals( resource.getLogFlag())){
			LOGGER.info("Not need record in database. ");
			return false;
		}
		LOGGER.info("Need record in database. ");
		return true;
	}
	
	/**
	 * 判断是否为该次action chain中返回页面的请求
	 * @param action 请求名
	 * @return
	 */
	public static boolean isForward2Page(String action) {
		if ( DEFAULT_ACTION_MAP.get(action) == null) {
			return false;
		}
		return true;
	}
	
	/**
	 * 记录日志
	 * @param oprlogDao
	 * @param logVo
	 */
	public static void recordCurrentLogInDB(IOprlogDao oprlogDao, OprlogVo logVo) {
		if ( logVo == null ) {
			LOGGER.error("OprlogVo is null. ");
			return;
		}
		try {
			if (logVo.getOprNo() == null ) {
				logVo.setOprNo(oprlogDao.getCurrentSequence());
			}
			oprlogDao.insertOprlog(logVo);
		} catch (Exception e) {
			LOGGER.error("记录日志错误",e);
		}
	}
	
	/**
	 * 登录失败时使用的用户
	 * @return
	 */
	public static User generateFakeUser(){
		User fakeUser = new User();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String loginName = (String)session.getAttribute("SPRING_SECURITY_LAST_USERNAME");
		fakeUser.setLoginNm(loginName);
		fakeUser.setOrgCode("");
		fakeUser.setOprId("");
		return fakeUser;
	}
	
	/**
	 * 获取日志对象
	 * @param resourceId 资源ID
	 * @param resourceZh 资源中文描述
	 * @param exception 异常信息 为空时判断操作成功
	 * @param fakeUser 假造用户 为空时使用security的用户对象
	 * @return
	 */
	public static OprlogVo generateLog(String resourceId, String resourceZh, String exception, User fakeUser) {
		// get http servlet request for use
		HttpServletRequest request = ServletActionContext.getRequest();
		// get current request url
		String url = request.getRequestURI();
		
		// get resMap from url
		User user= fakeUser == null ? (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal() : fakeUser;
		String ip = WebRequestUtil.getIpAddr(request);
		LogInfo log = ApplicationInfo.getLogInfo();
		
		OprlogVo vo = new OprlogVo();

		if ( exception == null ) {
			vo.setOprSuccess("00"); // 00: 操作成功
		} else {
			vo.setOprSuccess("01"); // 01: 操作失败
			vo.setOprRemark(exception);
		}
		
		vo.setOprIp(ip);
		if ( log != null ) {
			vo.setOprNo(log.getOprNo());
			vo.setOprResultInfo(log.getResultInfo());
		}
		
		vo.setOprSysCode("");
		vo.setOprUrl(url);
		vo.setResourceId(resourceId);
		vo.setResourceZh(resourceZh);
		
		vo.setOprLoginId(user.getLoginNm());
		vo.setOprOrgCode(user.getOrgCode());
		vo.setOprUserId(user.getOprId());
		
		return vo;
	}
}
