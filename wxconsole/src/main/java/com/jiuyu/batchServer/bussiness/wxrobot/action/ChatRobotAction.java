package com.jiuyu.batchServer.bussiness.wxrobot.action;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringEscapeUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gargoylesoftware.htmlunit.util.Cookie;
import com.jiuyu.batchServer.bussiness.wxrobot.bean.User;
import com.jiuyu.batchServer.bussiness.wxrobot.service.impl.RequestToWXUtil;
import com.jiuyu.batchServer.bussiness.wxrobot.service.interfaces.ILotteryAnalysiser;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.lang.date.DateUtils;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.yl.console.common.service.inter.ICommonService;
import com.jiuyv.yl.console.lottery.batch.HappyNotityTask;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.entity.TblWebchantMerchant;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;
import com.jiuyv.yl.console.lottery.service.inter.IWebchantMerchantService;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

public class ChatRobotAction implements Runnable{
	private String lotteryType;
	public String uuid = "";
	public String UIN = "";
	public String SID = "";
	public String SKEY = "";
	public String PASSTICKET = "";
	//public String DEVICEID = "";
	public String SYNCKEY = "";
	public String SYNCKEYSTR = "";
	public String retImgPath;
	private String wxHost = "https://wx2.qq.com";
	public TblLotteryMerchantService  tblLotteryMerchantService;//商户
	public ILotteryOrderService lotteryOrderService;//商户订单
	public ILotteryResultOperService lotteryResultOperService;//开奖信息
	public IWebchantMerchantService webchantMerchantService;
	private ICommonService commonService;
	private HappyNotityTask happyNotityTask;
	public Map<String, User> myFriends = new HashMap<String, User>();
	//public Map<String, User> groups = new HashMap<String, User>();
	public User groups = new User();
	public User myUser = null;
	private String lotterReg;
	ILotteryAnalysiser lotteryAnalysiser;
	public Set<Cookie> COOKIESET = new HashSet<Cookie>();
	private boolean robotSwitch = false;
	public RobotManagerAction manager;
	
