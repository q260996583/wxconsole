package com.jiuyv.common.util;

import java.util.Collection;

import org.apache.commons.lang3.StringUtils;

import com.jiuyv.common.exception.BaseException;


/**
 * The Class BizCheck.
 *
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author cowyk
 * @since 2014-2-17 15:41:44
 * @version 1.0.0
 */
public abstract class BizCheck {

	/**
	 * 验证为非空对象.
	 *
	 * @param toChk the to chk
	 * @param errorCode 错误代码
	 * @param errorMsg 错误信息
	 * @throws BaseException the base exception
	 */
	public static void notNull(Object toChk, String errorCode, String errorMsg) throws BaseException {
		if ( toChk == null ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}

	/**
	 * 验证集合对象非空.
	 *
	 * @param toChk the to chk
	 * @param errorCode 错误代码
	 * @param errorMsg 错误信息
	 * @throws BaseException the base exception
	 */
	@SuppressWarnings("rawtypes")
	public static void notEmpty(Collection toChk, String errorCode, String errorMsg) throws BaseException {
		if ( toChk == null || toChk.size() == 0 ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}
	
	/**
	 * 验证字符串为非空串.
	 *
	 * @param toChk the to chk
	 * @param errorCode 错误代码
	 * @param errorMsg 错误信息
	 * @throws BaseException the base exception
	 */
	public static void notBlank(String toChk, String errorCode, String errorMsg) throws BaseException {
		if ( StringUtils.isBlank(toChk) ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}
	
	/**
	 * 验证对象相等 调用equals方法，为null时也报错.
	 *
	 * @param toChk the to chk
	 * @param target the target
	 * @param errorCode 错误代码
	 * @param errorMsg 错误信息
	 * @throws BaseException the base exception
	 */
	public static void same(Object toChk, Object target, String errorCode, String errorMsg) throws BaseException {
		if ( toChk == null || target ==  null ) {
			throw new BaseException(errorCode, errorMsg);
		}
		if ( !toChk.equals(target) ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}
	
	/**
	 * 验证对象相等 调用equals方法，为null时也报错.
	 *
	 * @param toChk the to chk
	 * @param target the target
	 * @param errorCode 错误代码
	 * @param errorMsg 错误信息
	 * @throws BaseException the base exception
	 */
	public static void in(Object toChk, Object[] targetArr, String errorCode, String errorMsg) throws BaseException {
		if ( toChk == null || targetArr ==  null ) {
			throw new BaseException(errorCode, errorMsg);
		}
		for ( Object target : targetArr) {
			if ( toChk.equals(target) ) {
				return ;
			}
		}
		throw new BaseException(errorCode, errorMsg);
	}
	
	/**
	 * 验证对象不相等 调用equals方法，比较对象相同时报错,
	 * 为null时也报错.
	 *
	 * @param toChk the to chk
	 * @param target the target
	 * @param errorCode the error code
	 * @param errorMsg the error msg
	 * @throws BaseException the base exception
	 */
	public static void notSame(Object toChk, Object target, String errorCode, String errorMsg) throws BaseException {
		if ( toChk == null || target ==  null ) {
			throw new BaseException(errorCode, errorMsg);
		}
		if ( toChk.equals(target) ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}

	/**
	 * 验证结果为True, false时抛出异常.
	 *
	 * @param toChk the to chk
	 * @param errorCode the error code
	 * @param errorMsg the error msg
	 * @throws BaseException the base exception
	 */
	public static void isTrue(boolean toChk, String errorCode,
			String errorMsg) throws BaseException  {
		if ( !toChk ) {
			throw new BaseException(errorCode, errorMsg);
		}
	}
	
	/**
	 * 返回第一个非Null的值
	 * @param ts
	 * @return
	 */
	public static <T> T defaultValue(T... ts) {
		if ( ts != null ) {
			for( T t : ts ) {
				if ( t != null ) {
					return t;
				}
			}
		}
		return null;
	}
	
}
