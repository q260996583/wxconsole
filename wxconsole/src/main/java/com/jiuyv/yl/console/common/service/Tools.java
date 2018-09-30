package com.jiuyv.yl.console.common.service;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Tools {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Tools.class);
	
	public static long getTime(int i) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, i);
		return cal.getTimeInMillis();
	}

	public static String formatDate(int type) {
		return formatDateTime(System.currentTimeMillis(), type);
	}

	public static String formatDate(long time) {
		return formatDateTime(time, 0);
	}

	public static String formatDate14(long time) {
		return formatDateTime(time, 99);
	}

	public static String formatDate(java.util.Date time) {
		long value = (time == null) ? 0 : time.getTime();
		return formatDateTime(value, 0);
	}

	public static String formatTimestamp() {
		return formatDateTime(System.currentTimeMillis(), 2);
	}

	public static String formatTimestamp(long time) {
		return formatDateTime(time, 2);
	}

	public static String formatTimestamp(java.util.Date time) {
		long value = (time == null) ? 0 : time.getTime();
		return formatDateTime(value, 2);
	}

	public static String formatTimestamp(java.util.Date time, int type) {
		long value = (time == null) ? 0 : time.getTime();
		return formatDateTime(value, type);
	}

	public static int stringToInt(String value) {
		return stringToInt(value, 0);
	}

	public static int stringToInt(String value, int defaultValue) {
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public static long stringToLong(String value) {
		return stringToLong(value, 0);
	}

	public static long stringToLong(String value, int defaultValue) {
		try {
			return Long.parseLong(value);
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public static String formatCurrency(int value) {
		DecimalFormat df = new DecimalFormat("#,##0.00");
		return df.format(value / 100.0);
	}

	public static String formatDateTime(long time, int type) {
		SimpleDateFormat df;
		switch (type) {
		case 0:
			df = new SimpleDateFormat("yyyyMMdd");
			break;
		case 1:
			df = new SimpleDateFormat("HHmmss");
			break;
		case 2:
			df = new SimpleDateFormat("yyyy-MM-dd");
			break;
		case 3:
			df = new SimpleDateFormat("yyyy-MM");
			break;
		case 4:
			df = new SimpleDateFormat("yyyyMMddHHmm");
			break;
		case 5:
			df = new SimpleDateFormat("ddMMyy");
			break;
		case 6:
			df = new SimpleDateFormat("yyMMdd");
			break;
		default:
			df = new SimpleDateFormat("yyyyMMddHHmmss");
			break;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(time);
		return df.format(cal.getTime());
	}

	public static String nullToString(String value) {
		return value == null ? "" : value;
	}

	public static byte[] hex2Byte(String str) {
		if (str == null || str.length() == 0)
			return new byte[0];
		int len = str.length() / 2;
		byte[] tmp = new byte[len];
		for (int i = 0; i < len; i++) {
			try {
				tmp[i] = (byte) (Integer.parseInt(str.substring(2 * i,
						2 * i + 2), 16) & 0XFF);
			} catch (Exception e) {
			}
		}

		return tmp;
	}

	public static String byte2Hex(byte b[]) {
		if (b == null)
			return "";
		StringBuffer tmp = new StringBuffer();
		int len = b.length;
		for (int i = 0; i < len; i++) {
			String s = Integer.toHexString(b[i] & 0XFF);
			if (s.length() < 2)
				tmp.append('0');
			tmp.append(s);
		}

		return new String(tmp).toUpperCase();
	}

	public static String ascii2String(byte[] byteValues) {

		char toChar;
		StringBuffer temp = new StringBuffer();
		for (byte b : byteValues) {
			toChar = (char) b;
			temp.append(toChar);
		}
		return temp.toString();
	}

	public static String maskAccount(String accountNo) {
		if (accountNo == null || accountNo.length() <= 5)
			return "*****";
		else
			return accountNo.substring(0, accountNo.length() - 6) + "*****"
					+ accountNo.substring(accountNo.length() - 1);
	}

	public static String formatTrandate(String timestamp) {
		if (timestamp == null || timestamp.length() < 8)
			return "";
		else
			return timestamp.substring(0, 4) + "��" + timestamp.substring(4, 6)
					+ "��" + timestamp.substring(6, 8) + "��";
	}

	/**
	 * timestamp -> *��*��*��*ʱ*��*��
	 * 
	 * @param timestamp
	 * @return
	 */
	public static String formatTrandate142(String timestamp) {
		if (timestamp == null || timestamp.length() < 14)
			return "";
		else
			return timestamp.substring(0, 4) + "��" + timestamp.substring(4, 6)
					+ "��" + timestamp.substring(6, 8) + "��"
					+ timestamp.substring(8, 10) + "ʱ"
					+ timestamp.substring(10, 12) + "��"
					+ timestamp.substring(12, 14) + "��";
	}

	public static String formatTrandate14(String timestamp) {
		if (timestamp == null || timestamp.length() < 14)
			return "";
		else
			return timestamp.substring(0, 4) + "-" + timestamp.substring(4, 6)
					+ "-" + timestamp.substring(6, 8) + " "
					+ timestamp.substring(8, 10) + ":"
					+ timestamp.substring(10, 12) + ":"
					+ timestamp.substring(12, 14);
	}

	public static String formatMonth(String timestamp) {
		if (timestamp.length() != 6)
			return "";
		else
			return timestamp.substring(0, 4) + "��" + timestamp.substring(4, 6)
					+ "��";
	}

	public static String formatTrantime(String timestamp) {
		if (timestamp.equals("") || timestamp.length() < 14)
			return "";
		else
			return timestamp.substring(8, 10) + ":"
					+ timestamp.substring(10, 12) + ":"
					+ timestamp.substring(12, 14);
	}

	public static Date stringToDate(String timestamp) {
		//DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Date date = null;

		try {
			date = format1.parse(timestamp);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		return date;
	}

	public static Date stringToDateSec(String timestamp) {
		DateFormat format1 = new SimpleDateFormat("yyyy��MM��dd�� HHʱmm��ss��");
		Date date = null;

		try {
			date = format1.parse(timestamp);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		return date;
	}
	
	/**
	 * 返回给定日期的下一天
	 */
	public static String returnDateToNextDay(String dateBefore){
		GregorianCalendar gc = ( GregorianCalendar ) Calendar.getInstance();
		gc.setTime(Tools.stringToDate(dateBefore));
		gc.add( Calendar.DATE, 1 );
		return formatTimestamp(gc.getTime(),0);
	}
	
	/**
	 * yyyyMMddHHmmss to date
	 * 
	 * @param timestamp
	 * @return
	 */
	public static Date string14ToDateSec(String timestamp) {
		DateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = null;

		try {
			date = format1.parse(timestamp);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			date = new Date(0);
		}
		return date;
	}
	
	public static String defaultBillMonth(int day) {
		Calendar cal = Calendar.getInstance();
		if (cal.get(Calendar.DATE) < day)
			cal.add(Calendar.MONTH, -1);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMM");

		return df.format(cal.getTime());
	}

	public static String paddingStringLeft(String s, int width, char ch) {
		if (s == null)
			s = "";
		for (int i = s.length(); i < width; i++)
			s = ch + s;

		return s;
	}

	public static String paddingStringRight(String s, int width, char ch) {
		StringBuffer temps = new StringBuffer();
		if (s == null) {
			temps.append("");
		} else {
			for (int i = s.length(); i < width; i++)
				temps.append(ch);
		}
		return temps.toString();
	}

	public static String getconvertStr(String convertStr, int len) {
		String resutlStr = "";
		StringBuffer zeroStr = new StringBuffer("");

		if (convertStr.length() < len) {
			for (int i = 0; i < len - convertStr.length(); i++) {
				zeroStr.append(" ");
			}
			resutlStr = convertStr + zeroStr.toString();
		} else {
			return convertStr.substring(0, len);
		}
		return resutlStr;
	}

	public static String forwardString(String server, String s) {
		if (s == null)
			return "";
		else if (!"tomcat".equalsIgnoreCase(server))
			return s;
		else {
			try {
				return new String(s.getBytes(), "ISO-8859-1");
			} catch (Exception e) {
				return s;
			}
		}
	}

	public static String forwardStr(String s) {
		if (s == null)
			return "";
		else {
			try {
				return new String(s.getBytes("ISO8859_1"));
			} catch (Exception e) {
				return s;
			}
		}
	}

	public static String getWeekOfDate(Date dt) {
		String[] weekDays = { "0", "1", "2", "3", "4", "5", "6" };
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);

		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;

		return weekDays[w];
	}

	public String getDate(Date inputDate) {
		// 接收输入的日期inputDate
		SimpleDateFormat f2 = null;
		Calendar nextDate = Calendar.getInstance();
		nextDate.add(Calendar.DAY_OF_MONTH, 1);
		nextDate.getTime(); // 下一天
		f2 = new SimpleDateFormat("yyyyMMdd");
		String gRtnStr = f2.format(nextDate); // 把日期格式化
		return gRtnStr;
	}

	/*public static void export2Txt(List sourceList) {

		Iterator it = sourceList.iterator();

		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.reset();
		resp.setContentType("application/octet-stream;charset=UTF-8");
		resp.addHeader("Content-disposition", "attachment,filename=MyWord.txt");
		StringBuffer sb = new StringBuffer();
		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw = resp.getWriter();
			while (it.hasNext()) {
				Student c = (Student) it.next();
				sb.append(c.getId()).append("\t\t").append(c.getUsername())
						.append("\t\t").append(c.getAddress()).append("\r\n");
			}
			pw.print(sb.toString());
			

		} catch (Exception e) {
			LOGGER.error("", e);
		}finally{
			pw.flush();
			pw.close();
		}
	}*/

	public static String getCheckBit(String str){
		int[] temp = new int[str.length()];
		int sum = 0;
		for(int i =0;i<temp.length;i++){					
			temp[temp.length-(i+1)]= Integer.parseInt(str.substring(temp.length-(i+1),temp.length-i));
			if(i%2==0){
				sum += temp[temp.length-(i+1)]*2;
//				System.out.println("=============="+temp[temp.length-(i+1)]);
			}else{
				sum += temp[temp.length-(i+1)];
//				System.out.println("&&&&&&&&&&&&&&&&"+temp[temp.length-(i+1)]);
			}
		}
//		System.out.println("-----------"+sum);
		return Integer.toString(sum%10);
	}
		
	 /**
	  *  输入年月获得输入月的最后一天
	  */
	 public static int getLastDayOfMonth(int startYear,int month){
		 Calendar   c   =   Calendar.getInstance();   
		  c.set(c.YEAR,startYear);   
		  c.set(c.MONTH,month-1);
		  return c.getActualMaximum(c.DAY_OF_MONTH);   
	}

	public static void main(String[] args) {
		//Tools t = new Tools();
		/*java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		Date date = new Date();
		calendar.setTime(Tools.stringToDate("2009-12-31"));
		calendar.roll(java.util.Calendar.DAY_OF_YEAR,1);
		System.out.println("明天："+df.format(calendar.getTime()));
		Calendar nextDate = Calendar.getInstance();*/
//		Date date = new Date();
//		
//		System.out.println(Tools.formatDate(date.getTime()));
//		String str = "82062005000000009";
//		System.out.println(str.length());
		
		//String str ="925463897654231254";
		//String res = getCheckBit(str);
		//System.out.println("============"+Tools.formatDate(new Date().getTime()));
		
		//String string = "ssssss";
		
		//if(string.length()%8 != 0){
		//	System.out.println();
		//}
		 
		 
		 System.out.println(Tools.formatDate(new Date().getTime()));
			
		
	}
}
