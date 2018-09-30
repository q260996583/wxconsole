package com.jiuyv.yl.console.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>
 * <strong> Description:</strong>该类定义了一些公用的方法
 * </p>
 * <p>
 * <strong> Copyright: </strong>Copyright (c) 2009
 * </p>
 * <p>
 * <strong> Company: </strong>
 * </p>
 * 
 *
 * @author 王明勇
 * @version 1.0
 * 
 */

public class CommonFunction {

	private static Logger LOGGER = LoggerFactory
			.getLogger(CommonFunction.class);

	private static final String DATE_FMT = "yyyyMMdd";

	private static final String DATE_SHOW_FMT1 = "yyyy-MM-dd";

	private static final String TIME6_FMT = "HHmmss";

	private static final String TIME14_FMT = "yyyyMMddHHmmss";

	private static final String TIME8_FMT = "HH:mm:ss";

	private CommonFunction() {

	}

	/**
	 * 检查是否是数字
	 * 
	 * @param Value
	 * @return
	 */
	public static boolean isNumeric(String Value) {
		String tmpValue = Value.trim();
		int i = 0, PointCount = 0;
		char OneByte = tmpValue.charAt(0);
		if (OneByte == '-') {
			i = 1;
		}
		for (; i < tmpValue.length(); i++) {
			if (OneByte == '.') {
				PointCount = PointCount + 1;
				if (PointCount > 1) {
					return false;
				}
			} else if ((OneByte > '9' || OneByte < '0')) {
				return false;
			}
		}
		return true;

	}

	/**
	 * 截取汉字字符
	 * 
	 * @param string
	 * @param beginidx
	 * @param length
	 * @return
	 */
	public static String subCHAString(String string, int beginidx, int length)
			throws Exception {
		String value = null;
		String tmpString = string.substring(beginidx);
		try {
			value = subCHAString(tmpString, length);
		} catch (Exception ex) {
			throw ex;
		}
		return value;

	}

	/**
	 * 转换数字格式
	 * 
	 * @param i
	 * @param format
	 * @return
	 */
	public static String NumberFormatA(double i, String format) {

		DecimalFormat formatter = new DecimalFormat(format);

		return formatter.format(i);

	}

	/**
	 * 填充字符串
	 * 
	 * @param string
	 * @param filler
	 * @param totalLength
	 * @return
	 */
	public static String fillString(String string, char filler,
			int totalLength,

			boolean atEnd)

	{

		byte[] tempbyte = string.getBytes();

		int currentLength = tempbyte.length;

		int delta = totalLength - currentLength;

		for (int i = 0; i < delta; i++) {
			if (atEnd) {
				string += filler;
			} else {
				string = filler + string;
			}
		}
		return string;
	}

	/**
	 * 得到系统日期
	 * 
	 * @param format
	 * @return
	 */
	public static String getCurrDate(String format) {
		SimpleDateFormat formater = new SimpleDateFormat(format);
		return formater.format(new Date());
	}

	/**
	 * 得到特定格式日期
	 * 
	 * @param format
	 * @return
	 */
	public static String getSpecifDate(String format, Date date) {
		SimpleDateFormat formater = new SimpleDateFormat(format);
		return formater.format(date);
	}

	/**
	 * 得到系统日期
	 * 
	 * @return
	 */
	public static String getCurrDate() {
		String currentDate = null;
		/* 使用webserver机器时间 */
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
		currentDate = formater.format(new Date());
		return currentDate;
	}

	/**
	 * 得到系统时间
	 * 
	 * @param currentDate
	 * @param formater
	 * @return
	 */
	public static String getCurrTime() {
		String currentDate = null;
		/* 使用webserver机器时间 */
		SimpleDateFormat formater = new SimpleDateFormat("HHmmss");
		currentDate = formater.format(new Date());
		return currentDate;
	}

	/**
	 * 截取汉字字符
	 * 
	 * @param string
	 * @param length
	 * @return
	 */
	public static String subCHAString(String string, int length) throws

