package com.jiuyv.common.ibatis;

public class SimpleDateCheck {


/**
 * 简单的日期转换类.
 */

    /** temp 数组的splite数量. */
    private static final int TEMP_TOKEN_SIZE = 3;

    /** 非数字表达式. */
    private static final String TOKEN_NOT_LETTER = "\\D";

    /** 空串. */
    private static final String TOKEN_EMPTY = "";

    /** The Constant DATE_8_LEN. */
    private static final int DATE_8_LEN = 10;

    /** 长时间格式分割后的字段数  */
    private static final int LONG_TIME_TOKENS = 6;

    /** 默认长日期时间长度 */
    private static final int DEFAULT_LONG_DATE_LEN = 14;

    /**
     * 转换类型格式 yyyy-mm-ddT00:00:00 到 yyyymmdd.
     * @param date  the date
     * @return the string
     */
    public static String parseDateFromVo2Db(String date) {
        if (!isNotBlank(date)) {
            return null;
        }

        String[] tmp = date.trim().split(TOKEN_NOT_LETTER);

        if (tmp.length < TEMP_TOKEN_SIZE) {
            return null;
        }

        return tmp[0] + tmp[1] + tmp[2];
    }

    /**
     * 把日期转为１４位数据库字符串
     * convert from type yyyy-mm-ddT00:00:00 to yyyymmddhhmiss.
     * @param date the date
     * @return the string
     */
    public static String parseDateFromVo2Db14(String date) {
        if (!isNotBlank(date)) {
            return null;
        }

        String[] tmp = date.trim().split(TOKEN_NOT_LETTER);

        if (tmp.length < LONG_TIME_TOKENS) {
            return null;
        }

        String resDate = date.trim().replaceAll(TOKEN_NOT_LETTER, TOKEN_EMPTY);

        if (resDate.length() != DEFAULT_LONG_DATE_LEN) {
            resDate = null;
        }

        return resDate;
    }
    
    /**
     * 把日期转为１４位数据库字符串
     * convert from type yyyy-mm-ddT00:00:00 to yyyymmddhhmiss.
     * @param date the date
     * @return the string
     */
    public static String parseDateFromVo2Db14(String date, String oper) {
        if (!isNotBlank(date)) {
            return null;
        }

        String[] tmp = date.trim().split(TOKEN_NOT_LETTER);

        if (tmp.length < LONG_TIME_TOKENS) {
            return null;
        }

        String resDate = date.trim().replaceAll(TOKEN_NOT_LETTER, TOKEN_EMPTY);

        if (resDate.length() != DEFAULT_LONG_DATE_LEN) {
            resDate = null;
        }
                
        if ( ">=".equals(oper) || ">".equals(oper)) {
        	resDate = resDate.substring(0, 8) + "000000";
        }
        if ( "<=".equals(oper) || "<".equals(oper)) {
        	resDate = resDate.substring(0, 8) + "235959";
        }

        return resDate;
    }    

    /**
     * 转换日期 .
     *
     * @param date
     *            the date
     * @param regex
     *            the regex
     *
     * @return the string
     */
 /*   private static String parseDate(String date, String regex) {
        if (!isNotBlank(date)) {
            return null;
        }

        String res = date.replaceAll(regex, "");

        return res;
    }*/

    /**
     * 转换日期 mm/dd/yyyy.
     *
     * @param date
     *            the date
     *
     * @return the string
     */
    public static String fromMDY2YMD(String date) {
        if (!isNotBlank(date)) {
            return null;
        }

        String temp = date.trim();
        String[] tmp = temp.split(TOKEN_NOT_LETTER);

        if (tmp.length < TEMP_TOKEN_SIZE) {
            return null;
        }

        return tmp[2] + tmp[0] + tmp[1];
    }

    /**
     * 判断字符串是否为空.
     *
     * @param token
     *            the token
     *
     * @return true, if checks if is not blank
     */
    public static boolean isNotBlank(String token) {
        if ((token == null) || TOKEN_EMPTY.equals(token.trim())) {
            return false;
        }

        return true;
    }
}
