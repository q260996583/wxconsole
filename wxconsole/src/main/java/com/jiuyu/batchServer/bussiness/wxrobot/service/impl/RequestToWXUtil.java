package com.jiuyu.batchServer.bussiness.wxrobot.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gargoylesoftware.htmlunit.util.Cookie;
import com.jiuyu.batchServer.bussiness.wxrobot.bean.User;
import com.jiuyu.batchServer.bussiness.wxrobot.htmlutil.HtmlUtil;
import com.jiuyu.batchServer.bussiness.wxrobot.utils.ImageUtil;
import com.jiuyu.batchServer.bussiness.wxrobot.utils.XmlUtil;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchant;
import com.jiuyv.yl.console.lottery.service.inter.IWebchantMerchantService;

public class RequestToWXUtil {

	//public static List myFriends = new ArrayList();
	private static Long tempId = 0L;
	//private static Map<String, String> pictrue = new HashMap<String, String>();
	//private static String wxHost = "https://wx2.qq.com";
	static {
		tempId = Long.valueOf(String.valueOf(System.currentTimeMillis()).substring(0, 13));
	}
	/**
	 * 获取二维码的标识
	 * @return
	 * @throws Exception
	 */
	public static String getUUID() throws Exception {
		String UUID = "";
		String uri = "https://login.weixin.qq.com/jslogin?appid=wx782c26e4c19acffb"
				+ "&redirect_uri=https%3A%2F%2Fwx.qq.com%2Fcgi-bin%2Fmmwebwx-bin%2Fwebwxnewloginpage&fun=new&"
				+ "lang=zh_CN&_=" + System.currentTimeMillis();
		//防止报如下错
		System.setProperty ("jsse.enableSNIExtension", "false");
		String returnStr = new String(HtmlUtil.requestByGet(uri, null), "UTF-8");
		if(null != returnStr && !"".equals(returnStr)) {
			//System.out.println(returnStr);
			if(returnStr.indexOf("200") != -1) {
				UUID = returnStr.substring(returnStr.length()-14, returnStr.length()-2);
			}
		}
		return UUID;
	}
	/**
	 * 获取二维码
	 * @param UUID
	 * @return
	 * @throws Exception
	 */
	public static byte[] showQrCode(String UUID) throws Exception {
		String getQrCodeImageUri = "https://login.weixin.qq.com/qrcode/"+ UUID +"?t=webwx";
		// 获取某网站页面
		byte[] imageByte = HtmlUtil.requestByGet(getQrCodeImageUri, null);
		//new SwingShowImage(imageByte);
		return imageByte;
	}