	public RobotManagerAction getManager() {
		return manager;
	}
	public void setManager(RobotManagerAction manager) {
		this.manager = manager;
	}
	public boolean isRobotSwitch() {
		return robotSwitch;
	}
	public void setRobotSwitch(boolean robotSwitch) {
		this.robotSwitch = robotSwitch;
	}
	public String getLotterReg() {
		return lotterReg;
	}
	public void setLotterReg(String lotterReg) {
		this.lotterReg = lotterReg;
	}
	public ILotteryAnalysiser getLotteryAnalysiser() {
		return lotteryAnalysiser;
	}
	public void setLotteryAnalysiser(ILotteryAnalysiser lotteryAnalysiser) {
		this.lotteryAnalysiser = lotteryAnalysiser;
	}
	public String getLotteryType() {
		return lotteryType;
	}
	public void setLotteryType(String lotteryType) {
		this.lotteryType = lotteryType;
	}
	public HappyNotityTask getHappyNotityTask() {
		return happyNotityTask;
	}
	public void setHappyNotityTask(HappyNotityTask happyNotityTask) {
		this.happyNotityTask = happyNotityTask;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public ICommonService getCommonService() {
		return commonService;
	}
	public void setCommonService(ICommonService commonService) {
		this.commonService = commonService;
	}
	public IWebchantMerchantService getWebchantMerchantService() {
		return webchantMerchantService;
	}
	public void setWebchantMerchantService(
			IWebchantMerchantService webchantMerchantService) {
		this.webchantMerchantService = webchantMerchantService;
	}
	public ILotteryResultOperService getLotteryResultOperService() {
		return lotteryResultOperService;
	}
	public void setLotteryResultOperService(
			ILotteryResultOperService lotteryResultOperService) {
		this.lotteryResultOperService = lotteryResultOperService;
	}

	//private String tempId = String.valueOf(System.currentTimeMillis()).substring(0, 13);
	//private Map<String, Object> addMsgIdsMap = new HashMap<String, Object>();
	private String oprId;
	
	public ILotteryOrderService getLotteryOrderService() {
		return lotteryOrderService;
	}
	public void setLotteryOrderService(ILotteryOrderService lotteryOrderService) {
		this.lotteryOrderService = lotteryOrderService;
	}
	public String getRetImgPath() {
		return retImgPath;
	}
	public void setRetImgPath(String retImgPath) {
		this.retImgPath = retImgPath;
	}
	public TblLotteryMerchantService getTblLotteryMerchantService() {
		return tblLotteryMerchantService;
	}
	public void setTblLotteryMerchantService(
			TblLotteryMerchantService tblLotteryMerchantService) {
		this.tblLotteryMerchantService = tblLotteryMerchantService;
	}
	
	private String getEid() {
		return String.valueOf(System.currentTimeMillis())+"11";
	}
	public static String getUUID()  throws Exception {
		//步骤1 获取UID
		String UUID = RequestToWXUtil.getUUID();
		return UUID;
	}
	
	public static byte[] getLoginQrcode(String UUID) throws Exception {
		//步骤2 获取二维码图片
		return RequestToWXUtil.showQrCode(UUID);
	}
	
	public static String qryIsStart(String UUID) throws Exception {
		//步骤3 查询是否扫描
		String retGetJm = RequestToWXUtil.getChatUri(UUID);
		if(null != retGetJm && !retGetJm.isEmpty()) {
			return retGetJm;
		}
		return null;
	}
	
	public String processMsgManager(String selector) throws Exception {
		if("2".equals(selector) || "6".equals(selector) || "3".equals(selector)) {//2新消息 6加好友
			String snycWxStr = RequestToWXUtil.snycWx(PASSTICKET, UIN,
					SID, SKEY, getEid(), SYNCKEY, wxHost, COOKIESET);//同步消息
			JSONObject jsonSnycWxStr = JSONObject.fromObject(snycWxStr);
			JSONObject syncKeyJson = jsonSnycWxStr.getJSONObject("SyncCheckKey");
			SYNCKEY = String.valueOf(syncKeyJson);
			SYNCKEYSTR = RequestToWXUtil.getSyncStr(syncKeyJson);//同步后获取的码要更新
			JSONArray addMsgListJson = jsonSnycWxStr.getJSONArray("AddMsgList");//新消息
			System.out.println(SYNCKEYSTR);
			if(null != addMsgListJson) {
				for(int i=0; addMsgListJson.size()>i; i++) {
					JSONObject msg = (JSONObject)addMsgListJson.get(i);
					String msgIdKey = msg.getString("MsgId");
					int msgTypeInt = msg.getInt("MsgType");
					//if(null == addMsgIdsMap.get(msgIdKey)) {
						//addMsgIdsMap.put(msgIdKey, "消息");
					switch(msgTypeInt) {
					case 1: //普通消息
						this.processGeneralMsg(msg, jsonSnycWxStr, msgIdKey);
						break;
					case 37: //加好友
						this.processAddMsg(msg);
						break;
					case 3: //外部图片
					case 47: //收藏图片
						this.processReceiveImage(msg, jsonSnycWxStr);
						break;	
					case 10002:
						this.cancleMsgProcess(msg);
						break;
//						case 10000: //群变更
//							this.processGrpAddMerMsg(jsonSnycWxStr, msg);
//							break;
					}
					//}
				}
			}
		}
		return "";
	}
	
	private String cancleMsgProcess(JSONObject msg) throws Exception {
		String fromUserName  = msg.getString("FromUserName");
		String content = msg.getString("Content").trim();
		String unescapeStr2 = StringEscapeUtils.unescapeXml(content);
		User user = this.myFriends.get(fromUserName);
		
		TblLotteryMerchant merchant = this.checkMer(user);
		
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new ByteArrayInputStream(unescapeStr2.getBytes("utf-8")));
		List<Element> childElements =  doc.getRootElement().elements();
        String msgId = childElements.get(0).elementText("msgid");
	    if(null != msgId && !msgId.isEmpty() ) {
	    	TblLotteryOrder cancleOrder = lotteryOrderService
	    			.selectByMsgIdAndMerId(msgId, merchant.getMerid());
	    	if(null != cancleOrder) {
	    		String retContent = "撤单失败！已进入\n结算流程！";
	    		Long transSum = cancleOrder.getTransAmtSum();
	    		int count = cancleOrder.getCount();
	    		
	    		int updateCount = lotteryOrderService.doCancleOrder(msgId, merchant.getMerid());
	    		if(updateCount == count) {
	    			merchant.setAddAmt(transSum);
		    		tblLotteryMerchantService.doUpdateMerAmt(merchant);
		    		retContent = "撤单成功！";
	    		}
	    		this.say(retContent, fromUserName, "00");
	    	}
	    }
		return "success";
	}
	private void processGrpAddMerMsg(JSONObject jsonSnycWxStr, JSONObject msg) throws Exception {
		
		User grpUser = groups;
		if(!grpUser.getUserName().equals(msg.getString("FromUserName"))) {
			//不是要维护的群
			return;
		}
		JSONArray modContactList = jsonSnycWxStr.getJSONArray("ModContactList");
		if(modContactList != null && modContactList.size() > 0) {
			for(int i=0; i<modContactList.size(); i++) {
				JSONObject modJson = modContactList.getJSONObject(i);
				if(groups.getUserName().equals(modJson.getString("UserName"))) {
					JSONArray memberList = modJson.getJSONArray("MemberList");
					if(null == memberList || memberList.size()>0) {
						Map<String, User> newMemInfo = RequestToWXUtil.json2UserListForGrp(memberList);
						this.groups.setContactList(newMemInfo);//获取新群
					}
					break;
				}
			}
//			Map<String, User> newMemInfo = RequestToWXUtil.getUserInfo(PASSTICKET, UIN, SID, SKEY, DEVICEID, 
//					wxHost, COOKIESET, newMemNames, this.getSwitch().getReserved1());
		}
	}
	
