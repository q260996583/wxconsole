package com.jiuyu.batchServer.bussiness.wxrobot.service.interfaces;

import java.util.Map;

import net.sf.json.JSONObject;

public interface IRequestToWXService {
	public String getUUID() throws Exception;
	
	public byte[] showQrCode(String UUID) throws Exception;
	
	public String getChatUri(String UUID) throws Exception;
	
	public Map getChatParam(String uri) throws Exception;
	
	public Map<String, Object> initWx(String passTicket, String uin, String sid,
			String skey, String estr) throws Exception;
	
	public Map getContent(String passTicket, String uin, String sid,
			String skey, String estr) throws Exception;
	
	public String sendMsg(String passTicket, String uin, String sid,
			String skey, String estr, String fromUserName, String toId, String content) throws Exception;
	
	public String snycWx(String passTicket, String uin, String sid,
			String skey, String estr, String syncKey) throws Exception;
	
	public String setRemarkName(String passTicket, String uin, String sid,
			String skey, String estr, String remarkName, String toId) throws Exception;
	
	public String snycWxCheck(String uin, String sid,
			String skey, String estr, String syncKeyStr) throws Exception;
	
	public String getSyncStr(JSONObject syncKeyJson);
	
	public String status_notify(String passTicket, String uin, String sid,
			String skey, String estr, String myNmae) throws Exception;
	
	public String userAdd(String uin, String sid,
			String skey, String estr, String UserName, String ticKet) throws Exception;

	public String addGroup(String uIN, String sID, String sKEY, String dEVICEID,
			String groupId, String fromUserName)  throws Exception;
	
	public String tulingRobot(String tulingKey, String info, String userId) throws Exception;

	public String sendImg(String passTicket, String uin, String sid,
			String skey, String deviceId, String fromUserName, String toId, String filePath)
			throws Exception;

	public String uploadMedia(String uin, String sid, String skey, String DEVICEID,
			String fromUserName, String passTicket, String filePath) throws Exception;
}