	/**
	 * 查询是否扫码，查询登录状态
	 * @param UUID
	 * @return
	 * @throws Exception
	 */
	public static String getChatUri(String UUID) throws Exception {
		String getJm = "";
		try {
			String step3 = "https://login.weixin.qq.com/cgi-bin/mmwebwx-bin/login?"
					+ "uuid=" + UUID + "&tip=1&_=" + tempId++;
			
			String returnStr3 = new String(HtmlUtil.requestByGet(step3, null), "UTF-8");
			if(null != returnStr3 && returnStr3.length() > 0) {
				String winCode = returnStr3.replace("window.code=", "");
				if("200".equals(winCode.substring(0, 3))) {
					getJm = returnStr3.substring(returnStr3.indexOf("https"), 
							returnStr3.length()-2);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return getJm;
	}

	/**
	 * 封闭初始化的一些认证信息
	 * @param uri
	 * @return
	 * @throws Exception
	 */
	public static Map<String, String> getChatParam(String uri, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		Map<String, String> paraMap = new HashMap<String, String>();
		
		String returnParam = new String(HtmlUtil.requestByGet(uri, COOKIESET), "UTF-8");
		if(null != returnParam && returnParam.length() > 0
				&& returnParam.contains("<ret>0</ret>")) {
			String wxuin = XmlUtil.getEleByStr(returnParam, "wxuin");
			String wxsid = XmlUtil.getEleByStr(returnParam, "wxsid");
			String skey  = XmlUtil.getEleByStr(returnParam, "skey");
			String pass_ticket = XmlUtil.getEleByStr(returnParam, "pass_ticket");
			String estr = "e" + String.valueOf(System.currentTimeMillis())+"11";
			paraMap.put("wxuin", URLDecoder.decode(wxuin, "UTF-8"));
			paraMap.put("wxsid", URLDecoder.decode(wxsid, "UTF-8"));
			paraMap.put("skey", URLDecoder.decode(skey, "UTF-8"));
			paraMap.put("pass_ticket", URLDecoder.decode(pass_ticket, "UTF-8"));
			paraMap.put("estr", URLDecoder.decode(estr, "UTF-8"));
		} else {
			throw new BaseException("登录失败!"+returnParam);
		}
		return paraMap;
	}

	/**
	 * 初始化，获取朋友信息 非全
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @return
	 * @throws Exception
	 */
	public static Map<String, Object> initWx(String passTicket, String uin, String sid,
			String skey, String estr, String wxHost, Set<Cookie> COOKIESET, String groupName) throws Exception {
		 //初始化
		 String step4 =  "/cgi-bin/mmwebwx-bin/webwxinit?"
		 		+ "r=" + tempId++
				 + "&lang=en_US&pass_ticket=" + passTicket;
		 //String step4 = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxgetcontact?r=" + System.currentTimeMillis();
		 String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		 String json4 = "{\"BaseRequest\":" + 
				 baseRequestJson
						+ "}";
		 User myUser = new User();
		 String resp = new String(HtmlUtil.requestByPost(wxHost + step4, json4, COOKIESET), "UTF-8");
		// System.out.println(resp);
		 Map<String, User> friends = new HashMap<String, User>();
		 Map<String, User> groups = new HashMap<String, User>();
		 String syncKey = "";
		 String syncKeyStr = "";
		 if(null != resp && resp.length() > 0) {
			 JSONObject jsonObject = JSONObject.fromObject(resp);
			 //SyncKey
			 JSONObject syncKeyJson = jsonObject.getJSONObject("SyncKey");
			 syncKeyStr = getSyncStr(syncKeyJson);
			 syncKey = String.valueOf(syncKeyJson);
			 Map<String, Map> users = getUsersByJson(resp, "ContactList", groupName);
			 friends.putAll(users.get("friends"));
			 groups.putAll(users.get("groups"));
			 Map<String, User> playGrp = users.get("groups");
			 //群用户信息补全
			 if(null != playGrp.get(groupName)) {
				 User grpUser = playGrp.get(groupName);
				 String ret = RequestToWXUtil.getGroupInfo(passTicket, uin, sid, skey,
							estr, wxHost, COOKIESET, grpUser);
			 }
			 JSONObject userJson = jsonObject.getJSONObject("User");
			 myUser = json2User(userJson);//ContactList
		 }
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("myUser", myUser);
		 map.put("friends", friends);
		 map.put("groups", groups);
		 map.put("syncKey", syncKey);
		 map.put("syncKeyStr", syncKeyStr);
		 return map;
	}
	
	public static User json2User(JSONObject json) {
		User user = new User();
		System.out.println("333333:" + json.toString());
		if(null != json) {
			user.setUserName((String)json.get("UserName"));
			user.setNickName((String)json.get("NickName"));
			user.setRemarkName((String)json.get("RemarkName"));
			try {
				user.setAttrStatus((String)json.get("AttrStatus"));
				user.setHeadImgUrl((String)json.get("HeadImgUrl"));
				user.setHideInputBarFlag((Integer)json.get("HideInputBarFlag"));
				user.setSex((Integer)json.get("Sex"));
				user.setSignature((String)json.get("Signature"));
				user.setAppAccountFlag((Integer)json.get("AppAccountFlag"));
				user.setVerifyFlag((Integer)json.get("VerifyFlag"));
				user.setContactFlag((Integer)json.get("ContactFlag"));
				user.setSnsFlag((Integer)json.get("SnsFlag"));
				user.setUin(Long.valueOf(json.get("Uin").toString()));
				user.setPYInitial((String)json.get("PYInitial"));
				user.setPYQuanPin((String)json.get("PYQuanPin"));
				user.setRemarkPYInitial((String)json.get("RemarkPYInitial"));
				user.setRemarkPYQuanPin((String)json.get("RemarkPYQuanPin"));
				user.setStarFriend((Integer)json.get("StarFriend"));
			} catch(Exception e) {
			}
			return user;
		}
		return null;
	}

	public static Map<String,Map> getUsersByJson(String json, String jsonName, String groupName) {
		Map<String, User> friends = new HashMap<String, User>();
		Map<String, User> groups = new HashMap<String, User>();
		Map<String,Map> usermap = new HashMap<String,Map>();
		usermap.put("friends", friends);
		usermap.put("groups", groups);
		JSONObject jsonObject = JSONObject.fromObject(json);
		//System.out.println(json);
		JSONArray userJsons = jsonObject.getJSONArray(jsonName);//"MemberList"
		if(null != userJsons) {
			for(int i=0; i<userJsons.size(); i++) {
				JSONObject userJson = userJsons.getJSONObject(i);
				User user = json2User(userJson);
				if(userJson.getString("UserName").startsWith("@@")) {
					try {
						//仅处理指定群
						if(groupName.equals(new String(userJson.getString("NickName").getBytes(), "UTF-8"))) {
							groups.put(new String(userJson.getString("NickName").getBytes(), "UTF-8"), user);
							//添加群成员
							JSONArray memberList = userJson.getJSONArray("MemberList");
							if(null != memberList && memberList.size() > 0 ) {
								Map<String, User> merList = new HashMap<String, User>();
								for(int j=0; j<memberList.size(); j++) {
									JSONObject memObj = (JSONObject) memberList.get(j);
									User memUser = new User();
									memUser.setUserName(memObj.getString("UserName"));
									merList.put(memUser.getUserName(), memUser);
								}
								user.setContactList(merList);
							}
						}
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				} else if(userJson.getString("UserName").startsWith("@")){
					//数据库每次都更新用户的名字，以免用户变更信息
					if(null != user.getRemarkName() && !user.getRemarkName().isEmpty()) {
						try {
							WebApplicationContext context = WebApplicationContextUtils  
									.getWebApplicationContext(ServletActionContext.getServletContext()); 
							IWebchantMerchantService webchantMerchantService = (IWebchantMerchantService)context
									.getBean("webchantMerchantService");
							
							TblWebchantMerchant webchant = webchantMerchantService.queryWebchantByMerId(user.getRemarkName());
							if(null != webchant) {//更新
								webchant.setAppaccountflag(String.valueOf(user.getAppAccountFlag()));
								webchant.setContactflag(String.valueOf(user.getContactFlag()));
								webchant.setUin(String.valueOf(user.getUin()));
								webchant.setUsername(user.getUserName());
								webchant.setNickname(user.getNickName());
								webchant.setHeadimgurl(user.getHeadImgUrl());
								webchant.setRemarkname(user.getRemarkName());
								webchant.setHideinputbarflag(String.valueOf(user.getHideInputBarFlag()));
								webchant.setSex(String.valueOf(user.getSex()));
								webchant.setSignature(user.getSignature());
								webchant.setVerifyflag(String.valueOf(user.getVerifyFlag()));
								webchant.setPyinitial(user.getPYInitial());
								webchant.setPyquanpin(user.getPYQuanPin());
								webchant.setRemarkpyinitial(user.getRemarkPYInitial());
								webchant.setRemarkpyquanpin(user.getRemarkPYQuanPin());
								webchant.setStarfriend(String.valueOf(user.getStarFriend()));
								webchant.setSnsflag(String.valueOf(user.getSnsFlag()));
								webchant.setContactflag(String.valueOf(user.getContactFlag()));
								webchant.setAttrstatus(user.getAttrStatus());
								webchantMerchantService.doUpdateWebchant(webchant);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					friends.put(userJson.getString("UserName"), user);
				}
			}
		}
		return usermap;
	}
	/**
	 * 获取全部的朋友（全）
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @return
	 * @throws Exception
	 */
	public static Map<String,Map> getContent(String passTicket, String uin, String sid,
			String skey, String estr, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String getpyURL = wxHost + "/cgi-bin/mmwebwx-bin/webwxgetcontact?"
				 + "seq=0"
				 + "&pass_ticket=" + passTicket
				 + "&skey=" + skey
		 		+ "&r=" + tempId++;
		String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		String json4 = "{\"BaseRequest\":" + 
				 baseRequestJson
						+ "}";
		String resp = new String(HtmlUtil.requestByPost(getpyURL, json4, COOKIESET), "UTF-8");
		//System.out.println(resp);
		return getUsersByJson(resp, "MemberList", "");
	}

	/**
	 * 发送消息
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param fromUserName 发送人
	 * @param toId 接收人
	 * @param content
	 * @return
	 * @throws Exception
	 */
//	public static String sendMsg(String passTicket, String uin, String sid,
//			String skey, String estr, String fromUserName, String toId, String content) throws Exception {
//		Thread.sleep(1000);
//		 String msg_id = String.valueOf(System.currentTimeMillis()).substring(0, 13);
//		 String sendUri = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxsendmsg?"
//		 		+ "pass_ticket=" + passTicket;
//		 toId = "\"" + toId + "\"";
//		 String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
//					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
//		 String json = "{\"BaseRequest\": " + baseRequestJson + ",\"Msg\": {\"Type\": 1,\"Content\": "
//		 		+ "\"" + content +"\",\"FromUserName\": \"" + fromUserName +"\",\"ToUserName\": " + toId + ","
//		 		+ "\"LocalID\": \"" + msg_id + "\",\"ClientMsgId\": \"" + msg_id + "\"}}";
//		 String sendRep = new String(HtmlUtil.requestByPost(sendUri, json), "UTF-8");
//		 return sendRep;
//	}

	public static String sendTextImage(String passTicket, String uin, String sid,
			String skey, String estr, String fromUserName, String toId, String content,
			String filePath, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String fileName = filePath+".jpg";
		createImage(content, fileName);
		return RequestToWXUtil.sendImg(passTicket, uin, sid, skey, estr, 
					fromUserName, toId, fileName, wxHost, COOKIESET);
	}
	
	public static void createImage(String content, String filePath) throws IOException {
		ImageIO.write(ImageUtil.drawImage(content), "jpg", 
    			new File(filePath));
	}
	/**
	 * 获取新消息
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param syncKey
	 * @return
	 * @throws Exception
	 */
	public static String snycWx(String passTicket, String uin, String sid,
			String skey, String estr, String syncKey, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		// TODO Auto-generated method stub
		String sendUri = wxHost + "/cgi-bin/mmwebwx-bin/webwxsync?"
				+ "sid=" + sid +"&skey=" + skey + "&lang=en_US&pass_ticket=" + passTicket;
		 String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		 String json = "{\"BaseRequest\":" + baseRequestJson + 
				 		",\"SyncKey\":" + syncKey + ""
				 		+ ",\"rr\":\"" + tempId++ + "\""
				 + "}";
		//System.out.println(sendUri);
		//System.out.println(json);
		String sendRep = new String(HtmlUtil.requestByPost(sendUri, json, COOKIESET), "UTF-8");
		//System.out.println("::::::::::::" + sendRep);
		return sendRep;
	}
	/**
	 * 注释朋友
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param remarkName
	 * @param toId 注释的人
	 * @return
	 * @throws Exception
	 */
	public static String setRemarkName(String passTicket, String uin, String sid,
			String skey, String estr, String remarkName, 
			String toId, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		// TODO Auto-generated method stub
		String sendUri = wxHost + "/cgi-bin/mmwebwx-bin/webwxoplog?"
				+ "&lang=zh_CN&pass_ticket=" + passTicket;
		 String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		 String json = "{\"BaseRequest\":" + baseRequestJson + 
				 		",\"CmdId\":" + 2 + ""
				 		+ ",\"RemarkName\":\"" + remarkName + "\""
				 		+ ",\"UserName\":\"" + toId + "\""
				 + "}";
		//System.out.println(sendUri);
		//System.out.println(json);
		String sendRep = new String(HtmlUtil.requestByPost(sendUri, json, COOKIESET), "UTF-8");
		//System.out.println(sendRep);
		return sendRep;
	}
	/**
	 * 检查是否有新消息
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param syncKeyStr
	 * @return
	 * @throws Exception
	 */
	public static String snycWxCheck(String uin, String sid,
			String skey, String estr, String syncKeyStr, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		// TODO Auto-generated method stub
		//String tempId = String.valueOf(System.currentTimeMillis()).substring(0, 10);
		Thread.sleep(1000);
		String sendUri = "https://webpush." + wxHost.substring(8) +"/cgi-bin/mmwebwx-bin/synccheck?";
		String param = "r=" + tempId++
				+ "&skey=" + URLEncoder.encode(skey)
				+ "&sid=" + sid
				+ "&uin=" + uin
				+ "&deviceid=" + estr
				+ "&synckey=" + syncKeyStr
				+ "&_=" + tempId++;
		sendUri += param;
		//System.out.println(sendUri);
		//System.out.println(json);
		byte[] retByte = HtmlUtil.requestByGet(sendUri, COOKIESET);
		String sendRep = null;
		if(null != retByte) {
			sendRep = new String(HtmlUtil.requestByGet(sendUri, COOKIESET), "UTF-8");
		}
		return sendRep;
	}
	
	/**
	 * 获取同步消息 拼装成键值
	 * @param syncKeyJson
	 * @return
	 */
	public static String getSyncStr(JSONObject syncKeyJson) {
		String syncKeyStr = "";
		 if(null != syncKeyJson) {
			 JSONArray syncKeyList =syncKeyJson.getJSONArray("List");
			 if(null != syncKeyList)
			 for(int i=0; i<syncKeyList.size(); i++) {
				 JSONObject listObj = (JSONObject)syncKeyList.get(i);
				 syncKeyStr += listObj.get("Key").toString()
						 + "_" + listObj.get("Val").toString() + "%7C";
			 }
		 }
		 return syncKeyStr.substring(0, syncKeyStr.length()-3);
	}
	
	/**
	 *  发送信息看是否通(没什么用）
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param myNmae
	 * @return
	 * @throws Exception
	 */
	public static String status_notify(String passTicket, String uin, String sid,
			String skey, String estr, String myNmae, 
			String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String sendUri = "https://webpush." + wxHost.substring(8) +  "/cgi-bin/mmwebwx-bin/webwxstatusnotify"
				+ "?lang=zh_CN&pass_ticket=" + passTicket;
		//System.out.println(sendUri);
		//System.out.println(json);
		 String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		 String json = "{\"BaseRequest\":" + baseRequestJson + 
				 		",\"Code\":" + 3 + ""
				 		+ ",\"FromUserName\":\"" + myNmae + "\""
				 		+ ",\"ToUserName\":\"" + myNmae + "\""
				 		+ ",\"ClientMsgId\":\"" + tempId++ + "\""
				 + "}";
		//System.out.println(sendUri);
		//System.out.println(json);
		String sendRep = new String(HtmlUtil.requestByPost(sendUri, json, COOKIESET), "UTF-8");
		//System.out.println(sendRep);
		return sendRep;
	}
	/**
	 * 添加好友
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @param UserName 添加的好友ID
	 * @param ticKet
	 * @return
	 * @throws Exception
	 */
	public static String userAdd(String uin, String sid,
			String skey, String estr, String UserName, 
			String ticKet, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String sendUri = "https://webpush." + wxHost.substring(8) + "/cgi-bin/mmwebwx-bin/webwxverifyuser"
				+ "?r=" + tempId++ +"&lang=zh_CN";
		String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + estr +"\"}";
		String verifyUserList = "[{"
				+ "\"Value\":\"" + UserName + "\""
				+ ",\"VerifyUserTicket\":\"" + ticKet + "\""
				+ "}]";
		String sceneList = "[33]";
		String json = "{\"BaseRequest\":" + baseRequestJson + 
			 		",\"Opcode\":" + 3 + ""
			 		+ ",\"VerifyUserListSize\":" + 1 + ""
			 		+ ",\"VerifyUserList\":" + verifyUserList + ""
			 		+ ",\"VerifyContent\":\"\""
			 		+ ",\"SceneListCount\":" + 1 + ""
			 		+ ",\"SceneList\":" + sceneList + ""
			 		+ ",\"skey\":\"" + skey + "\""
			 + "}";
		//System.out.println(sendUri);
		//System.out.println(json);
		String sendRep = new String(HtmlUtil.requestByPost(sendUri, json, COOKIESET), "UTF-8");
		//System.out.println(sendRep);
		return sendRep;
	}

	/**
	 * 添加进组
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param DEVICEID
	 * @param groupId
	 * @param fromUserName
	 * @return
	 * @throws Exception
	 */
	public static String addGroup(String uin, String sid, String skey, String DEVICEID,
			String groupId, String fromUserName, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String uri = wxHost + "/cgi-bin/mmwebwx-bin/webwxupdatechatroom?fun=addmember";
		String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
					+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + DEVICEID +"\"}";
		String json = "{\"BaseRequest\":" + baseRequestJson + 
			 		",\"AddMemberList\":\"" + fromUserName + "\""
			 		+ ",\"ChatRoomName\":\"" + groupId + "\""
			 + "}";
		String sendRep = new String(HtmlUtil.requestByPost(uri, json, COOKIESET), "UTF-8");
		return sendRep;
	}

	/**
	 * 与图林机器人通话
	 * @param tulingKey
	 * @param info
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public static String tulingRobot(String tulingKey, String info, String userId, Set<Cookie> COOKIESET)
			throws Exception {
		String uri = "http://www.tuling123.com/openapi/api";
		String json = "";
		String sendRep = new String(HtmlUtil.requestByPost(uri, json, COOKIESET), "UTF-8");
		return sendRep;
	}
	/**
	 * 给某个朋友发图片
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param deviceId
	 * @param fromUserName  发送人
	 * @param toId  接收人
	 * @param filePath  文件路+文件名
	 * @return
	 * @throws Exception
	 */
	public static String sendImg(String passTicket, String uin, String sid,
			String skey, String deviceId, String fromUserName, 
			String toId, String filePath, String wxHost, Set<Cookie> COOKIESET)
			throws Exception {
		java.util.Random random = new java.util.Random();// 定义随机类
		int result=random.nextInt(2);
		Thread.sleep(result*1000);
		
		String mediaId = uploadMedia(uin, sid, skey, deviceId, 
				fromUserName, passTicket, filePath, wxHost, COOKIESET);
		if(null != mediaId && !mediaId.isEmpty()) {
			String msg_id = String.valueOf(System.currentTimeMillis())
					.substring(0, 13);
			String url = wxHost + "/cgi-bin/mmwebwx-bin/webwxsendmsgimg?fun=async&f=json&pass_ticket="
					+ passTicket;
			//type=1文字 3图片 47 GIF
			String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid
					+ "\"," + "\"Skey\":\"" + skey + "\",\"DeviceID\":\""
					+ deviceId + "\"}";
			String json = "{\"BaseRequest\": " + baseRequestJson
					+ ",\"Msg\": {\"Type\": 3,\"Content\": "
					+ "\"\",\"FromUserName\": \"" + fromUserName
					+ "\",\"ToUserName\": \"" + toId + "\"," + "\"LocalID\": \""
					+ msg_id + "\",\"ClientMsgId\": \"" + msg_id + "\""
					+ ",\"MediaId\":\"" + mediaId + "\"}" + ",\"Scene\":0}";
			String sendRep = new String(HtmlUtil.requestByPost(url, json, COOKIESET),
					"UTF-8");
		}
		return "success";
	}
	/**
	 * 多媒体文件要先上传，再发送
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param DEVICEID
	 * @param fromUserName
	 * @param passTicket
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public static String uploadMedia(String uin, String sid, String skey, String DEVICEID,
			String fromUserName, String passTicket, 
			String filePath, String wxHost, Set<Cookie> COOKIESET) throws Exception {
		String url = "https://file." + wxHost.substring(8) + "/cgi-bin/mmwebwx-bin/webwxuploadmedia?f=json";
		//"D:\\home\\heheh.jpg"
		File fiel = new File(filePath);
		String baseRequestJson = "{\"Uin\":" + uin + ",\"Sid\":\"" + sid + "\","
				+ "\"Skey\":\"" + skey +"\",\"DeviceID\":\"" + DEVICEID +"\"}";
		String json = "{\"BaseRequest\":" + baseRequestJson + 
			 		",\"ClientMediaId\":\"" + (new Date()).getTime() + "\""
			 		+ ",\"TotalLen\":" + fiel.length() + ""
			 		+ ",\"StartPos\":" + 0
			 		+ ",\"DataLen\":" + fiel.length()
			 		+ ",\"MediaType\":" + 4
			 + "}";
		String retJson = HtmlUtil.send(url, filePath, json, passTicket, COOKIESET);
		JSONObject jsonObject = JSONObject.fromObject(retJson);
		String mediaId = (String)jsonObject.get("MediaId");
		//pictrue.put("dog", "mediaId");
		return mediaId;
	}
	
	/**
	 * 退出
	 * @param passTicket
	 * @param uin
	 * @param sid
	 * @param skey
	 * @param estr
	 * @return
	 * @throws Exception
	 */
	public static String getDestory(String uin, String sid,
			String skey,String wxHost) throws Exception {
		String getpyURL = wxHost + "/cgi-bin/mmwebwx-bin/webwxlogout?"
				 + "redirect=1&type=1&skey="
				 + "&skey=" + skey;
		Map<String, String> param = new HashMap<String, String>();
		param.put("sid", sid);
		param.put("uin", uin);
		String resp = HtmlUtil.post(getpyURL, param);
		//System.out.println(resp);
		return resp;
	}
	
	
	public static String getGroupInfo(String passTicket, String uin, String sid,
			String skey, String DEVICEID, String wxHost, Set<Cookie> COOKIESET
			, User groupUser) throws Exception {
		String getpyURL = wxHost + "/cgi-bin/mmwebwx-bin/webwxbatchgetcontact?"
				+ "type=ex&r=" + tempId++
				+ "&pass_ticket=" + passTicket;
		
		String baseRequestJson = "{\"DeviceID\":\"" + DEVICEID + "\",\"Sid\":\"" + sid + "\","
				+ "\"Skey\":\"" + skey +"\",\"Uin\":" + uin +"}";
		String userNameStr = "";
		if(null == groupUser || null == groupUser.getContactList() 
				|| groupUser.getContactList().isEmpty()) {
			return null;
		}
		Map<String, User> memUser = groupUser.getContactList();
		for(User userName : memUser.values()) {
			userNameStr +=  ",{\"EncryChatRoomId\":\""+ groupUser.getUserName() +"\","
	 				+ "\"UserName\":\""+ userName.getUserName() +"\"}";
		}
		String json = "{\"BaseRequest\":" + baseRequestJson + 
			 		",\"Count\":" + memUser.size() + ""
			 		+ ",\"List\":[" + userNameStr.substring(1) + "]"
			 + "}";
		
		String resp = new String(HtmlUtil.requestByPost(getpyURL, json, COOKIESET), "UTF-8");
		
		Map<String, Map> users = getUsersByJson(resp, "ContactList", groupUser.getNickName());
		Map groupMap = users.get("friends");
		memUser.putAll(groupMap);
		//groupUser.setContactList(groupMap);//完善用户资料
		//System.out.println(resp);
		return resp;
	}
	
	public static Map<String, User> getUserInfo(String passTicket, String uin, String sid,
			String skey, String DEVICEID, String wxHost, Set<Cookie> COOKIESET
			,List<String> usernames, String grpName) throws Exception {
		String getpyURL = wxHost + "/cgi-bin/mmwebwx-bin/webwxbatchgetcontact?"
				+ "type=ex&r=" + tempId++
				+ "&pass_ticket=" + passTicket;
		
		String baseRequestJson = "{\"DeviceID\":\"" + DEVICEID + "\",\"Sid\":\"" + sid + "\","
				+ "\"Skey\":\"" + skey +"\",\"Uin\":" + uin +"}";
		
		String userNameStr = "";
		for(String username : usernames) {
			userNameStr =  ",{\"EncryChatRoomId\":\""+ grpName +"\","
	 				+ "\"UserName\":\""+ username +"\"}";
		}
		String json = "{\"BaseRequest\":" + baseRequestJson + 
		 		",\"Count\":" + usernames.size() + ""
		 		+ ",\"List\":[" + userNameStr.substring(1) + "]"
		 + "}";
		
		String resp = new String(HtmlUtil.requestByPost(getpyURL, json, COOKIESET), "UTF-8");
		
		Map<String, Map> users = getUsersByJson(resp, "ContactList", grpName);
		Map groupMap = users.get("friends");
		return groupMap;
	}
	
	public static Map<String, User> json2UserListForGrp(JSONArray jsonArray) {
		Map<String, User> members = new HashMap<String, User>();
		
		for(int i=0; i<jsonArray.size(); i++) {
			JSONObject json = jsonArray.getJSONObject(i);
			if(null != json) {
				User user = new User();
				user.setUserName((String)json.get("UserName"));
				user.setNickName((String)json.get("NickName"));
				user.setAttrStatus(String.valueOf(json.getInt("AttrStatus")));
				members.put(user.getUserName(), user);
			}
		}
		return members;
	}
	
	public static void main(String[] args) throws Exception {
//        String escapeStr1 = StringEscapeUtils.escapeXml("");
//        System.out.println(escapeStr1);//打印&lt;name&gt;king&lt;/name&gt;
        String unescapeStr2 = StringEscapeUtils.unescapeXml("&lt;sysmsg type=\"revokemsg\"&gt;&lt;revokemsg&gt;&lt;session&gt;wxid_80r79dvk0aoa21&lt;/session&gt;&lt;oldmsgid&gt;1057515481&lt;/oldmsgid&gt;&lt;msgid&gt;2512199943216137293&lt;/msgid&gt;&lt;replacemsg&gt;&lt;![CDATA[\"龙马\" 撤回了一条消息]]&gt;&lt;/replacemsg&gt;&lt;/revokemsg&gt;&lt;/sysmsg&gt;");
//        System.out.println(unescapeStr2);//打印<name>king</name>
//        String ss = XmlUtil.getEleByStr("<sysmsg type=\"revokemsg\"><revokemsg><"
//        		+ "session>wxid_80r79dvk0aoa21</session><oldmsgid>1057515481<"
//        		+ "/oldmsgid><msgid>2512199943216137293</msgid><replacemsg></replacemsg><"
//        		+ "/revokemsg></sysmsg>", "msgid");
//        System.out.println(ss);
        
        SAXReader reader = new SAXReader(); 
		Document doc = reader.read(new ByteArrayInputStream(unescapeStr2.getBytes("utf-8")));
		List<Element> childElements =  doc.getRootElement().elements();
        System.out.println(childElements.get(0).elementText("msgid"));
        for (Element child : childElements) {//循环输出全部book的相关信息  
            List<Element> books = child.elements();  
            for (Element book : books) {  
                String name = book.getName();//获取当前元素名  
                String text = book.getText();//获取当前元素值  
                System.out.println(name + ":" + text);  
            }  
        }  
//		System.out.println(URLDecoder.decode("&lt;sysmsg type=\"revokemsg\"&gt;&lt;revokemsg&gt;&lt;session&gt;wxid_80r79dvk0aoa21&lt;/session&gt;&lt;oldmsgid&gt;1057515481&lt;/oldmsgid&gt;&lt;msgid&gt;2512199943216137293&lt;/msgid&gt;&lt;replacemsg&gt;&lt;![CDATA[\"龙马\" 撤回了一条消息]]&gt;&lt;/replacemsg&gt;&lt;/revokemsg&gt;&lt;/sysmsg&gt;", "UTF-8"));
//		System.out.println(URLEncoder.encode("&lt;sysmsg type=\"revokemsg\"&gt;&lt;revokemsg&gt;&lt;session&gt;wxid_80r79dvk0aoa21&lt;/session&gt;&lt;oldmsgid&gt;1057515481&lt;/oldmsgid&gt;&lt;msgid&gt;2512199943216137293&lt;/msgid&gt;&lt;replacemsg&gt;&lt;![CDATA[\"龙马\" 撤回了一条消息]]&gt;&lt;/replacemsg&gt;&lt;/revokemsg&gt;&lt;/sysmsg&gt;", "UTF-8"));
	}
}