	Exception {

		String tmpValue = null, value = null;

		value = "";

		int tmpSize = 0, Index = 0;

		while (tmpSize < length) {

			if (string.length() - Index <= 0) {

				throw new Exception("字符串长度溢出.");

			}

			tmpValue = string.substring(Index, Index + 1);

			tmpSize = tmpSize + tmpValue.getBytes().length;

			Index = Index + 1;

			value = value + tmpValue;

		}

		return value;

	}

	/**
	 * 代码转换
	 * 
	 * @param string
	 * @return
	 */
	public static String getCHAString(String string) throws Exception {

		String ret = string;
		try {
			ret = new String(string.getBytes("ISO-8859-1"), "GB2312");
		} catch (Exception ex) {
			throw new Exception("不能支持此编码.");
		}
		return ret;
	}

	/**
	 * 判断字符串是否有效
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isValidAmt(String str) {

		int i = 0;

		int j = str.length();

		char ch;

		for (i = 0; i < j; i++) {

			ch = str.charAt(i);

			if (!((ch == '.') || ((ch >= '0') && (ch <= '9')))) {

				return false;

			}

		}

		return true;

	}

	/**
	 * 
	 * 截取oracle的系统时间 表现：28-5-09
	 */
	public static String getOracleTm(String rctTm) {

		String temp = rctTm.substring(0, 10);

		StringBuffer sb = new StringBuffer();

		char[] ch = temp.toCharArray();
		for (int i = 0; i < ch.length; i++) {
			if (ch[i] == '月' || ch[i] == ' ') {

			} else {
				sb.append(ch[i]);
			}
		}

		return sb.toString();
	}

	/**
	 * 判断交易金额格式
	 * 
	 * @param i
	 * @return
	 */
	public static String TxnAtFormat(String i) throws Exception {
		if (!isValidAmt(i))
			throw new Exception("金额格式不符");
		return TxnAtFormat(i, "################");
	}

	/**
	 * 判断交易金额格式
	 * 
	 * @param i
	 * @param format
	 * @return
	 */
	public static String TxnAtFormat(String i, String format) throws Exception {

		DecimalFormat formatter = new DecimalFormat(format);
		long j;
		int index = i.indexOf(".");
		if (index == 0)
			throw new Exception("错误的格式，小数点不能在第一位:" + i);
		if (index == -1) {
			// -1 表示金额是整数，在金额*100
			j = Integer.parseInt(i) * 100;
		} else {
			long ii = Integer.parseInt(i.substring(0, index)) * 100;
			int x = 1;
			if (i.length() - index == 2)
				x = 10;
			long jj = Integer.parseInt(i.substring(index + 1)) * x;
			// 小数点后面有超过两位
			if (i.substring(index + 1).length() > 2)
				throw new Exception("金额不合法");
			j = ii + jj;
		}

		return formatter.format(j);

	}

	/**
	 * 判断交易金额格式
	 * 
	 * @param i
	 * @param format
	 * @return
	 */
	public static String TxnAtFormat(double i, String format) {

		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.format(i);

	}

	/**
	 * 
	 * 
	 * @param Number
	 * @param decimal
	 * @return
	 */
	public static String ParseDecNumner(String Number, int decimal) {
		String value = null;
		int divid = 1;
		if (decimal > 0) {
			for (int i = 0; i < decimal; i++) {
				divid = divid * 10;
			}
			value = String.valueOf(Float.parseFloat(Number) / (divid * 1.0));
			int pos = value.indexOf(".") + 1;
			pos = value.length() - pos;
			if (pos < decimal) {
				for (int i = pos; i < decimal; i++) {
					value = value + "0";
				}
			} else if (pos > decimal) {
				value = value.substring(0, value.length() - pos + decimal);
			}
		} else {
			value = Number;
		}
		return value;
	}

	/**
	 * 检查日期的有效性
	 * 
	 * @param format
	 *            日期格式
	 * @param date
	 *            日期
	 * @return
	 */
	public static boolean checkDt(String format, String date) {
		try {
			SimpleDateFormat dFormat = new SimpleDateFormat(format);
			dFormat.setLenient(false);
			dFormat.parse(date);
			return true;
		} catch (Exception ex) {
		}
		return false;
	}

