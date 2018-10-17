package com.jiuyv.yl.console.lottery.batch;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyu.batchServer.bussiness.wxrobot.action.ChatRobotAction;
import com.jiuyu.batchServer.bussiness.wxrobot.action.RobotManagerAction;

public class NotifyRobot {
	private static Logger LOGGER = LoggerFactory.getLogger(HappyNotityTask.class);
	private static final String UP_KEY = "NOTIFY_MSG";
	private static final String TEST_DATE = "2018-12-22 08:08:08";
	//开奖信息
    public void nofity() throws Exception{
    	if(!RobotManagerAction.getRobots().isEmpty()) {
    		Map<String, ChatRobotAction> robots = RobotManagerAction.getRobots();
    		Iterator<String> iterator = robots.keySet().iterator();
    		while(iterator.hasNext()) {
    			String key = iterator.next();
    			ChatRobotAction robot = robots.get(key);
    			Random rd = new Random();
    			List msgList = NotifyMessage.getMessage();
    			int a = rd.nextInt(msgList.size())+1;
    			String sendMsg = (String)msgList.get(a);
    			if(null == sendMsg) {
    				sendMsg = "";
    			}
    			sendMsg += "#######################" + getTestDateNotifyMsg();
    			robot.sendGroups(sendMsg, "-1");
    			msgList.remove(a);
    		}
    	}
    }
    
    public String getTestDateNotifyMsg() throws ParseException {
    	//将字符串转为日期
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	java.util.Date date = sdf.parse(TEST_DATE);
    	long s1 = date.getTime();//将时间转为毫秒
    	long s2 = System.currentTimeMillis();//得到当前的毫秒
    	long day = (s1-s2)/1000/60/60/24;
    	return "同学们！距考研还有" + day + "天！！！！";
    }
    public static void main(String[] args) throws ParseException, UnsupportedEncodingException {
//    	NotifyRobot rt = new NotifyRobot();
//    	System.out.println(rt.getTestDateNotifyMsg());
    	String json = "同学们！距考研" + 66 + "还有天！！！！";
    	System.out.println(Utf2Gbk.GBK2Unicode(json));
	}
}