	public String processReceiveImage(JSONObject msg, JSONObject jsonSnycWxStr) throws Exception {
		String fromUserName  = msg.getString("FromUserName");
		System.out.println("消息：" + msg);
		if("@@".equals(fromUserName.substring(0, 2))
				|| fromUserName.equals(myUser.getUserName())) {
			this.processGrpAddMerMsg(jsonSnycWxStr, msg);
			return "";
		}
		return null;
	}
	
	public String processGeneralMsg(JSONObject msg, JSONObject jsonSnycWxStr, String msgId) throws Exception {
		String fromUserName  = msg.getString("FromUserName");
		String content = msg.getString("Content").trim();
		System.out.println("消息：" + msg);
		if("@@".equals(fromUserName.substring(0, 2))
				|| fromUserName.equals(myUser.getUserName())) {//群消息不回
			this.processGrpAddMerMsg(jsonSnycWxStr, msg);
			return "";
		}
		
		User user = this.myFriends.get(fromUserName);
		if(null == user) {
			JSONArray modcontackList = jsonSnycWxStr.getJSONArray("ModContactList");
			for(int i=0; i<modcontackList.size(); i++) {
				JSONObject josnUser = modcontackList.getJSONObject(i);
				if(fromUserName.equals(josnUser.getString("UserName"))) {
					user = RequestToWXUtil.json2User(josnUser);
					myFriends.put(fromUserName, user);
					break;
				}
			}
		}
		TblLotteryMerchant merchant = this.checkMer(user);
		
		String retContent = this.processMsg(content, merchant, msgId);
		if(null != retContent) {
			String path = retImgPath;
			String type = "00";
			if(retContent.matches("^.*\\.jpg$")) {
				type = "01";
			}
			this.say(retContent, fromUserName, type);
		}
		return "success";
	}
	
