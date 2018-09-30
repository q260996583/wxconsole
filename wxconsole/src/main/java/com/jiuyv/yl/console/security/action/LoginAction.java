package com.jiuyv.yl.console.security.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.jiuyv.common.web.action.DefaultPageSupportAction;
import com.jiuyv.common.tree.TreeFacotoryBean;
import com.jiuyv.common.tree.TreeNode;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;
public class LoginAction extends DefaultPageSupportAction {
	
	

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String DATE_FMT = "yyyyMMddHHmmss";
	
	private ResourceCache resoucrecache=null;

	public ResourceCache getResoucrecache() {
		return resoucrecache;
	}

	public void setResoucrecache(ResourceCache resoucrecache) {
		this.resoucrecache = resoucrecache;
	}
	
	private  SecurityUserDetail userDetail;
	
	private String memu;
	public String getMemu() {
		return memu;
	}

	public void setMemu(String memu) {
		this.memu = memu;
	}

	/**
	 * 登录成功后显示主界面.
	 * 
	 * @return 成功界面
	 * 
	 * @throws Exception the exception
	 */
	public String execute() throws Exception{	
		//得到用户信息和用户的权限列表
		try {
			this.userDetail=(SecurityUserDetail) this.getUserInfo();
		} catch (Exception e) {
			return "fail";
		}
		String buttonsAuthor="";			
		Map<String, Resource> sourcemap = resoucrecache.getResources();
		for (int i = 0; i < userDetail.getAuthorities().length; i++) {
			Resource tempresouce = sourcemap.get(userDetail.getAuthorities()[i].getAuthority());
			if (tempresouce!=null){//&& IConstants.resoucetypebutton.equals(tempresouce.getShowType())){
				buttonsAuthor=buttonsAuthor+","+tempresouce.getResourceID();
			}
			
		}
		// 计算密码过期日期，提前10天提醒
		String expireTime = userDetail.getPasswdExpireTime();
		if ( expireTime != null ) {
			Calendar notifyCalendar = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FMT);
			notifyCalendar.setTime(sdf.parse(expireTime));
			notifyCalendar.add(Calendar.DATE, -10);
			
			Calendar loginCalendar = Calendar.getInstance();
			loginCalendar.setTime(sdf.parse(userDetail.getLoginTime()));
			boolean expireInTen = false;
			if ( loginCalendar.compareTo(notifyCalendar) >= 0 ) {
				expireInTen = true;
			} 
			addRequestAttr("expireInTen", expireInTen);
		}
		ServletActionContext.getRequest().getSession().setAttribute("userDetail", userDetail);		
		ServletActionContext.getRequest().setAttribute("buttonsAuthor", buttonsAuthor);		
		
		//形成菜单树		
		TreeNode rootnode=TreeFacotoryBean.fromtree(resoucrecache, userDetail.getAuthorities());
		String tempnode=JSONArray.fromObject(rootnode.getChildren()).toString();
		this.setResData(tempnode);
		return SUCCESS;
		
	}
	

	
	/**
	 * 注销.
	 * 
	 * @return 成功界面
	 * 
	 * @throws Exception the exception
	 */
	public String loginOut() throws Exception{

		
		return SUCCESS;
	}

	public SecurityUserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(SecurityUserDetail userDetail) {
		this.userDetail = userDetail;
	}



}



