package com.jiuyv.common.util;

import java.math.BigDecimal;

public class CommUtils {
	/**
	 * 将""或者" "字符串转换成null
	 * 
	 * @param str  转换前的字符串
	 * @return转换后的值
	 */ 
	public static final String spaceToNull(String str){
		String result = null;
		if (str != null && !str.trim().equals("")){
			 result = str.trim();
		 }
		 return result;
	 }
	
	/**
	 * 将null字符串转换成""
	 * 
	 * @param str  转换前的字符串
	 * @return转换后的值
	 */ 
	public static final String nullToSpace(String str){
		String result = "";
		 if (str != null && !str.trim().equals("")){
			 result = str.trim();
		 }
		 return result;
	 }
	
	public static String ConvertYuan2Fen(String yuan_amt_str) {
	    try {
	      //BigDecimal必须要用String构造
	      BigDecimal yuan_amt = new BigDecimal(yuan_amt_str);
	      BigDecimal fen_amt = yuan_amt.multiply(new BigDecimal("100")).setScale(0,
	          BigDecimal.ROUND_HALF_UP);
	      return fen_amt.toString();
	    }
	    catch (Exception ex) {
	      return "";
	    }
	  }
	
	  public static String ConvertFen2Yuan(String fen_amt_str) {
		    try {
		    	if(fen_amt_str != null){
		    		BigDecimal fen_amt = new BigDecimal(fen_amt_str);
		    		BigDecimal yuan_amt = fen_amt.divide(new BigDecimal("100"), 2,
		                                           BigDecimal.ROUND_HALF_UP);
		    		return yuan_amt.toString();
		    	}
		    	else return "";
		    }
		    catch (Exception ex) {
		      return "";
		    }
		  }
	  
	  /**
		 * 返回指定長度的字符串，長度不夠，右邊以空格補齊
		 * @param str
		 * @param length
		 * @return
		 */
		public static String formatString(String str, int length) {
			if (str.length() > length) {
				return "数据长度超长";
			} else {
				StringBuffer temp = new StringBuffer();
				temp.append(str);
				if (str.length() < length) {
					int backNum = length - str.length();
					for (int i = 0; i < backNum; i++) {
						temp.append(" ");
					}
				}
				return temp.toString();
			}
		}
		
		/**
		 * 长度不够，左边补零，否则截取右6位
		 * @param str
		 * @param length
		 * @return
		 */
		public static String formatString2(String str, int length) {
			StringBuffer temp = new StringBuffer();
			temp.append(str);
			if (str.length() < length) {
				int backNum = length-str.length() ;
				for (int i = 0; i < backNum; i++) {
					temp.insert(0, "0");
				}
				return temp.toString();
			} else {
				return temp.substring(temp.length()-6);
			}
		}
		/**
		 * 对退款金额的补位操作
		 * @param str
		 * @param length
		 * @return
		 */
		public static String formatMoneyString(String str, int length) {
			StringBuffer temp = new StringBuffer();
			temp.append(str);
			if (str.length() < length) {
				int backNum = length-str.length() ;
				for (int i = 0; i < backNum; i++) {
					temp.insert(0, " ");
				}
			} 
			return temp.toString();
		}
		
		public static byte[] xor(byte[] ba1,byte[] ba2){
			byte[] ba3=new byte[ba1.length];
			for (int i = 0; i < ba3.length; i++) {
				ba3[i]=(byte)(ba1[i]^ba2[i]);
			}
			return ba3;
		}
}