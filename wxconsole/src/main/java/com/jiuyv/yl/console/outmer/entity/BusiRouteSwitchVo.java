package com.jiuyv.yl.console.outmer.entity;

/**
 * 业务路由切换
 * @author whq
 *
 */
public class BusiRouteSwitchVo {
	private String tId;
	private String merId;
	private long monthCount;
	private String routeFlag;
	
	private String merNameZh;
	private String routeFlagZh;
	
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public String getMerId() {
		return merId;
	}
	public void setMerId(String merId) {
		this.merId = merId;
	}
	public long getMonthCount() {
		return monthCount;
	}
	public void setMonthCount(long monthCount) {
		this.monthCount = monthCount;
	}
	public String getRouteFlag() {
		return routeFlag;
	}
	public void setRouteFlag(String routeFlag) {
		this.routeFlag = routeFlag;
	}
	public String getMerNameZh() {
		return merNameZh;
	}
	public void setMerNameZh(String merNameZh) {
		this.merNameZh = merNameZh;
	}
	public String getRouteFlagZh() {
		return routeFlagZh;
	}
	public void setRouteFlagZh(String routeFlagZh) {
		this.routeFlagZh = routeFlagZh;
	}
	

}
