package com.jiuyv.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0
 * 
 * @author QIAOYU
 * 
 * @date 2013-10-21
 * 
 * @description 公用日期操作类
 */

public final class DateUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(DateUtil.class);
	
	public static final String FORMAT8 = "yyyyMMdd";

	public static final String FORMAT14 = "yyyyMMddHHmmss";
	
	private static Pattern pattern = Pattern.compile("-|:|\\s");

	private static Matcher match;

	private static Map<String, Integer> timeUnit = null;
	
	static {

		if (timeUnit == null) {

			timeUnit = new HashMap<String, Integer>();

			timeUnit.put("year", Calendar.YEAR);

			timeUnit.put("month", Calendar.MONTH);

			timeUnit.put("day", Calendar.DATE);

			timeUnit.put("week", Calendar.WEEK_OF_YEAR);
			
			timeUnit.put("minute", Calendar.MINUTE);

		}
	}

	private DateUtil(){};
	
	/**
	 * 日期操作
	 * 
	 * @param date
	 * 
	 * @param field 需操作的时间字段,例如Calendar.YEAR
	 * 
	 * @param value 正数为加,负数为减
	 * 
	 * @return
	 * 
	 */
	public static Date add(Date date, String field, int value) {

		Calendar ca = Calendar.getInstance();

		ca.setTime(date);

		ca.add(timeUnit.get(field), value);

		return ca.getTime();

	}

	/**
	 * 获取日期,格式yyyyMMddHHmmss
	 * 
	 * @return 日期
	 */
	public static String getLongDate() {
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}

	/**
	 * 获取日期，格式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @return 日期
	 */
	public static String getFormateDate() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

	/**
	 * 获取日期，格式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @param formatStr 日期格式
	 * 
	 * @return 日期
	 */
	public static String getFormateDate(String formatStr) {
		return new SimpleDateFormat(formatStr).format(new Date());
	}

	/**
	 * 获取日期时间精确到毫秒，格式：yyyy-MM-dd HH:mm:ss:SSS
	 * 
	 * @return 日期
	 */
	public static String getFormateDateForLog() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS").format(new Date());
	}

	/**
	 * 获取日期，格式：yyyyMMdd
	 * 
	 * @return 日期
	 */
	public static String getDate() {
		return new SimpleDateFormat("yyyyMMdd").format(new Date());
	}

	/**
	 * 时间累加
	 * 
	 * @param date 当前日期 格式必须为 yyyyMMddHHmmss
	 * 
	 * @param second 累加的时间 单位是秒
	 * 
	 * @return 日期
	 * 
	 * @throws ParseException 
	 */
	public static String dateAddSecond(String date, Long second) throws ParseException {

		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date((new SimpleDateFormat("yyyyMMddHHmmss").parse(date).getTime() + second * 1000)));

	}

	/**
	 * 时间相减
	 * 
	 * @param date 当前日期 格式必须为 yyyyMMdd
	 * 
	 * @param day 累加的时间 单位是天
	 * 
	 * @return 日期
	 * 
	 * @throws ParseException 
	 */
	public static String dateSub(String date, int day) throws ParseException {
		
		return new SimpleDateFormat("yyyyMMdd").format(new Date((new SimpleDateFormat("yyyyMMdd").parse(date).getTime() - Long.valueOf(day) * 24 * 60 * 60 * 1000)));
		
	}
	/**
	 * 取得梁日期相差的天数
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public static int dateSub(String date1, String date2) throws ParseException {
		
		return (int) ((new SimpleDateFormat("yyyyMMdd").parse(date2).getTime() - new SimpleDateFormat("yyyyMMdd").parse(date1).getTime())/(24 * 60 * 60 * 1000))+1;
		
	}

	/**
	 * 时间相加
	 * 
	 * @param date 当前日期 格式必须为 yyyyMMdd
	 * 
	 * @param day 累加的时间 单位是天
	 * 
	 * @return 日期
	 * 
	 * @throws ParseException 
	 */
	public static String dateAdd(String date, int day) throws ParseException {
		
		return new SimpleDateFormat("yyyyMMdd").format(new Date((new SimpleDateFormat("yyyyMMdd").parse(date).getTime() + Long.valueOf(day) * 24 * 60 * 60 * 1000)));
		
	}

	/**
	 * 
	 * @param date 日期
	 * 
	 * @return
	 * 
	 * @throws ParseException 
	 */
	public static String getCoreDt(String date) throws ParseException {
		return "('" + dateSub(date, 1) + "','" + date + "','" + dateAdd(date, 1) + "')";
	}

	/**
	 * @param value 日期
	 * 
	 * @return 
	 */
	public static String formateDate(String value) {
		
		if (value == null) {
			
			return null;
			
		}
		match = pattern.matcher(value);
		
		return match.replaceAll("");
	}

	/**
	 * @param value 日期
	 * 
	 * @param a 位置
	 * 
	 * @return 
	 */
	public static String formateDate(String value, int a) {
		
		if (value == null) {
			
			return null;

		}
		
		match = pattern.matcher(value);
		
		return match.replaceAll("").substring(0, a);
	}

	/**
	 * @param a 日期
	 * 
	 * @param field 日期参数
	 * 
	 * @param amount 日期参数
	 * 
	 * @return
	 */
	public static Date addTime(Date a, int field, String amount) {
		
		if (amount == null){
			
			return null;
			
		}

		try {
			
			int am = Integer.parseInt(amount);
			
			Calendar gre = Calendar.getInstance();
			
			gre.setTime(a);
			
			gre.add(field, am);
			
			return gre.getTime();
			
		} catch (NumberFormatException e) {

			return null;
			
		}
	}

	/**
	 * 
	 * @param value  日期参数
	 * 
	 * @param formate 日期格式
	 */
	public static Date formateStringToDate(String value, String formate) {
		
		if (value == null){
			
			return null;
			
		}
		
		DateFormat format = new SimpleDateFormat(formate);
		
		try {
			
			return format.parse(value);
			
		} catch (ParseException e) {

			return null;
			
		}
	}

	/**
	 * @param d 日期参数
	 * 
	 * @return 
	 */
	public static String formDateToString8(Date d) {
		
		if (d == null){
			
			return null;
			
		}
		
		return new SimpleDateFormat(FORMAT8).format(d);
	}

	/**
	 * @param d 日期参数
	 * 
	 * @param format 日期格式
	 * 
	 * @return
	 */
	public static String formDateToString(Date d, String format) {
		
		if (d == null){
			
			return null;
			
		}
		
		DateFormat formatDate = new SimpleDateFormat(format);
		
		return formatDate.format(d);
	}

	/**
	 * @param d 日期参数
	 * 
	 * @return 
	 */
	public static String formDateToString14(Date d) {
		
		if (d == null){
			
			return null;
			
		}
		
		return new SimpleDateFormat(FORMAT14).format(d);
	}

	/**
	 * 返回格式化日期
	 * 
	 * @param format 日期格式
	 * 
	 * @return 日期
	 */
	public static String getFormatterDate(String format) {
		return new SimpleDateFormat(format).format(new Date());
	}
	
	//获得系统当前时间
	public static String getDateyyyyMMddHHmmss() {
		SimpleDateFormat myFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar calendar = Calendar.getInstance();
		return myFormat.format(calendar.getTime());
	}
	
	public static String getRefDate(String refDate, int monthAdjust, int dayAdjust){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		
		try {
			Date d = sdf.parse(refDate);
			cal.setTime(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		
		cal.add(Calendar.MONTH, monthAdjust);
		cal.add(Calendar.DAY_OF_MONTH, dayAdjust);

		return sdf.format(cal.getTime());
	}
	
	/**
	 * 判断开始时间 和结束时间  是否在所给时间范围内
	 * @param begin_time 时间格式: hhmmss
	 * @param end_time 时间格式: hhmmss
	 * @param curr_date 时间格式: hhmmss
	 * @return
	 */
	static public boolean CheckTimeInPeriod(String begin_time, String end_time,
			Calendar curr_date) {

		int curr_hour = curr_date.get(Calendar.HOUR_OF_DAY);
		int curr_minute = curr_date.get(Calendar.MINUTE);
		int curr_second = curr_date.get(Calendar.SECOND);

		long curr_seconds = curr_hour * 60 * 60 + curr_minute * 60
				+ curr_second;

		long begin_seconds = new Integer(begin_time.substring(0, 2)).intValue()
				* 60 * 60 + new Integer(begin_time.substring(2, 4)).intValue()
				* 60 + new Integer(begin_time.substring(4, 6)).intValue();
		long end_seconds = new Integer(end_time.substring(0, 2)).intValue()
				* 60 * 60 + new Integer(end_time.substring(2, 4)).intValue()
				* 60 + new Integer(end_time.substring(4, 6)).intValue();

		if ((curr_seconds >= begin_seconds) && (curr_seconds <= end_seconds)) {
			return true;
		} else {
			return false;
		}
	}
}