	private TblLotteryMerchant checkMer(User user) throws Exception {
		synchronized(ChatRobotAction.class) {
			String merId = null;
			if(null != user) {
				merId  = user.getRemarkName();
				//如果不是商户就别回了
				TblLotteryMerchant merchant = new TblLotteryMerchant();
				merchant.setMerid(merId);
				List<TblLotteryMerchant> mers = null;
				if(null == merId || merId.isEmpty()
						|| null == (mers = tblLotteryMerchantService.selectByMer(merchant))
						|| mers.isEmpty()) {
					//获取群成员
					Map<String, User> contact = this.groups.getContactList();
					User temUser = contact.get(user.getUserName());
					//群里没有
					if(null == temUser) {
						merchant = this.createMerchant(user);
					} else {
						//群里有这个人，看看是不是有相同名称，没有可以向其它机器人获取商户号
						Map<String, ChatRobotAction> robots = manager.getRobots();
						boolean flag = false;
						String key = "_" +this.oprId;
						if(lotteryType.equals("03")) {
							key = "10" + key;
						} else {
							key = "03" + key;
						}
						ChatRobotAction ca = robots.get(key);
						if(null == ca) {
							return this.createMerchant(user);
						} else {
							//看看群里有几个
							int sameNum = 0;
							List<User> sameNameList = new ArrayList<User>();
							for(User u : contact.values()) {
								if(user.getNickName().equals(u.getNickName())) {
									User myUser = this.myFriends.get(u.getUserName());
									if(null != myUser) {
										sameNameList.add(myUser);
										merchant.setMerid(myUser.getRemarkName());
										//数据库里没有
										if(null == myUser.getRemarkName()||myUser.getRemarkName().length()<=0
												||tblLotteryMerchantService.selectByMer(merchant).size()<=0) {
											sameNum ++;
										}
									} else {
										sameNameList.add(u);
										sameNum ++;
									}
								}
							}
							//两个以上DB无
							if(sameNum > 1) {
								return this.createMerchant(user);
							}
							//其它的群友
							User caGroupUser = ca.groups;
							Map<String, User> otherFrd = ca.myFriends;
							Map<String, User> caremarkMap = new HashMap<String, User>();
							for(User caUser : caGroupUser.getContactList().values()) {
								if(user.getNickName().equals(caUser.getNickName())) {
									User otherFrdUser = otherFrd.get(caUser.getUserName());
									if(null != otherFrdUser) {
										String frdRek = otherFrdUser.getRemarkName();
										merchant.setMerid(frdRek);
										if(null != frdRek&&
												frdRek.length()>0
												&& tblLotteryMerchantService.selectByMer(merchant).size()>0) {
											caremarkMap.put(frdRek, otherFrdUser);
										}
									}
								}
							}
							if(1 == sameNameList.size()) {
								if(caremarkMap.isEmpty()) {
									return this.createMerchant(user);
								} else if(caremarkMap.size() == 1) {
									String rek = "";
									for (String rekTemp : caremarkMap.keySet()) {
										rek = rekTemp;
									}
									return this.onlineRemarkName(user, rek);
								} else {//N的情况
									return this.createMerchant(user);
								}
							} else if(sameNameList.size() > 1) {
								//1b无，多同名
								for(int i=0; i<sameNameList.size(); i++) {
									//caremarkMap.get(key);
									User moreUser = sameNameList.get(i);
									String moreRek = moreUser.getRemarkName();
									User care = caremarkMap.get(moreRek);
									if(null != care) {
										caremarkMap.remove(moreRek);
										//sameNameList.remove(i);
									}
								}
								if(caremarkMap.size() == 1) {
									String rek = "";
									for (String rekTemp : caremarkMap.keySet()) {
										rek = rekTemp;
									}
									return this.onlineRemarkName(user, rek);
								} else {
									return this.createMerchant(user);
								}
							} else {
								return this.createMerchant(user);
							}
						}
					}
				} else {
					merchant = mers.get(0);//数据库里有没有
				}
				return merchant;
			}
		}
		return null;
	}
	
	
	private TblLotteryMerchant onlineRemarkName(User user, String rek) throws Exception {
		RequestToWXUtil.setRemarkName(PASSTICKET, UIN, SID, SKEY, 
				getEid(), rek, user.getUserName(), 
				wxHost,COOKIESET);
		user.setRemarkName(rek);
		TblLotteryMerchant merchant = new TblLotteryMerchant();
		merchant.setMerid(rek);
		return (TblLotteryMerchant)tblLotteryMerchantService.selectByMer(merchant).get(0);
	}
	private TblLotteryMerchant createMerchant(User user) throws Exception {
		TblLotteryMerchant merchant = this.createLotterMer(user);
		//user.setRemarkName(merchant.getMerid());
		if(null == this.myFriends.get(user.getUserName())) {
			myFriends.put(user.getUserName(), user);
		}
		if(null != groups && null == groups.getContactList().get(user.getUserName())) {
			SecCodeVo secCodeVo = this.getSwitch();
			if(this.robotSwitch && null != secCodeVo) {
				RequestToWXUtil.addGroup(UIN, SID, SKEY, getEid(), 
						groups.getUserName(), user.getUserName(), wxHost,COOKIESET);
				groups.getContactList().put(user.getUserName(), user);
				this.sendGroups("欢迎"+ user.getNickName(), "00");
			}
		}
		return merchant;
	}
	
