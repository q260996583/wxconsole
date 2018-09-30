package com.jiuyv.yl.console.lottery.batch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.jiuyv.yl.console.common.util.XmlUtil;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;

public class LotteryWebUtil {
	//快3 结果集
	public static final String FASTT_3_RESULT_URL = "http://www.gxcaipiao.com.cn/xml/award_18.xml";
	//快3开奖信息
	public static final String FASTT_3_RUNINFO_URL = "http://www.gxcaipiao.com.cn/xml/Period_18.xml";
	//快10结果集
	public static final String FASTT_10_RESULT_URL = "http://www.gxcaipiao.com.cn/xml/award_09.xml";
	//快10开奖信息
	public static final String FASTT_10_RUNINFO_URL = "http://www.gxcaipiao.com.cn/xml/Period_09.xml";
	
	public static void main(String[] args) throws Exception {
//	   String result = LotteryWebUtil.getLotteryInfo(LotteryWebUtil.FASTT_10_RESULT_URL);
//       Document resultDoc = XmlUtil.getDocumentByStr(result);
//       Element root = resultDoc.getRootElement();
//       System.out.println(root.asXML());
//       List<Element> tickets = root.elements("p");
//       for(Element ticket : tickets) {
//    	   System.out.print(ticket.attributeValue("id")+"  ");
//    	   //System.out.print(ticket.attributeValue("s")+"  ");
//    	   //System.out.println(ticket.attributeValue("e"));
//    	   System.out.print(ticket.attributeValue("c")+"  ");
//    	   System.out.println(ticket.attributeValue("t"));
//       }
//		String time = "2017-10-21 14:15:00";
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date date = sdf.parse(time);
//		 Date afterDate = new Date(date.getTime() - 90000);
//		 System.out.println(sdf.format(afterDate));
		System.out.println( (new Date()).getTime());
	}
	
	public static List<LotteryInfoVo> getLotteryInfoVos(String url) throws Exception {
		List<LotteryInfoVo> lotteryList = new ArrayList<LotteryInfoVo>();
		String result = LotteryWebUtil
				.getLotteryInfo(url);
		Document resultDoc = XmlUtil.getDocumentByStr(result);
		Element root = resultDoc.getRootElement();
		System.out.println(root.asXML());
		List<Element> tickets = root.elements("p");
		for (Element ticket : tickets) {
			LotteryInfoVo vo = new LotteryInfoVo();
			vo.setLotteryId(ticket.attributeValue("id"));
			if(null != ticket.attributeValue("s") && 
					!ticket.attributeValue("s").isEmpty()) {
				vo.setStartTime(minusNm(ticket.attributeValue("s"), 70000));
			}
			if(null != ticket.attributeValue("e") && 
					!ticket.attributeValue("e").isEmpty()) {
				vo.setFinishTime(minusNm(ticket.attributeValue("e"), 35000));
			}
			vo.setLotteryResult(ticket.attributeValue("c"));
			vo.setRunTime(ticket.attributeValue("t"));
			lotteryList.add(vo);
		}
		return lotteryList;
	}
	
	public static String minusNm(String time, int ms) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse(time);
		Date afterDate = new Date(date.getTime() - ms);//向前70秒
		return sdf.format(afterDate);
	}
	public static String getLotteryInfo(String url) {
		String qryUrl = url + "?timestamp=" + (new Date()).getTime();
		return LotteryWebUtil.sendPost(qryUrl);
	}
	
	public static String sendPost(String url) {
		OutputStreamWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("Accept", "text/xml");
			//conn.setRequestProperty("Accept-Encoding", "gzip, deflate");
			conn.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8");
			conn.setRequestProperty("Connection", "keep-alive");
			conn.setRequestProperty("Upgrade-Insecure-Requests", "1");
			conn.setRequestProperty("Host", "www.gxcaipiao.com.cn");
			conn.setRequestProperty("Referer", "http://www.gxcaipiao.com.cn/");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
			conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送 POST 请求出现异常！" + e);
			e.printStackTrace();
		}
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
}
