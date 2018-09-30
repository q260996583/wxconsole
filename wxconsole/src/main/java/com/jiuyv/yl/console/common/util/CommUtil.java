package com.jiuyv.yl.console.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class CommUtil {

	private static Logger LOGGER = LoggerFactory.getLogger(CommUtil.class);

	/**
	 *  文件IO缓冲区大笑
	 */
	public static int FILE_IO_BUFFER_SIZE = 40960;

	/**
	 *  字符集定义
	 */
	public static final String SERVER_CHARSET = "ISO8859-1";
	public static final String CLIENT_CHARSET = "GB2312";

	/**
	 *  字符填充方向
	 */
	public static final int FILLED_FROM_RIGHT = 1;
	public static final int FILLED_FROM_LEFT = 2;

	public static final int PAGE_ROWS = 10;

	/**
	 *  获得当前日期与本周日相差的天数
	 * @return
	 */
	private static int getMondayPlus() {
		Calendar cd = Calendar.getInstance();
		// 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以这里减1
		if (dayOfWeek == 1) {
			return 0;
		} else {
			return 1 - dayOfWeek;
		}
	}

	public static String getPreviousWeekSunday() {
		int weeks = 0;
		weeks--;
		int mondayPlus = getMondayPlus();
		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.add(GregorianCalendar.DATE, mondayPlus + weeks);
		Date monday = currentDate.getTime();
		return DateFormatUtils.format(monday, "yyyyMMdd");
	}

	/**
	 *  begin_time end_time时间格式: hhmmss
	 * @param begin_time
	 * @param end_time
	 * @param curr_date
	 * @return
	 */
	static public boolean checkTimeInPeriod(String begin_time, String end_time,
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

	/**
	 *  yyyymmdd
	 * @return
	 */
	public static String getCurrDateString() {
		Calendar cal = Calendar.getInstance();
		String temp_str = new Integer(cal.get(cal.YEAR) * 10000
				+ (cal.get(Calendar.MONTH) + 1) * 100
				+ cal.get(Calendar.DAY_OF_MONTH)).toString();
		return fixLength(temp_str, 8, '0', FILLED_FROM_LEFT);
	}

	/**
	 *  hhmiss
	 * @return
	 */
	public static String getCurrTimeString() {
		Calendar cal = Calendar.getInstance();
		String temp_str = new Integer(cal.get(cal.HOUR_OF_DAY) * 10000
				+ cal.get(Calendar.MINUTE) * 100 + cal.get(Calendar.SECOND))
				.toString();
		return fixLength(temp_str, 6, '0', FILLED_FROM_LEFT);
	}

	/**
	 *  yyyymmddhhmiss
	 * @return
	 */
	public static String getCurrDateTimeString() {
		return getCurrDateString() + getCurrTimeString();
	}

	/**
	 *  hhmiss.zzz
	 * @return
	 */
	public static String getCurrTimeString_MillSecond() {
		Calendar cal = Calendar.getInstance();
		String temp_str = new Integer(cal.get(cal.HOUR_OF_DAY) * 10000
				+ cal.get(Calendar.MINUTE) * 100 + cal.get(Calendar.SECOND))
				.toString();
		String temp_str2 = new Integer(cal.get(cal.MILLISECOND)).toString();
		return temp_str + "." + temp_str2;
	}

	/**
	 * 上个月的最后一天，输入格式只需要头部是yyyymm
	 * @param curr_date
	 * @return
	 */
	public static String lastDayInLastMonth(String curr_date) {
		try {

			int year = new Integer(curr_date.substring(0, 4)).intValue();
			int month = new Integer(curr_date.substring(4, 6)).intValue();

			Calendar cal = Calendar.getInstance();

			cal.set(year, month - 1, 1);

			cal.add(Calendar.MONTH, -1);

			int maxday_inMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

			cal.set(Calendar.DAY_OF_MONTH, maxday_inMonth);

			return new Integer(cal.get(cal.YEAR) * 10000
					+ (cal.get(Calendar.MONTH) + 1) * 100
					+ cal.get(Calendar.DAY_OF_MONTH)).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);

			return "";

		}

	}

	public static String dateFromWeekAndDay(String now, int dayOfWeek)
			throws Exception {
		GregorianCalendar date = new GregorianCalendar();
		date.setTime(DateUtils.parseDate(now, new String[] { "yyyyMMdd" }));
		int nw = date.get(GregorianCalendar.DAY_OF_WEEK) - 1;
		if (nw == 0)
			nw = 7;
		if (dayOfWeek < 0) {
			date.add(GregorianCalendar.DAY_OF_YEAR, -(nw + dayOfWeek + 7));
			return DateFormatUtils.format(date, "yyyyMMdd");
		} else {
			date.add(GregorianCalendar.DAY_OF_YEAR, dayOfWeek - nw);
			return DateFormatUtils.format(date, "yyyyMMdd");
		}

	}

	// 按日数获取日期，如-1获取上月1号的完整日期，1获取本月1号的完整日期
	public static String dateFromMonthAndDay(String now, int dayOfMonth)
			throws Exception {
		GregorianCalendar date = new GregorianCalendar();
		date.setTime(DateUtils.parseDate(now, new String[] { "yyyyMMdd" }));
		int nm = date.get(GregorianCalendar.DAY_OF_MONTH);

		if (dayOfMonth < 0) {
			int lastMonthDays = getLastMonthDays(now);
			date.add(GregorianCalendar.DAY_OF_YEAR,
					-(nm + dayOfMonth + lastMonthDays));
			return DateFormatUtils.format(date, "yyyyMMdd");
		} else {
			date.add(GregorianCalendar.DAY_OF_YEAR, dayOfMonth - nm);
			return DateFormatUtils.format(date, "yyyyMMdd");
		}

	}

	// 按日期获取当日星期数
	public static int dayOfWeek(String now) throws Exception {
		GregorianCalendar date = new GregorianCalendar();
		date.setTime(DateUtils.parseDate(now, new String[] { "yyyyMMdd" }));
		int nw = date.get(GregorianCalendar.DAY_OF_WEEK) - 1;
		if (nw == 0)
			nw = 7;
		return nw;
	}

	// 按日期获取当月号数
	public static int dayOfMonth(String now) throws Exception {
		GregorianCalendar date = new GregorianCalendar();
		date.setTime(DateUtils.parseDate(now, new String[] { "yyyyMMdd" }));
		int nm = date.get(GregorianCalendar.DAY_OF_MONTH);
		return nm;
	}

	public static int getLastMonthDays(String date) throws Exception {

		int year = new Integer(date.substring(0, 4)).intValue();
		int month = new Integer(date.substring(4, 6)).intValue();
		int day = new Integer(date.substring(6, 8)).intValue();
		int day_in_month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if ((((year % 4) == 0) && ((year % 100) != 0)) || ((year % 400) == 0)) {
			day_in_month[1] = 29;
		}

		if (month == 1) {
			month = 12;
			year = year - 1;

		} else {
			month = month - 1;
		}
		day = day_in_month[month - 1];

		return new Integer(day);
	}

	// 下个月的第一天，输入格式只需要头部是yyyymm
	public static String firstDayInNextMonth(String curr_date) {
		try {

			int year = new Integer(curr_date.substring(0, 4)).intValue();
			int month = new Integer(curr_date.substring(4, 6)).intValue();

			Calendar cal = Calendar.getInstance();

			cal.set(year, month - 1, 1);

			cal.add(Calendar.MONTH, 1);

			return new Integer(cal.get(cal.YEAR) * 10000
					+ (cal.get(Calendar.MONTH) + 1) * 100
					+ cal.get(Calendar.DAY_OF_MONTH)).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);

			return "";

		}

	}

	public static String addDateByDay(String date, int day) {
		Date d;
		try {
			d = DateUtils.parseDate(date, new String[] { "yyyyMMdd" });
			GregorianCalendar g = new GregorianCalendar();
			g.setTime(d);
			g.add(GregorianCalendar.DAY_OF_YEAR, day);
			return DateFormatUtils.format(g, "yyyyMMdd");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}

	}

	public static String dayBefore(String date) {
		try {
			int year = new Integer(date.substring(0, 4)).intValue();
			int month = new Integer(date.substring(4, 6)).intValue();
			int day = new Integer(date.substring(6, 8)).intValue();
			int day_in_month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,
					31 };
			if ((((year % 4) == 0) && ((year % 100) != 0))
					|| ((year % 400) == 0)) {
				day_in_month[1] = 29;
			}
			if (day == 1) {
				if (month == 1) {
					month = 12;
					year = year - 1;
				} else {
					month = month - 1;
				}
				day = day_in_month[month - 1];
			} else {
				day = day - 1;
			}
			return new Integer(year * 10000 + month * 100 + day).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);
			return date;
		}
	}

	public static String dayAfter(String date) {
		try {
			int year = new Integer(date.substring(0, 4)).intValue();
			int month = new Integer(date.substring(4, 6)).intValue();
			int day = new Integer(date.substring(6, 8)).intValue();
			int day_in_month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,
					31 };
			if ((((year % 4) == 0) && ((year % 100) != 0))
					|| ((year % 400) == 0)) {
				day_in_month[1] = 29;
			}
			if (day == day_in_month[month - 1]) {
				day = 1;
				if (month == 12) {
					month = 1;
					year = year + 1;
				} else {
					month = month + 1;
				}
			} else {
				day = day + 1;
			}

			return new Integer(year * 10000 + month * 100 + day).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);
			return date;
		}
	}

	// 距离当前日期N月前的日期
	public static String monthBefore(int month_n, String end_date) {
		try {

			int year = new Integer(end_date.substring(0, 4)).intValue();
			int month = new Integer(end_date.substring(4, 6)).intValue();
			int day = new Integer(end_date.substring(6, 8)).intValue();

			Calendar cal = Calendar.getInstance();

			cal.set(year, month - 1, day);

			cal.add(Calendar.MONTH, -month_n);

			return new Integer(cal.get(cal.YEAR) * 10000
					+ (cal.get(Calendar.MONTH) + 1) * 100
					+ cal.get(Calendar.DAY_OF_MONTH)).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);

			return "";

		}

	}

	// 两个月份之间的月数, 时间格式只需要头部是yyyymm
	public static int monthBetween(String start_month, String end_month) {

		try {
			int start = (new Integer(start_month.substring(0, 4)).intValue())
					* 12
					+ (new Integer(start_month.substring(4, 6)).intValue());
			int end = (new Integer(end_month.substring(0, 4)).intValue()) * 12
					+ (new Integer(end_month.substring(4, 6)).intValue());

			return end - start;
		} catch (Exception e) {

			LOGGER.error(null, e);

			return 0;
		}

	}

	// 检查日期格式:yyyymmdd
	public static boolean validDateFormat(String date_str) {
		try {

			int day_in_month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,
					31 };

			if (date_str.length() != 8) {
				return false;
			}

			int year = new Integer(date_str.substring(0, 4)).intValue();
			int month = new Integer(date_str.substring(4, 6)).intValue();
			int day = new Integer(date_str.substring(6, 8)).intValue();

			// 校验年份
			if (year < 1000) {
				return false;
			}

			// 闰月：
			// 1.年份被4整除，但是不能被100整除
			// 2.年份被400整除
			if ((((year % 4) == 0) && ((year % 100) != 0))
					|| ((year % 400) == 0)) {
				day_in_month[1] = 29;
			}
			// 校验月份
			if ((month < 1) || (month > 12)) {
				return false;
			}

			// 校验日期
			if ((day < 1) || (day > day_in_month[month - 1])) {
				return false;
			}

			return true;

		} catch (Exception e) {
			LOGGER.error(null, e);
			return false;
		}
	}

	// 校验，并转换成合法的18位身份证号码，错误则返回空
	static public String convertID(String old_idno) {

		final int wtable[] = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
				4, 2, 1 };
		final char check_table[] = { '1', '0', 'X', '9', '8', '7', '6', '5',
				'4', '3', '2' };

		String new_idno;

		try {

			// 15位转换为17位
			if (old_idno.length() == 15) {
				String part1 = old_idno.substring(0, 6);
				String part2 = old_idno.substring(6, 15);

				String year = old_idno.substring(6, 8);
				int year_int = new Integer(year).intValue();

				new_idno = part1 + "19" + part2;

			} else if (old_idno.length() == 18) {
				new_idno = old_idno;
			} else {
				return null;
			}

			// 校验前面17位
			int bit_int;
			int total = 0;
			for (int i = 0; i < 17; i++) {
				bit_int = new_idno.charAt(i) - '0';

				if ((bit_int < 0) || (bit_int > 9)) {
					return null;
				}

				total += bit_int * wtable[i];
			}

			total %= 11;

			char check_bit = check_table[total];

			// 15位转17位后，添加校验位
			if (new_idno.length() == 17) {
				new_idno += new Character(check_bit).toString();
				return new_idno;
			}
			// 18位
			else {
				if (check_bit != new_idno.charAt(17)) {
					return null;
				} else {
					return new_idno;
				}
			}

		} catch (Exception e) {
			LOGGER.error(null, e);

			return null;
		}
	}

	static public boolean clearPath(String path) {
		try {

			File path_to_clear = new File(path);
			File[] file_list = path_to_clear.listFiles();

			// 不是目录
			if (file_list == null) {
				return false;
			}

			for (int i = 0; i < file_list.length; i++) {
				// 仅删除文件
				if (file_list[i].isFile()) {
					if (!file_list[i].delete()) {
						return false;
					}
				}
			}

			return true;
		} catch (Exception e) {
			LOGGER.error(null, e);

			return false;
		}

	}

	// 移动源目录下所有文件到目标目录
	static public boolean moveFiles(String source_path, String target_path) {
		try {

			File path_to_clear = new File(source_path);

			File[] file_list = path_to_clear.listFiles();
			// 不是目录
			if (file_list == null) {
				return false;
			}

			File target_file = null;

			for (int i = 0; i < file_list.length; i++) {
				target_file = new File(target_path + "/"
						+ file_list[i].getName());

				// 如果目标文件存在，先删除该文件
				if (target_file.exists()) {
					target_file.delete();

					// 仅移动文件
				}
				if (file_list[i].isFile()) {
					if (!file_list[i].renameTo(target_file)) {
						return false;
					}
				}
			}

			return true;
		} catch (RuntimeException e) {
			LOGGER.error(null, e);

			return false;
		}

	}

	// 压缩文件、路径
	// 参数： target_filename 全路径
	// base_pathname 压缩后的文件中，文件的初始路径
	static public boolean compressFile(String source_filename,
			String target_filename, String internal_pathroot) {

		ZipOutputStream zos = null;

		try {

			zos = new ZipOutputStream(new BufferedOutputStream(
					new FileOutputStream(target_filename)));

			File source_file = new File(source_filename);
			if (!putFile2Zip(source_file, internal_pathroot, zos)) {
				throw new Exception();
			}

			zos.close();

			return true;

		} catch (Exception e) {

			LOGGER.error(null, e);

			try {

				if (zos != null) {
					zos.close();

				}
			} catch (Exception ee) {
			}

			return false;
		}

	}

	// 添加文件（目录）到zip文件
	static public boolean putFile2Zip(File source_file,
			String internal_pathroot, ZipOutputStream zos) {

		BufferedInputStream bis = null;

		try {

			File[] file_list;

			// 目录
			if (source_file.isDirectory()) {

				// 放入一个空目录夹，zip内至少要有一个文件
				if ((internal_pathroot != null)
						&& (internal_pathroot.length() > 0)) {
					ZipEntry ze_path = new ZipEntry(internal_pathroot + "/");
					zos.putNextEntry(ze_path);
				}

				file_list = source_file.listFiles();

				if (file_list == null) {
					return false;
				}
			}
			// 文件
			else {
				file_list = new File[1];
				file_list[0] = source_file;
			}

			String entry_filename;
			File entry_file;
			ZipEntry ze;
			byte in_buffer[] = new byte[FILE_IO_BUFFER_SIZE];
			int read_bytes;

			// 添加一个文件
			for (int i = 0; i < file_list.length; i++) {

				entry_file = file_list[i];

				if ((internal_pathroot == null)
						|| (internal_pathroot.length() == 0)) {
					entry_filename = entry_file.getName();
				} else {
					entry_filename = internal_pathroot + "/"
							+ entry_file.getName();

				}

				if (entry_file.isDirectory()) {

					// 添加一个目录
					// A directory entry is defined to be one whose name ends
					// with a '/'.
					ze = new ZipEntry(entry_filename + "/");
					zos.putNextEntry(ze);

					// 添加该目录下的文件
					if (!putFile2Zip(entry_file, entry_filename, zos)) {
						throw new Exception();
					}

				} else {

					// 保存相对路径
					ze = new ZipEntry(entry_filename);
					zos.putNextEntry(ze);

					bis = new BufferedInputStream(new FileInputStream(
							entry_file));
					while ((read_bytes = bis.read(in_buffer, 0,
							FILE_IO_BUFFER_SIZE)) != -1) {
						zos.write(in_buffer, 0, read_bytes);
					}
					bis.close();

				}

			}

			return true;

		} catch (Exception e) {

			LOGGER.error(null, e);

			try {
				if (bis != null) {
					bis.close();

				}
			} catch (Exception ee) {
			}

			return false;
		}

	}

	// 添加一个文件、路径到原有压缩文件中
	// 参数： target_filename 全路径
	// base_pathname 压缩后的文件中，文件的初始路径
	static public boolean addFile2Zip(String source_filename,
			String target_filename, String internal_pathroot) {

		ZipInputStream zis = null;
		ZipOutputStream zos = null;

		ZipEntry ze = null;

		try {

			// 首先拷贝原有文件内容到临时文件中

			String temp_filename = target_filename + ".tmp";

			zis = new ZipInputStream(new FileInputStream(target_filename));
			zos = new ZipOutputStream(new BufferedOutputStream(
					new FileOutputStream(temp_filename)));

			byte in_buffer[] = new byte[FILE_IO_BUFFER_SIZE];
			int read_bytes;
			while ((ze = zis.getNextEntry()) != null) {

				zos.putNextEntry(ze);

				while ((read_bytes = zis
						.read(in_buffer, 0, FILE_IO_BUFFER_SIZE)) != -1) {
					zos.write(in_buffer, 0, read_bytes);
				}
			}

			// 添加新文件
			File source_path = new File(source_filename);
			if (!putFile2Zip(source_path, internal_pathroot, zos)) {
				throw new Exception();
			}

			zis.close();
			zos.close();

			// 用临时文件更新原文件
			File temp_file = new File(temp_filename);
			File target_file = new File(target_filename);
			if (!target_file.delete()) {
				return false;
			}
			if (!temp_file.renameTo(target_file)) {
				return false;
			}

			return true;
		} catch (Exception e) {
			LOGGER.error(null, e);
			return false;
		} finally {
			IOUtils.closeQuietly(zis);
			IOUtils.closeQuietly(zos);
		}

	}

	// 由于Java字符函数按照系统默认字符集输出，所以转换字符串的客户端编码的字符流包装成系统默认字符集。
	// 如果转换失败，不作转换
	static public String convert2ClientCharSet(String input_str) {

		try {

			String result_str;

			if (!(System.getProperty("os.name").startsWith("Windows"))) {
				result_str = new String(input_str.getBytes(CLIENT_CHARSET),
						SERVER_CHARSET);
			} else {
				result_str = input_str;

			}
			return result_str;

		} catch (Exception e) {
			LOGGER.error(null, e);
			return input_str;
		}

	}

	// 由于客户端输入的字符串是GB2312编码，没有转换被直接送到Server。HttpRequest.getParameter按照ISO8859-1编码转换字符串，得出的是错误的字符串。
	// 如果转换失败，不作转换
	static public String convertFromClientCharSet(String input_str) {

		try {

			String result_str;

			result_str = new String(input_str.getBytes(SERVER_CHARSET),
					CLIENT_CHARSET);

			return result_str;

		} catch (Exception e) {
			LOGGER.error(null, e);

			return input_str;
		}

	}

	// 把字符串按固定长度截断、或填充字符
	// 转换后的字段长度是按照字符个数计算
	static private String fixLength(String in_str, int out_length,
			char fill_char, int fill_direction) {

		int in_length = in_str.length();
		if (in_length == out_length) {
			return in_str;
		} else if (in_length > out_length) {
			return in_str.substring(0, out_length);
		}

		StringBuffer result_buffer = new StringBuffer();

		// 填充到尾部
		if (fill_direction == FILLED_FROM_RIGHT) {

			result_buffer.append(in_str);

			for (int i = 0; i < out_length - in_length; i++) {
				result_buffer.append(fill_char);
			}
		}
		// 从左边填充
		else {

			for (int i = 0; i < out_length - in_length; i++) {
				result_buffer.append(fill_char);

			}
			result_buffer.append(in_str);
		}

		return result_buffer.toString();

	}

	static public String fixLengthFromLeft(String in_str, int out_length,
			char fill_char) {
		return fixLength(in_str, out_length, fill_char, FILLED_FROM_LEFT);
	}

	static public String fixLengthFromRight(String in_str, int out_length,
			char fill_char) {
		return fixLength(in_str, out_length, fill_char, FILLED_FROM_RIGHT);
	}

	// 1.截断到最大长度
	// 2.填充到最小长度
	// 转换后的字段长度是按照客户端的编码（可能是多字节）的字节数计算：假设汉字显示的宽度和字节数成正比例
	// 注意：填充字符必须是单字节字符
	static private String fixLengthWithClientCharSet(String in_str,
			int min_length, int max_length, char fill_char, int fill_direction) {

		try {

			if (in_str == null) {
				in_str = "";

			}
			int in_char_length = in_str.length();

			// 首先截取输入字符串到预定长度内，可能小于或者等于指定的输出长度
			StringBuffer cut_buffer = new StringBuffer();

			int curr_bytes_length = 0;
			int curr_chars_length = 0;
			char curr_char;
			int add_length;

			// 首先截取输入字符串到预定长度内，可能小于或者等于指定的输出长度
			while (curr_chars_length < in_char_length) {

				curr_char = in_str.charAt(curr_chars_length);
				add_length = new Character(curr_char).toString().getBytes(
						CLIENT_CHARSET).length;
				if (curr_bytes_length + add_length > max_length) {
					break;
				}

				cut_buffer.append(curr_char);
				curr_bytes_length += add_length;
				curr_chars_length++;

			}

			if (curr_bytes_length >= min_length) {
				return cut_buffer.toString();
			} else {

				// 填充到min_length
				int fill_to_length = min_length;

				// 填充到尾部
				if (fill_direction == FILLED_FROM_RIGHT) {
					for (int i = 0; i < fill_to_length - curr_bytes_length; i++) {
						cut_buffer.append(fill_char);
					}
					return cut_buffer.toString();
				}
				// 从左边填充
				else {
					StringBuffer result_buf = new StringBuffer();

					for (int i = 0; i < fill_to_length - curr_bytes_length; i++) {
						result_buf.append(fill_char);
					}
					for (int i = 0; i < curr_chars_length; i++) {
						result_buf.append(cut_buffer.charAt(i));

					}
					return result_buf.toString();

				}
			}

		} catch (Exception e) {
			LOGGER.error(null, e);
			return in_str;
		}
	}

	static private String fixLengthWithClientCharSet(String in_str,
			int max_length, char fill_char, int fill_direction) {

		return fixLengthWithClientCharSet(in_str, max_length, max_length,
				fill_char, fill_direction);

	}

	static public String fixLengthWithClientCharSetFromLeft(String in_str,
			int out_length, char fill_char) {
		return fixLengthWithClientCharSet(in_str, out_length, fill_char,
				FILLED_FROM_LEFT);
	}

	static public String fixLengthWithClientCharSetFromRight(String in_str,
			int out_length, char fill_char) {
		return fixLengthWithClientCharSet(in_str, out_length, fill_char,
				FILLED_FROM_RIGHT);
	}

	static public String fixDBLengthWithClientCharSet(String in_str,
			int db_length) {
		return CommUtil.fixLengthWithClientCharSet(in_str, db_length, ' ',
				FILLED_FROM_RIGHT);
	}

	static public String fixDBLengthWithClientCharSet(String in_str,
			int min_length, int max_length) {

		return CommUtil.fixLengthWithClientCharSet(in_str, min_length,
				max_length, ' ', FILLED_FROM_RIGHT);
	}

	public static String convertMonth2CN(String month_in) {
		try {
			if (month_in == null || month_in.trim().length() == 0) {
				return "";
			} else {
				return month_in.substring(0, 4) + "年"
						+ month_in.substring(4, 6) + "月";
			}
		} catch (Exception ex) {
			return month_in;
		}
	}

	// 输入格式"YYYYMMDD",输出"YYYY年MM月DD日"

	public static String convertDate2CN(String date_in) {
		try {
			if (date_in == null || date_in.trim().length() == 0) {
				return "";
			} else {
				return date_in.substring(0, 4) + "-" + date_in.substring(4, 6)
						+ "-" + date_in.substring(6, 8);
			}
		} catch (Exception ex) {
			return date_in;
		}
	}

	public static String convertTime2CN(String time_in) {
		try {
			if (time_in == null || time_in.trim().length() == 0) {
				return "";
			} else {
				return time_in.substring(0, 2) + ":" + time_in.substring(2, 4)
						+ ":" + time_in.substring(4, 6);
			}
		} catch (Exception ex) {
			return time_in;
		}

	}

	public static String convertDateTime2CN(String datetime_in) {
		try {
			if (datetime_in == null || datetime_in.trim().length() == 0) {
				return "";
			} else {
				return datetime_in.substring(0, 4) + "-"
						+ datetime_in.substring(4, 6) + "-"
						+ datetime_in.substring(6, 8) + " "
						+ datetime_in.substring(8, 10) + ":"
						+ datetime_in.substring(10, 12) + ":"
						+ datetime_in.substring(12, 14);
			}
		} catch (Exception ex) {
			return datetime_in;
		}

	}

	public static int getClientCharBytes(String in_str) {
		try {
			return in_str.getBytes(CLIENT_CHARSET).length;
		} catch (Exception ex) {
			return 0;
		}
	}

	public static String convertYuan2Fen(String yuan_amt_str) {
		try {
			// BigDecimal必须要用String构造
			BigDecimal yuan_amt = new BigDecimal(yuan_amt_str);
			BigDecimal fen_amt = yuan_amt.multiply(new BigDecimal("100"))
					.setScale(0, BigDecimal.ROUND_HALF_UP);
			return fen_amt.toString();
		} catch (Exception ex) {
			return "";
		}
	}

	public static String convertFen2Yuan(String fen_amt_str) {
		try {
			if (fen_amt_str != null) {
				BigDecimal fen_amt = new BigDecimal(fen_amt_str);
				BigDecimal yuan_amt = fen_amt.divide(new BigDecimal("100"), 2,
						BigDecimal.ROUND_HALF_UP);
				return yuan_amt.toString();
			} else
				return "";
		} catch (Exception ex) {
			return "";
		}
	}

	public static String convert(String fen_amt_str) {
		try {
			BigDecimal fen_amt = new BigDecimal(fen_amt_str);
			BigDecimal yuan_amt = fen_amt.divide(new BigDecimal("1000000"), 2,
					BigDecimal.ROUND_HALF_UP);
			return yuan_amt.toString();
		} catch (Exception ex) {
			return "";
		}
	}

	public static String convertInteger2String(Integer param_in) {
		try {
			if (param_in == null) {
				return "";
			} else {
				return param_in.toString();
			}
		} catch (Exception ex) {
			return "";
		}
	}

	// 今天星期几
	public static String whatDay(String date) {
		try {

			int year = new Integer(date.substring(0, 4)).intValue();
			int month = new Integer(date.substring(4, 6)).intValue();
			int day = new Integer(date.substring(6, 8)).intValue();
			System.out.println(year);
			System.out.println(month);
			System.out.println(day);

			Calendar cal = Calendar.getInstance();
			cal.set(year, month - 1, day);

			return new Integer(cal.get(cal.DAY_OF_WEEK)).toString();

		} catch (Exception e) {
			LOGGER.error(null, e);

			return "";

		}

	}

	@Deprecated
	public static String getProperty(String key) {
		Properties p = new Properties();
		try {
			p.load(CommUtil.class.getClassLoader().getResourceAsStream(
					"server.properties"));
			return p.getProperty(key);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
			return null;
		}
	}

	public static boolean compare(String low_sum, String high_sum) {
		try {

			int low = new Integer(low_sum).intValue();
			int high = new Integer(high_sum).intValue();
			if (low < high) {
				return false;
			} else {
				return true;
			}

		} catch (Exception e) {
			LOGGER.error(null, e);

			return false;

		}

	}

	// MD5加密方法
	public static String str;

	public static String md5s(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		return str;
	}

	public static String getPreviousWeekSunday(String str) throws Exception {
		GregorianCalendar currentDate = new GregorianCalendar();
		currentDate.setTime(DateUtils.parseDate(str,
				new String[] { "yyyyMMdd" }));
		int mondayPlus = dayOfWeek(str); // currentDate.DAY_OF_WEEK;
		currentDate.add(currentDate.DATE, 0 - mondayPlus);
		Date monday = currentDate.getTime();
		return DateFormatUtils.format(monday, "yyyyMMdd");
	}

	public static String string2Double(Double d) {

		return new DecimalFormat("#0.00").format(d);

	}

	public static String getImplicitPhone(String str) {
		return getImplicitString(str, 3, 4, "*");
	}

	public static String getImplicitCardNo(String str) {
		return getImplicitString(str, 6, 4, "*");
	}

	public static String getImplicitString(String str, int rightLength,
			int leftLength, String fillStr) {
		String resStr = "";
		int fillLength = 0;
		try {
			if (str == null) {
				return "";
			} else if (str.length() > (rightLength + leftLength)) {
				for (int i = 0; i < str.length() - (rightLength + leftLength); i++) {
					fillStr += fillStr;
					fillLength++;
				}
				resStr = str.substring(0, rightLength)
						+ fillStr
						+ str.substring(str.length()
								- (rightLength + fillLength), str.length());
			} else if (str.length() > rightLength) {
				for (int i = 0; i < str.length() - rightLength; i++) {
					fillStr += fillStr;
				}
				resStr = str.substring(0, rightLength) + fillStr;
			} else if (str.length() < rightLength && str.length() > leftLength) {
				for (int i = 0; i < str.length() - leftLength; i++) {
					fillStr += fillStr;
					fillLength++;
				}
				resStr = fillStr
						+ str.substring(str.length() - fillLength, str.length());
			} else {
				resStr = str;
			}

		} catch (Exception ex) {
			return "";
		}
		return resStr;

	}

	/**
	 * 补齐字符串
	 * 
	 * @param value
	 *            原字符串
	 * @param size
	 *            补齐的长度
	 * @param fillStr
	 *            用什么补齐
	 * @param direct
	 *            补齐的方向，1是右，0是左
	 * @return
	 */
	public static String fill(String value, int size, String fillStr, int direct) {
		if (value == null) {
			return value;
		}
		int lenOfValue = value.length();
		int lenOfFill = size - lenOfValue;
		if (lenOfFill <= 0)
			return value;
		byte[] fills = new byte[lenOfFill];
		Arrays.fill(fills, fillStr.getBytes()[0]);

		if (direct == 0) {
			return new String(fills) + value;
		}
		return value + new String(fills);
	}
	
	 /**   
     * 将元为单位的转换为分 替换小数点，支持以逗号区分的金额  
     *   
     * @param amount  
     * @return  
     */    
    public static String changeY2F(String amount){    
        String currency =  amount.replaceAll("\\$|\\￥|\\,", "");  //处理包含, ￥ 或者$的金额    
        int index = currency.indexOf(".");    
        int length = currency.length();    
        Long amLong = 0l;    
        if(index == -1){    
            amLong = Long.valueOf(currency+"00");    
        }else if(length - index >= 3){    
            amLong = Long.valueOf((currency.substring(0, index+3)).replace(".", ""));    
        }else if(length - index == 2){    
            amLong = Long.valueOf((currency.substring(0, index+2)).replace(".", "")+0);    
        }else{    
            amLong = Long.valueOf((currency.substring(0, index+1)).replace(".", "")+"00");    
        }    
        return amLong.toString();    
    }    

}
