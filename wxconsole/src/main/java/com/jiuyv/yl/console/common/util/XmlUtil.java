package com.jiuyv.yl.console.common.util;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class XmlUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(XmlUtil.class);
	
	public static  Element getElement(String xml,String id){
		SAXReader reader = new SAXReader(); 
		 Document doc;		
		try {
			doc = reader.read(XmlUtil.class.getClassLoader().getResourceAsStream(xml));
			 Element element= doc.elementByID(id);		
				return element;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}		
		
	}
	
	
	
	public static  Document getDocument(String xml){
		SAXReader reader = new SAXReader(); 
		 Document doc;		
		try {
			doc = reader.read(XmlUtil.class.getClassLoader().getResourceAsStream(xml));
			return doc;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}		
		
	}
	
	public static  Document getDocumentByStr(String xml) throws UnsupportedEncodingException{
		SAXReader reader = new SAXReader(); 
		Document document;		
		try {
			document = reader.read(new ByteArrayInputStream(xml.getBytes("GBK")));
			return document;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}		
		
	}
}
