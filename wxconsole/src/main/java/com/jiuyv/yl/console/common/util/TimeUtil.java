package com.jiuyv.yl.console.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 
 * 
 * @author xiang.xiao
 * @version $Id: TimeUtil.java, v 0.1 2015年12月10日 下午12:04:22 xiang.xiao Exp $
 */
public class TimeUtil {

    private static final String fullTime = "yyyyMMddHHmmss";
    private static final String date     = "yyyyMMdd";
    private static final String time     = "HHmmss";
    private static final String lineDate = "yyyy-MM-dd";
    private static final String lineTime     = "HH:mm:ss";

    /**
     * 
     * <h2>返回yyyyMMddHHmmss格式的系统当前时间格式字符串</h2>
     * @return 当前系统时间
     */
    public static String getCurrentDateTime() {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(fullTime);
        return dateFormat.format(now.getTime());
    }

    /**
     * 
     * <h2>返回HHmmss格式的系统当前时间格式字符串</h2>
     * @return 当前系统时间
     */
    public static String getCurrentTime() {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(time);
        return dateFormat.format(now.getTime());
    }
    
    /**
     * 
     * <h2>返回HHmmss格式的系统当前时间格式字符串</h2>
     * @return 当前系统时间
     */
    public static String getCurrentLineTime() {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(lineTime);
        return dateFormat.format(now.getTime());
    }

    /**
     * 
     * <h2>返回yyyyMMdd格式的系统当前日期格式字符串</h2>
     * @return 当前系统时间
     */
    public static String getCurrentDate() {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(date);
        return dateFormat.format(now.getTime());
    }
    
    /**
     * 
     * @return
     */
    public static String getCurrentLineDate() {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(lineDate);
        return dateFormat.format(now.getTime());
    }

    /**
     * 
     * <h2>获取当前时间相差num时间段的时间串，格式为yyyyMMdd</h2>
     * @param num 相差时间 可以为负数
     * @param type 时间类型，为Calendar里的类型
     * @return 时间串
     */
    public static String getAnotherDate(int num, int type) {
        Calendar another = Calendar.getInstance();
        another.add(type, num);
        SimpleDateFormat dateFormat = new SimpleDateFormat(date);
        return dateFormat.format(another.getTime());
    }

    /**
     * 
     * <h2>获取当前时间相差num时间段的时间串，格式为yyyyMMddHHmmss</h2>
     * @param num 相差时间 可以为负数
     * @param type 时间类型，为Calendar里的类型
     * @return 时间串
     */
    public static String getAnotherDateTime(int num, int type) {
        Calendar another = Calendar.getInstance();
        another.add(type, num);
        SimpleDateFormat dateFormat = new SimpleDateFormat(fullTime);
        return dateFormat.format(another.getTime());
    }

    /**
     * 
     * <h2>获取指定时间相差num时间段的时间串，格式为yyyyMMddHHmmss</h2>
     * @param specifyTimeStr 指定时间串，要求格式为yyyyMMddHHmmss
     * @param num 相差时间 可以为负数
     * @param type 时间类型，为Calendar里的类型
     * @return 时间串
     */
    public static String getSpecifyAnotherTime(String specifyTimeStr, int num, int type) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(fullTime);
        String timeStr = null;
        try {
            Calendar specifyCal = Calendar.getInstance();
            specifyCal.setTime(dateFormat.parse(specifyTimeStr));
            specifyCal.add(type, num);
            timeStr = dateFormat.format(specifyCal.getTime());
        } catch (ParseException e) {
            throw new RuntimeException("时间转换异常", e);
        }
        return timeStr;
    }

    /**
     * <h2>当前时间与指定时间串比较</h2>
     * @param specifyTimeStr 指定时间串格式为yyyyMMddHHmmss
     * @return 0 相等， 1 当前时间大于指定时间， -1 当前时间小于指定时间
     */
    public static int compareToSpecifyTime(String specifyTimeStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(fullTime);
            long specifyTimeLong = dateFormat.parse(specifyTimeStr).getTime();
            long nowTime = Calendar.getInstance().getTimeInMillis();
            if (specifyTimeLong < nowTime) {
                return 1;
            }
            if (specifyTimeLong > nowTime) {
                return -1;
            }
            return 0;
        } catch (Exception ex) {
            throw new RuntimeException("转换时间异常", ex);
        }
    }
}
