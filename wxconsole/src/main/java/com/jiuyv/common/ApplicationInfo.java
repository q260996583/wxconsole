package com.jiuyv.common;

import com.jiuyv.yl.console.security.entity.LogInfo;

/**
 * The Class ApplicationInfo.
 */
public class ApplicationInfo {

	/** 日志相关信息. */
	private static final ThreadLocal<LogInfo> LOG_INFO = new ThreadLocal<LogInfo>();
	
	/**
	 * 获取当前的日志有关信息.
	 * 主要存放的有操作日志的流水号，清算日期，数据库时间14位（当前线程中）。
	 * @return the log info
	 */
	public static LogInfo getLogInfo() {
		return LOG_INFO.get();
	}

	/**
	 * 存储日志有关信息.
	 * 
	 * @param logInfo the new log info
	 */
	public static void setLogInfo(LogInfo logInfo) {
		ApplicationInfo.LOG_INFO.set(logInfo);
	}
	
	/**
	 * 将当前线程中的对象 置空。
	 * 
	 */
	public static void clear() {
		ApplicationInfo.LOG_INFO.remove();
	}
}