	private String processMsg(String content, TblLotteryMerchant merchant, String msgId) throws Exception {
		String retContent = "命令错误!\n"
				+ "00:游戏规则\n11:剩余积分\n22:上分方式";//
		if("00".equals(content)) {
			//发送图片消息  
			retContent = "public/" + this.lotteryType + "rule.jpg";
		} else if("11".equals(content)) {
			//发送图片消息
			retContent = "" + new BigDecimal(merchant.getAmt()).movePointLeft(2).doubleValue();
		} else if(content.matches(lotterReg)) {//彩票规则
			retContent = this.exeHasppyOrder(content, merchant.getMerid(), msgId);
		} else if("22".equals(content)) {
			retContent = "public/payWay.jpg";
		}
		return retContent;
	}
	private String exeHasppyOrder(String content, String merId, String msgId) throws Exception {
		//查询游戏是否进行中
		List<LotteryInfoVo> lotteryes = lotteryResultOperService.selectValidOrder(lotteryType);
		if(null == lotteryes || lotteryes.size() != 1) {
			return "已封盘";
		}
		LotteryInfoVo lottery = lotteryes.get(0);
		//查询商户积分 & 存在
		TblLotteryMerchant merchant = new TblLotteryMerchant();
		merchant.setMerid(merId);
		List<TblLotteryMerchant> mers = tblLotteryMerchantService.selectByMer(merchant);
		if(null != mers && !mers.isEmpty()) {
			TblLotteryMerchant thisMer = mers.get(0);
			try {
				List<TblLotteryOrder> lotteryOrders = lotteryAnalysiser.analysiser(content, lottery, thisMer);
				for(TblLotteryOrder lotteryOrder : lotteryOrders) {
					lotteryOrder.setMsgId(msgId);
					lotteryOrderService.insertOrder(lotteryOrder);
				}
				tblLotteryMerchantService.doUpdateMerAmt(thisMer);
			} catch(BaseException e) {
				return e.getMessage();
			}
			TblLotteryMerchant mer = tblLotteryMerchantService.selectByMerId(thisMer.getMerid());
			//显示时变小
			return "第" + lottery.getLotteryId() + "\n投注成功，剩余积\n分" + 
				new BigDecimal(mer.getAmt()).movePointLeft(2).doubleValue() + "";
		}
		return null;
	}
	public String processAddMsg(JSONObject msg) throws Exception {
		JSONObject recommendInfo = msg.getJSONObject("RecommendInfo");
		User newUser = new User();
		newUser.setUserName(recommendInfo.getString("UserName"));
		newUser.setNickName(recommendInfo.getString("NickName"));
		newUser.setAttrStatus(recommendInfo.getString("AttrStatus"));
		newUser.setSex((Integer)recommendInfo.get("Sex"));
		newUser.setSignature(recommendInfo.getString("Signature"));
		
		String userName = recommendInfo.getString("UserName");
		String ticKet = recommendInfo.getString("Ticket");
		RequestToWXUtil.userAdd(UIN, SID, SKEY, getEid(), userName, ticKet, wxHost,COOKIESET);//添加好友
		//创建商户
		this.createMerchant(newUser);
		//this.myFriends.put(userName, newUser);
		this.say("建号成功!\n00:游戏规则\n11:剩余积分\n22:上分方式", userName, "00");
		return "success";
	}
	
