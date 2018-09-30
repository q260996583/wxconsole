package com.jiuyv.yl.console.security.filter;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.Authentication;
import org.springframework.security.AuthenticationException;
import org.springframework.security.ui.webapp.AuthenticationProcessingFilter;
import org.springframework.security.userdetails.UsernameNotFoundException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.yl.console.common.entity.OprlogVo;
import com.jiuyv.yl.console.security.entity.LogInfo;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.common.util.HttpClientUtil;
import com.jiuyv.common.ApplicationInfo;
                               
public class LoginFilter extends AuthenticationProcessingFilter {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginFilter.class);
	
	private SqlMapClient sqlmapclient = null;

    public SqlMapClient getSqlmapclient() {
        return sqlmapclient;
    }

    public void setSqlmapclient(SqlMapClient sqlmapclient) {
        this.sqlmapclient = sqlmapclient;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request)
            throws AuthenticationException {
    	// 登录更新会话标识
    	HttpSession session = request.getSession();
    	session.invalidate();
    	session = request.getSession(true);
    	session.setAttribute("SPRING_SECURITY_LAST_INS", request.getParameter("j_orgid"));
        Authentication auth = null;
        String username = obtainUsername(request);
        SecurityUserDetail userDetail = null;
        try {
            auth = super.attemptAuthentication(request);
        } catch (AuthenticationException e) {
            // 将用户取出，错误次数加1
            try {
                List<SecurityUserDetail> usersList = sqlmapclient.queryForList("springsecurity.selectuserbypasswd", username);
                if (usersList != null && usersList.size() > 0) {
                    userDetail = usersList.get(0);
                    if (null == userDetail.getFalseTime()) {
                    	userDetail.setFalseTime(1);
					}else {
						userDetail.setFalseTime(userDetail.getFalseTime() + 1);
					}
                    
                    userDetail.setLastUpdTm(DateUtil.getDateyyyyMMddHHmmss());
                    sqlmapclient.update("springsecurity.updateUser", userDetail);

                }
            } catch (Exception e2) {
                LOGGER.error("", e2);

            }

            LOGGER.error("", e);
            OprlogVo vo = new OprlogVo();
            if (null != userDetail)
            	vo.setOprUserId(userDetail.getOprId());
            vo.setOprLoginId(username);
            //vo.setOprIp(HttpClientUtil.getRemoteIpAddr(request));
            String mess = e.toString();
            if (mess.length() > 1200) {
                vo.setOprRemark(mess.substring(0, 1200));
            } else {
                vo.setOprRemark(mess);
            }
            vo.setOprSuccess("01");// 异常01 ==登陆失败
            vo.setOprSysCode("-1");
            vo.setResourceZh("登陆");
            
            vo.setStlmDate(DateUtil.getDate());
            vo.setResourceId("LOGIN");
            vo.setResourceZh("登陆");
            vo.setOprOrgCode("-1");
            vo.setOprLoginId(username);
            vo.setOprUserId("sys");
            //vo.setOprUrl(HttpClientUtil.getRemoteIpAddr(request));
            vo.setOprTime(DateUtil.getDateyyyyMMddHHmmss());
            try {
                //sqlmapclient.insert("common.insert_loginOprlog", vo);
                sqlmapclient.insert("common.insert_loginOprlog", vo);
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                LOGGER.error("", e1);
            }

            throw e;
        }

        // 将用户取出，错误次数清空
        try {
            List<SecurityUserDetail> usersList = sqlmapclient.queryForList("springsecurity.selectuserbypasswd", username);
            if (usersList != null && usersList.size() > 0) {
                userDetail = usersList.get(0);
                
                userDetail.setFalseTime(0);
                userDetail.setLastUpdTm(DateUtil.getDateyyyyMMddHHmmss());
                sqlmapclient.update("springsecurity.updateUser", userDetail);
                OprlogVo vo = new OprlogVo();
                vo.setStlmDate(DateUtil.getDate());
                vo.setResourceId("LOGIN");
                vo.setResourceZh("登陆");
                vo.setOprOrgCode("-1");
                vo.setOprSuccess("00");// 异常01 ==登陆失败
                vo.setOprUserId(userDetail.getOprId());
                vo.setOprLoginId(username);
                //vo.setOprUrl(HttpClientUtil.getRemoteIpAddr(request));
                vo.setOprTime(DateUtil.getDateyyyyMMddHHmmss());
                
                try {
                    //sqlmapclient.insert("common.insert_loginOprlog", vo);
                	sqlmapclient.insert("common.insert_loginOprlog", vo);
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    LOGGER.error("", e1);
                }
            }

        } catch (Exception e2) {
            LOGGER.error("", e2);
        }
        return auth;
    }
                
}