	/**
	 * 创建目录
	 * 
	 * @param dirPath
	 * @return
	 */
	public static String createDirectory(String dirPath) throws Exception {
		File file = new File(dirPath);
		if (file.exists()) {
			return dirPath + File.separator;
		}
		try {
			file.mkdirs();
		} catch (SecurityException ex) {
			throw new Exception("创建路径出错");
		}
		return dirPath + File.separator;
	}

	/**
	 * 比较日期
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws Exception
	 */
	public static boolean comparaDate(String before_date, String after_date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			Date Date1 = dateFormat.parse(before_date);
			Date Date2 = dateFormat.parse(after_date);
			return Date1.before(Date2);
		} catch (Exception ex) {
			return false;
		}
	}

	/**
	 * 比较日期
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws Exception
	 */
	public static boolean comparaDateAfter(String before_date, String after_date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			Date Date1 = dateFormat.parse(before_date);
			Date Date2 = dateFormat.parse(after_date);
			return Date1.after(Date2);
		} catch (Exception ex) {
			return false;
		}
	}

	/**
	 * 取得本地日期
	 * 
	 * @return
	 */
	public static String getLocalDate() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(cal.getTime());
	}

	/**
	 * 取得本地时间
	 * 
	 * @return
	 */
	public static String getLocalTime8() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat time8fmt = new SimpleDateFormat(TIME8_FMT);
		return time8fmt.format(cal.getTime());
	}

	public static String getLocalTime6() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat time6fmt = new SimpleDateFormat(TIME6_FMT);
		return time6fmt.format(cal.getTime());
	}

	public static String getLocalTime14() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat time14fmt = new SimpleDateFormat(TIME14_FMT);
		return time14fmt.format(cal.getTime());
	}

	/**
	 * 设置日期
	 * 
	 * @param date
	 * @return
	 */
	public static String fmtDate(Date date) {
		SimpleDateFormat dateShowFmt1 = new SimpleDateFormat(DATE_SHOW_FMT1);
		return dateShowFmt1.format(date);
	}

	/**
	 * 
	 * 设置时间
	 * 
	 * 
	 */
	public static String formatDate(Date date) {
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(date);

	}

	/**
	 * 金额格式化
	 * 
	 * @param amt
	 * @return
	 */
	public static String getStdFormatAmt(String amt) {
		if (amt == null)
			return "";
		if (amt.length() == 1)
			return "0.0" + amt;
		if (amt.length() == 2)
			return "0." + amt;
		if (amt.length() > 2)
			return transAmtString(amt.substring(0, amt.length() - 2)) + "."
					+ amt.substring(amt.length() - 2);
		return "";
	}

	private static String transAmtStringNoComma(String str) {
		if (str == null)
			return "";
		StringBuffer strb = new StringBuffer(str);
		strb = strb.reverse();
		StringBuffer strr = new StringBuffer();
		for (int i = 0; i < strb.length(); i++) {
			strr.append(strb.charAt(i));
			if (i > 1 && i != strb.length() - 1 && i % 3 == 2)
				;
			// strr.append(',');
		}
		strr = strr.reverse();
		return strr.toString();
	}

	private static String transAmtString(String str) {
		if (str == null)
			return "";
		StringBuffer strb = new StringBuffer(str);
		strb = strb.reverse();
		StringBuffer strr = new StringBuffer();
		for (int i = 0; i < strb.length(); i++) {
			strr.append(strb.charAt(i));
			if (i > 1 && i != strb.length() - 1 && i % 3 == 2)
				strr.append(',');
		}
		strr = strr.reverse();
		return strr.toString();
	}

	/**
	 * 金额格式化，不带逗号
	 * 
	 * @param amt
	 * @return
	 */
	public static String getStdFormatAmtSimple(String amt) {
		if (amt == null)
			return "";
		if (amt.length() == 1)
			return "0.0" + amt;
		if (amt.length() == 2)
			return "0." + amt;
		if (amt.length() > 2)
			return transAmtStringSimple(amt.substring(0, amt.length() - 2))
					+ "." + amt.substring(amt.length() - 2);
		return "";
	}

	private static String transAmtStringSimple(String str) {
		if (str == null)
			return "";
		StringBuffer strb = new StringBuffer(str);
		strb = strb.reverse();
		StringBuffer strr = new StringBuffer();
		for (int i = 0; i < strb.length(); i++) {
			strr.append(strb.charAt(i));
		}
		strr = strr.reverse();
		return strr.toString();
	}

	/**
	 * 金额转换，flag如果是0，元转为分；flag如果是1，分转为元；
	 * 
	 * @param flag
	 *            ,txnAt
	 * @return
	 */
	public static String transTxnAt(int flag, String txnAt) {

		if (txnAt == null || txnAt.equals(""))
			return txnAt;

		BigDecimal tmpTxnAt = new BigDecimal(txnAt);
		// long longTxnAt = Long.parseLong(String.valueOf(tmpTxnAt));
		String objTxnAt = null;
		if (flag == 0) {

			tmpTxnAt = tmpTxnAt.multiply(new BigDecimal(100));

			objTxnAt = String.valueOf(tmpTxnAt.longValue());
		} else
			objTxnAt = ParseDecNumner(txnAt, 2);
		return objTxnAt;

	}

	/**
	 * 金额倍率转化
	 * 
	 * 字符串型转化为BigDecimal型
	 * 
	 * @param multiple
	 *            转化倍率
	 * @return amtLong BigDecimal型数据
	 */
	public static BigDecimal tranStringAmtToBigDecimal(int multiple, String amt) {
		double doubl = Double.parseDouble(amt);
		doubl = doubl * multiple;
		BigDecimal amtLong = new BigDecimal(Double.toString(doubl));
		return amtLong;
	}

	/**
	 * 从数据库转化金额倍率
	 * 
	 * @param multiple
	 * @param amt
	 * @return
	 */
	public static BigDecimal transLateAmt(int multiple, String amt) {
		double doubl = Double.parseDouble(amt);
		doubl = doubl / multiple;
		BigDecimal amtLong = new BigDecimal(Double.toString(doubl));
		return amtLong;
	}

	/**
	 * String转化为long型
	 * 
	 * 字符串型转化为long型
	 * 
	 * @param multiple
	 *            转化倍率
	 * @return amtLong long型数据
	 */
	public static long tranStringAmtToLong(int multiple, String amt) {
		float flt = Float.parseFloat(amt);
		flt = flt * multiple;
		return (long) flt;
	}

	/**
	 * 时间格式化，格式化后的结果，如:2007-05-01 01:02:03
	 * 
	 * @param time
	 * @return
	 */
	public static String formatTimestamp(Timestamp time) {
		String[] timeStrings = time.toString().split("\\.");
		return timeStrings[0];
	}

	/**
	 * 时间格式化，格式化后的结果，如:2009-05-01 01:02:03
	 * 
	 * @param time
	 * @return
	 */
	public static String formatTimeString(String time) {
		if (time == null)
			return "";
		if (time.length() == 8)
			return time.substring(0, 4) + "-" + time.substring(4, 6) + "-"
					+ time.substring(6);
		else if (time.length() == 14)
			return time.substring(0, 4) + "-" + time.substring(4, 6) + "-"
					+ time.substring(6, 8) + " " + time.substring(8, 10) + ":"
					+ time.substring(10, 12) + ":" + time.substring(12);
		else
			return time;
	}

	/**
	 * 时间格式化，格式化后的结果，如:2009年05月01日 01时02分03秒
	 * 
	 * @param time
	 * @return
	 */
	public static String formatTimeStringChinese(String time) {
		if (time == null)
			return "";
		if (time.length() == 6)
			return time.substring(0, 4) + "年" + time.substring(4, 6) + "月";
		else if (time.length() == 8)
			return time.substring(0, 4) + "年" + time.substring(4, 6) + "月"
					+ time.substring(6) + "日";
		else if (time.length() == 14)
			return time.substring(0, 4) + "年" + time.substring(4, 6) + "月"
					+ time.substring(6, 8) + "日 " + time.substring(8, 10) + "时"
					+ time.substring(10, 12) + "分" + time.substring(12) + "秒";
		else
			return time;
	}

	/**
	 * 取下一日期
	 * 
	 * @param currDate
	 * @return
	 */
	public static String getNextDate(String currDate) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear), Integer.parseInt(currMonth) - 1,
				Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, 1);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 取后几天日期
	 * 
	 * @param currDate
	 * @return
	 */
	public static String getNextDate(String currDate, int amount) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear), Integer.parseInt(currMonth) - 1,
				Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, amount);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 取前一日期
	 * 
	 * @param currDate
	 * @return
	 */
	public static String getPrevDate(String currDate) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear), Integer.parseInt(currMonth) - 1,
				Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, -1);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 取前一日期
	 * 
	 * @param currDate
	 * @return
	 */
	public static String getNextYear(String currDate, int amount) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear) + amount,
				Integer.parseInt(currMonth) - 1, Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, 0);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 取得前几个月,还没有做完
	 */
	public static String getBeyondMonth(String currDate, int amount) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear), Integer.parseInt(currMonth) - 1,
				Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, amount);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 标准格式金额为数据库格式金额 忽略"," 取到小数点后2位
	 * 
	 * @param amt
	 * @return 数据库格式的金额
	 */
	public static String getDBFormatAmtByStd(String amt) {
		if (amt == null || amt.trim().equals(""))
			return "";
		amt = amt.replaceAll(",", "");
		BigDecimal bigamt = new BigDecimal(amt);
		bigamt = bigamt.multiply(new BigDecimal(100));
		String tmp = bigamt.toString();
		int pos = tmp.indexOf(".");
		if (pos != -1)
			tmp = tmp.substring(0, pos);
		return tmp;
	}

	/**
	 * 数据库格式金额转换为标准格式金额
	 * 
	 * @param amt
	 * @return 标准格式的金额
	 */
	public static String getStdFormatAmtByDB(String amt) {
		if (amt == null)
			return "";
		if (amt.length() == 1)
			return "0.0" + amt;
		if (amt.length() == 2)
			return "0." + amt;
		if (amt.length() > 2)
			return transAmtString(amt.substring(0, amt.length() - 2)) + "."
					+ amt.substring(amt.length() - 2);
		return "";
	}

	public static String getStdFormatAmtByDBNoComma(String amt) {
		if (amt == null)
			return "";
		if (amt.length() == 1)
			return "0.0" + amt;
		if (amt.length() == 2)
			return "0." + amt;
		if (amt.length() > 2)
			return transAmtStringNoComma(amt.substring(0, amt.length() - 2))
					+ "." + amt.substring(amt.length() - 2);
		return "";
	}

	/**
	 * 转换数据库14位日期时间格式为标准页面展现格式，如20090501142635-->2009-05-01 14:26:35
	 * 
	 * @param date
	 * @return 标准格式的数据库日期
	 */
	public static String getStdFormatDateTimeByDB(String date) {
		if (date == null)
			return "";
		date = date.trim();
		if (date.length() == 14)
			return date.substring(0, 4) + "-" + date.substring(4, 6) + "-"
					+ date.substring(6, 8) + " " + date.substring(8, 10) + ":"
					+ date.substring(10, 12) + ":" + date.substring(12);
		return date;
	}

	/**
	 * 转换数据库14位日期时间格式为标准页面展现格式，如2010-04-02 17:11:16-->20010402171116
	 * 
	 */
	public static String getStdFormatDateTime(String date) {
		if (date == null)
			return "";
		date = date.trim();
		if (date.length() == 19) {
			System.out.println(date.substring(0, 4));
			return date.substring(0, 4) + date.substring(5, 7)
					+ date.substring(8, 10) + date.substring(11, 13)
					+ date.substring(14, 16) + date.substring(17, 19);
		}
		return date;
	}

	/**
	 * 转换数据库8位日期格式为标准页面展现格式，如20090501-->2009-05-01
	 * 
	 * @param date
	 * @return 标准格式数据库日期
	 */
	public static String getStdFormatDateByDB(String date) {
		if (date == null)
			return "";
		date = date.trim();
		if (date.length() == 8)
			return date.substring(0, 4) + "-" + date.substring(4, 6) + "-"
					+ date.substring(6);
		return date;
	}

	/**
	 * 转换数据库8位日期格式为标准页面展现格式，如2009-05-01-->20090501
	 * 
	 * @param date
	 * @return 标准格式数据库日期
	 */
	public static String getStdFormatDate(String date) {
		String date1 = "";
		if (date == null)
			return "";
		date = date.trim();
		if (date.length() == 10)
			return date1 += date.substring(0, 4) + date.substring(5, 7)
					+ date.substring(8, 10);
		else
			return date1 = date;
	}

	/**
	 * 隐藏字符串中间部分
	 * 
	 * @param arg0
	 * @return 隐藏后的字符串
	 */
	public static String hiddenString(String arg0, int begin, int len) {
		String hid = "";
		if (arg0 != null) {
			String string = arg0.trim();
			if (string.length() == 0 || string.length() == 1) {
				return string;
			} else if (string.length() == 2) {
				return "*" + string.substring(0);
			} else {
				for (int i = 0; i < len; i++) {
					hid += "*";
				}
				return string.substring(0, begin) + hid
						+ string.substring(begin + len);
			}
		} else {
			return "";
		}
	}

	/**
	 * Luhn模10"隔位2倍加"校验位计算 用于信用卡的校验
	 * 
	 * @param num
	 * @return 是否正确
	 */
	public static boolean isCorrectByLuhn(String num) {
		int check = Character.getNumericValue(num.charAt(num.length() - 1));
		if (check == Luhn(num.substring(0, num.length() - 1))) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Luhn模10"隔位2倍加"校验位计算 用于信用卡的校验
	 * 
	 * @param num
	 * @return 校验位
	 */
	public static int Luhn(String num) {
		// 所有位的总和
		int sum = 0;
		for (int i = 0; i < num.length(); i++) {
			int tmp = Character
					.getNumericValue(num.charAt(num.length() - i - 1));
			// 奇数位乘2后各位相加
			if (i % 2 == 0) {
				tmp = tmp * 2;

				// 结果最多两位
				sum += tmp % 10;
				if (tmp >= 10) {
					sum += tmp / 10;
				}
			}
			// 偶数位直接相加
			else {
				sum += tmp;
			}
		}

		// 计算校验位
		int mo = sum % 10;
		if (mo == 0) {
			return 0;
		} else {
			return 10 - mo;
		}
	}

	/**
	 * 取得某一日期的下周一
	 * 
	 * @param paramDate
	 * @return 某一日期
	 */
	public static String getNextMonday(String paramDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		int weekDayDist = 0;
		int weekDay = 0;

		if (CommonFunction.checkDt("yyyyMMdd", paramDate)) {

			try {
				Calendar cal = Calendar.getInstance();
				cal.setTime(dateFormat.parse(paramDate));
				weekDay = cal.get(Calendar.DAY_OF_WEEK);

				if (weekDay == Calendar.SUNDAY) {
					weekDayDist = 1;
				} else {
					weekDayDist = Calendar.SATURDAY - weekDay + 2;
				}

			} catch (Exception ex) {
				return paramDate;
			}

			return CommonFunction.getNextDate(paramDate, weekDayDist);
		} else {
			return paramDate;
		}
	}

	public static java.util.Date getCurrTimeStamp() {
		return new java.sql.Timestamp(System.currentTimeMillis());
	}

	/**
	 * 判断是否周一
	 * 
	 * @param paramDate
	 * @return boolean
	 */
	public static boolean isMonday(String paramDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(dateFormat.parse(paramDate));

			if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			return false;
		}
	}

	/*
	 * 
	 * 截取字段
	 */
	public static String SubString(Object obj, int num) {
		String str = (String) obj;
		if (str == null || str.trim().equals("")) {
			return "-";
		}
		if (str.length() > num)
			str = str.substring(0, num) + "... ";
		return str;
	}

	/**
	 * 截取卡号1位取得十九位号码
	 * 
	 * @param num
	 * @return
	 */

	public static String subNumber(String cardNO) {
		String str = "";
		str = cardNO.substring(1, cardNO.length());
		return str;
	}

	/**
	 * 判断是否周五
	 * 
	 * @param paramDate
	 * @return boolean
	 */
	public static boolean isFriday(String paramDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(dateFormat.parse(paramDate));

			if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			return false;
		}
	}

	/**
	 * 解决double.toString会返回科学计数法的问题
	 * 
	 * @param d
	 * @return
	 */
	public static String doubleToString(double d) {
		DecimalFormat df = new DecimalFormat();
		String num = df.format(d);
		String ret = "";
		for (int i = 0; i < num.length(); i++) {
			if (num.charAt(i) != ',') {

				ret += num.charAt(i);
			}
		}
		return ret;
	}

	/**
	 * 根据InputStream流输入的文件内容，在本地保存文件 in: is --输入文件流 homePath --保存的Home；不以文件分隔符结尾
	 * subPath --对Home的相对路径；不以文件分隔符开始与结尾 fileName --文件名 out:
	 * 保存成功返回true;保存失败返回false
	 */
	public static boolean saveFile(InputStream is, String homePath,
			String subPath, String fileName) {

		OutputStream streamOut = null;

		// check是否有输出文件名
		if ("".equals(fileName.trim()))
			return false;

		// check输出路径，若没有则创建
		File desPath = new File(homePath + File.separator + subPath);
		if (!desPath.exists()) {
			if (desPath.mkdirs() == false)
				return false;
		}

		try {
			// 创建输出流
			streamOut = new FileOutputStream(homePath + File.separator
					+ subPath + File.separator + fileName);

			// 写输出文件
			int bytesRead = 0;
			byte[] buffer = new byte[8129];
			while ((bytesRead = is.read(buffer, 0, 8129)) != -1) {
				streamOut.write(buffer, 0, bytesRead);
			}
		} catch (FileNotFoundException fnfe) {
			return false;
		} catch (IOException ioe) {
			return false;
		} finally {
			IOUtils.closeQuietly(streamOut);
		}
		return true;
	}

	/**
	 * 判断是否是数字或者字母
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumberAndMata(String str) {
		int i, j;
		// String strTemp = "0123456789 "; //数字的匹配模式
		String strTemp = "0123456789abcdefghijklnmopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ ";// 字符的匹配模式
		if (str.equals(" "))
			return true;
		for (i = 0; i < str.length(); i++) {
			j = strTemp.indexOf(str.charAt(i));
			if (j == -1) {// 说明含有不是数字的字符
				return false;
			}
		}
		return true;
	}

	/**
	 * 在文件名尾，类型之前，加后缀
	 */
	public static String addPostfixToFileNm(String fileNm, String postfix) {

		if (fileNm == null) {
			if (postfix == null || postfix.trim().equals("")) {
				return "";
			} else {
				return postfix;
			}
		} else if (postfix == null || postfix.trim().equals("")) {
			return fileNm;
		}
		int lastIndex = fileNm.lastIndexOf('.');
		if (lastIndex == -1)
			return fileNm + postfix;
		else
			return fileNm.substring(0, lastIndex) + postfix
					+ fileNm.substring(lastIndex, fileNm.length());
	}

	/**
	 * 从 vector1中过滤掉vector2中的元素
	 * 
	 * @param vector1
	 *            被过滤项
	 * @param vector2
	 *            过滤项
	 */
	public static Vector filter(Vector vector1, Vector vector2) {
		for (int i = 0; i < vector2.size(); i++) {
			vector1.remove(vector2.get(i));
		}
		return vector1;
	}

	/**
	 * 判断元素o是否在arrayList里面
	 * 
	 * @param o
	 * @param arrayList
	 * @return boolean
	 */
	public static boolean isContain(Object o, Vector vector) {
		for (int i = 0; i < vector.size(); i++) {
			if ((vector.get(i)).equals(o)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 合并两个vector，去除重复
	 * 
	 * @param vector1
	 * @param vector2
	 * @return boolean
	 */
	public static Vector removeRepeat(Vector vector1, Vector vector2) {
		if (vector2 != null) {
			for (int i = 0; i < vector2.size(); i++) {
				if (!isContain(vector2.get(i), vector1)) {
					vector1.add(vector2.get(i));
				}
			}
		}
		return vector1;
	}

	/**
	 * 相差的时间
	 * 
	 * @param startDt
	 * @param endDt
	 */
	public static void getDatePase(String startDt, String endDt) {
		int time = 0;// 相差毫秒数
		int i = 0; // 天
		// int s=0;//秒
		try {
			// 将字符串转相应格式的时间类型
			DateFormat f = new SimpleDateFormat("yy-MM-dd");
			DateFormat t = new SimpleDateFormat("hh:mm:ss");

			Date h = new Date();
			Date m = new Date();
			Date d1 = new Date();
			Date d2 = new Date();
			// 日期
			d1 = f.parse(startDt);
			d2 = f.parse(endDt);

			// 调日期相减得到天数
			i = diffDate(d1, d2);

			int ms = (int) time / 60;// 到总分钟
			int hs = 0;
			if (ms >= 60) {
				hs = (int) ms / 60;// 得到小时
				ms -= (hs * 60 + 1);// 剩余分
			}
		} catch (Exception e) {
			LOGGER.error("", e);
		}
	}

	// 日期相减
	public static int diffDate(java.util.Date date, java.util.Date adate1te1) {
		return (int) ((getMillis(date) - getMillis(adate1te1)) / (24 * 3600 * 1000));
	}

	// 返回毫秒
	public static long getMillis(java.util.Date date) {
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.getTimeInMillis();
	}

	/**
	 * 取前几天日期
	 * 
	 * @param currDate
	 * @return
	 */
	public static String getBeforeDate(String currDate, int amount) {
		String currYear = currDate.substring(0, 4);
		String currMonth = currDate.substring(4, 6);
		String currDay = currDate.substring(6, 8);

		GregorianCalendar currGCal = new GregorianCalendar(
				Integer.parseInt(currYear), Integer.parseInt(currMonth) - 1,
				Integer.parseInt(currDay));
		currGCal.add(GregorianCalendar.DAY_OF_MONTH, -amount);
		SimpleDateFormat datefmt = new SimpleDateFormat(DATE_FMT);
		return datefmt.format(currGCal.getTime());
	}

	/**
	 * 其中有对 beginDay，endDay的format
	 * 
	 * @param beginDay
	 * @param endDay
	 * @return
	 * @throws ParseException
	 */
	public static long betweenDay(String beginDay, String endDay)
			throws ParseException {

		Date date1 = new SimpleDateFormat("yyyy-mm-dd")
				.parse(formatTimeString(beginDay));

		Date date2 = new SimpleDateFormat("yyyy-mm-dd")
				.parse(formatTimeString(endDay));

		long day = (date1.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000) > 0 ? (date1
				.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000)
				:

				(date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000);

		System.out.println("相差的日期: " + day);

		return day;
	}

	/**
	 * @author abu 对于金钱的正则表达式 reg 正则式
	 */
	public static boolean formatNumbic(String money) {
		boolean b = false;
		String reg = "[\\-]?([1-9]+[0-9]*|0)(\\.[\\d]+)?";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(money);
		b = m.matches();
		return b;
	}

	/**
	 * 判断字符串是否全部是数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {

		int i = 0;

		int j = str.length();

		char ch;

		for (i = 0; i < j; i++) {

			ch = str.charAt(i);

			if (!((ch >= '0') && (ch <= '9'))) {

				return false;

			}

		}

		return true;

	}

	public static void main(String[] args) {

	}
}