	public TblLotteryMerchant createLotterMer(User user) throws Exception {
		TblLotteryMerchant merchant = new TblLotteryMerchant();
		String seq = tblLotteryMerchantService.getMerSeq();
		if(null == seq || seq.isEmpty()) {
			seq = "1001";
		}
		user.setRemarkName(seq);
		//设置备注用户ID
		RequestToWXUtil.setRemarkName(PASSTICKET, UIN, SID, SKEY, getEid(), seq, user.getUserName(), wxHost,COOKIESET);
		//注册账号 
		merchant.setMerid(seq);
		merchant.setAmt(0L);
		merchant.setCreateChl("00");
		merchant.setCreateDate(DateUtils.getCurDateTime());
		merchant.setMername(user.getUserName());
		merchant.setStatus("00");
		merchant.setTelphone("");
		TblWebchantMerchant webchant = new TblWebchantMerchant();
		webchant.setMerid(seq);//关联关系
		webchant.setUin(String.valueOf(user.getUin()));
		webchant.setUsername(user.getUserName());
		webchant.setNickname(user.getNickName());
		webchant.setRemarkname(user.getRemarkName());
		webchant.setSex(String.valueOf(user.getSex()));
		webchant.setAttrstatus(user.getAttrStatus());
		webchantMerchantService.doInsertWebchant(webchant);
		
		tblLotteryMerchantService.insertMer(merchant);
		return merchant;
	}
	
	public boolean sendGroups(String msg, String type) throws Exception {
		SecCodeVo secvo = getSwitch();
		if(null != secvo) {
			User group = groups;
			if(null != group) {
				String userName = group.getUserName();
				this.say(msg, userName, type);
				return true;
			}
		}
		return false;
	}
	
