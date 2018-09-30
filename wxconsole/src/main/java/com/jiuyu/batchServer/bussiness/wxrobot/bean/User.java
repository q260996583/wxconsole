package com.jiuyu.batchServer.bussiness.wxrobot.bean;

import java.util.Map;

public class User {
	private Long Uin;
	private String UserName;
	private String NickName;
	private String HeadImgUrl;
	private String RemarkName;
	private String PYInitial;
	private String PYQuanPin;
	private String RemarkPYInitial;
	private String RemarkPYQuanPin;
	private int HideInputBarFlag;
	private int StarFriend;
	private int Sex;
	private String Signature;
	private int AppAccountFlag;
	private int VerifyFlag;
	private int ContactFlag;
	private int SnsFlag;
	private String AttrStatus;
	
	private Map<String, User> ContactList;
	
	public Map<String, User> getContactList() {
		return ContactList;
	}
	public void setContactList(Map<String, User> contactList) {
		ContactList = contactList;
	}
	public String getAttrStatus() {
		return AttrStatus;
	}
	public void setAttrStatus(String attrStatus) {
		AttrStatus = attrStatus;
	}
	public Long getUin() {
		return Uin;
	}
	public void setUin(Long uin) {
		Uin = uin;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getHeadImgUrl() {
		return HeadImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		HeadImgUrl = headImgUrl;
	}
	public String getRemarkName() {
		return RemarkName;
	}
	public void setRemarkName(String remarkName) {
		RemarkName = remarkName;
	}
	public String getPYInitial() {
		return PYInitial;
	}
	public void setPYInitial(String pYInitial) {
		PYInitial = pYInitial;
	}
	public String getPYQuanPin() {
		return PYQuanPin;
	}
	public void setPYQuanPin(String pYQuanPin) {
		PYQuanPin = pYQuanPin;
	}
	public String getRemarkPYInitial() {
		return RemarkPYInitial;
	}
	public void setRemarkPYInitial(String remarkPYInitial) {
		RemarkPYInitial = remarkPYInitial;
	}
	public String getRemarkPYQuanPin() {
		return RemarkPYQuanPin;
	}
	public void setRemarkPYQuanPin(String remarkPYQuanPin) {
		RemarkPYQuanPin = remarkPYQuanPin;
	}
	public int getHideInputBarFlag() {
		return HideInputBarFlag;
	}
	public void setHideInputBarFlag(int hideInputBarFlag) {
		HideInputBarFlag = hideInputBarFlag;
	}
	public int getStarFriend() {
		return StarFriend;
	}
	public void setStarFriend(int starFriend) {
		StarFriend = starFriend;
	}
	public int getSex() {
		return Sex;
	}
	public void setSex(int sex) {
		Sex = sex;
	}
	public String getSignature() {
		return Signature;
	}
	public void setSignature(String signature) {
		Signature = signature;
	}
	public int getAppAccountFlag() {
		return AppAccountFlag;
	}
	public void setAppAccountFlag(int appAccountFlag) {
		AppAccountFlag = appAccountFlag;
	}
	public int getVerifyFlag() {
		return VerifyFlag;
	}
	public void setVerifyFlag(int verifyFlag) {
		VerifyFlag = verifyFlag;
	}
	public int getContactFlag() {
		return ContactFlag;
	}
	public void setContactFlag(int contactFlag) {
		ContactFlag = contactFlag;
	}
	public int getSnsFlag() {
		return SnsFlag;
	}
	public void setSnsFlag(int snsFlag) {
		SnsFlag = snsFlag;
	}
}
