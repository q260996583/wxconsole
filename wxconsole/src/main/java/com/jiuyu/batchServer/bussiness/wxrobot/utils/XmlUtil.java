package com.jiuyu.batchServer.bussiness.wxrobot.utils;

import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class XmlUtil {

	
	public static  Element getElement(String xml,String id) throws DocumentException{
		SAXReader reader = new SAXReader(); 
		 Document doc;		
		try {
			doc = reader.read(XmlUtil.class.getClassLoader().getResourceAsStream(xml));
			 Element element= doc.elementByID(id);		
				return element;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			throw e;
		}		
		
	}
	
	
	
	public static  Document getDocument(String xml) throws DocumentException{
		SAXReader reader = new SAXReader(); 
		 Document doc;		
		try {
			doc = reader.read(XmlUtil.class.getClassLoader().getResourceAsStream(xml));
			return doc;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			throw e;
		}		
		
	}
	
	public static void main(String[] args) throws Exception {
//		String en = URLDecoder.decode("jgERJkwifVaKIYfhkNFME3QUL0MCJcn%2FrBTmJphZ0pGcVFF4B6NzKQWVH9g0b6wt", "UTF-8");
//		System.out.println(en);
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
//		java.util.Calendar Cal=java.util.Calendar.getInstance();
//		Date date = formatter.parse("2017-10-13 09:27:00");
//		Cal.setTime(date);    
//		for(int i=0; i<78; i++) {
//			Cal.add(java.util.Calendar.MINUTE,10);
//			System.out.println((i+1) + "  "+formatter.format(Cal.getTime()));  
//		}
//		Date date2 = formatter.parse("2017-01-01 08:55:00");
//		Cal.setTime(date2);
//		Cal.add(java.util.Calendar.DATE,279);
//		System.out.println(formatter.format(Cal.getTime()));  
	}



	public static String getEleByStr(String xml, String id) throws Exception {
		SAXReader reader = new SAXReader(); 
		 Document doc;		
		try {
			doc = reader.read(new ByteArrayInputStream(xml.getBytes("utf-8")));
			Element ele =  doc.getRootElement().element(id);
			if(null != ele) return ele.getText();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			throw e;
		}		
		return null;
	}
}