	public SecCodeVo getSwitch() throws BaseException {
		List<SecCodeVo> list = commonService.findCodeByType("ROBOT_SWITCH");
		if(null != list && list.size() > 0 && "1".equals(list.get(0).getCodeName())) {
			//list.get(0).setReserved1("test");
			return list.get(0);
		}
		return null;
	}
	/**
	 * 初始化页面（获取朋友、群信息 非全）
	 * @param getJm
	 * @return
	 * @throws Exception
	 */
	public boolean initRobot(String getJm) throws Exception {
		//步骤4 通过返回的URI获取交互参数  后续交互需要使用
		getJm += "&fun=new";
		if(getJm.contains("https://wx.qq.com")) {
			wxHost = "https://wx.qq.com";
		}
		Map<String, String> paraMap = RequestToWXUtil.getChatParam(getJm, wxHost, COOKIESET);
		
		UIN = paraMap.get("wxuin");
		SID = paraMap.get("wxsid");
		SKEY = paraMap.get("skey");
		PASSTICKET = paraMap.get("pass_ticket");
//		DEVICEID = paraMap.get("estr");
		SecCodeVo secCodeVo = this.getSwitch();
		//步骤5 初始化
		Map initFriends = RequestToWXUtil.initWx(PASSTICKET, UIN, SID, SKEY, getEid(), wxHost, COOKIESET, secCodeVo.getReserved1());
		SYNCKEY = (String)initFriends.get("syncKey");
		SYNCKEYSTR = (String)initFriends.get("syncKeyStr");
		myUser = (User)initFriends.get("myUser");
		groups = (User) ((Map)initFriends.get("groups")).get(secCodeVo.getReserved1());
		//步骤6 发送信息看是否通
		String notifyMsg = RequestToWXUtil.status_notify(PASSTICKET, UIN, SID, SKEY, getEid(), myUser.getUserName(), wxHost, COOKIESET);
		Map<String,Map> contentFriends = RequestToWXUtil.getContent(PASSTICKET, UIN, SID, SKEY, getEid(), wxHost , COOKIESET);
		myFriends.putAll(contentFriends.get("friends"));
		return true;
	}
	
	@Override
	public void run() {
		try {
			while(this.robotSwitch) {
				try {
					//查看是否有通告信息
					happyNotityTask.wxNotity(lotteryType, this);
					//获取新消息，并处理
					snycWxCheck();
					//Thread.sleep(1000);
				} catch(Exception e) {
					System.out.println("LXL SAY Error:" + e.getMessage());
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void snycWxCheck() throws Exception {
		//查看同步状态
		String notify = RequestToWXUtil.snycWxCheck(UIN, SID, SKEY, getEid(), SYNCKEYSTR, wxHost, COOKIESET);
		System.out.println("snycWxCheck@@@@@@@@@@@@@@@@@" + SYNCKEY);
		if(null != notify && notify.length() > 0) {
			System.out.println(notify);
			String[] notifyStr = notify.split("=");
			if(notifyStr.length == 2) {//有新消息
				JSONObject jsonObject = JSONObject.fromObject(notifyStr[1]);
				String retcode = (String)jsonObject.get("retcode");
				String selector = (String)jsonObject.get("selector");
				if("0".equals(retcode) && !"0".equals(selector)) { //有消息
					this.processMsgManager(selector);
				}						
			}
		}
	}
	
	protected synchronized String say(String context, String userName, 
			String type) throws Exception {
		String path = retImgPath;
		if(this.robotSwitch) {
			if("00".equals(type)) {//文字
				path += "person" + this.getUuid();
				return RequestToWXUtil.sendTextImage(PASSTICKET, UIN, SID, SKEY, getEid(),  
						myUser.getUserName(), userName, context, path, wxHost, COOKIESET);
			} else if("01".equals(type)){//图片
				path += context;
				return RequestToWXUtil.sendImg(PASSTICKET, UIN, SID, SKEY, 
						getEid(), myUser.getUserName(), userName, path, wxHost, COOKIESET);
			}
		}
		return null;
	}
	
	public boolean destory() throws Exception {
		this.robotSwitch = false;
		//String str = RequestToWXUtil.getDestory(UIN, SID, SKEY, wxHost);
		return true;
	}
	
	public static void main(String[] args) {
//		String ss = "<error><ret>1203</ret><message>当前登录环境异常。为了你的帐号安全，暂时不能登录web微信。你可以通过Windows微信、Mac微信或者手机客户端微信登录。</message></error>";
//		System.out.println(ss.contains("<ret>1203</ret>"));
//		java.util.Random random=new java.util.Random();// 定义随机类
//		for(int i=0; i<10; i++) {
//			int result=random.nextInt(5);
//			System.out.println(result);
//		}
		System.out.println("总双".matches("^总[单双].*$"));
	}
	public void setOprId(String oprId) {
		this.oprId = oprId;
	}
}
