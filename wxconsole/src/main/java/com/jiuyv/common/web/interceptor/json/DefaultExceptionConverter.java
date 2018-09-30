package com.jiuyv.common.web.interceptor.json;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.exception.BussnissException;
import com.jiuyv.common.ibatis.vo.ErrorClass;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.interceptor.IConverter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.TextProvider;
import com.opensymphony.xwork2.TextProviderFactory;

/**
 * The Class DefaultExceptionConverter.
 * 
 * @version 0.1
 * @author <h2>The Class DefaultExceptionConverter.</h2>
 *         <p>
 *         </p>
 */
public class DefaultExceptionConverter implements IConverter, Serializable,
		LocaleProvider {

	/**
	 * SerialVersionUID.
	 */
	private static final long serialVersionUID = 691690103881470904L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(DefaultExceptionConverter.class);

	/** The Constant DEFAULT_SYS_ERR. */
	private static final String DEFAULT_SYS_ERR = "java.lang.Exception";

	private static final String UPLOAD_FILEMAX_ERR = "error.certificateImport.fileMax";

	/** The Constant UNKNOWN_ERR. */
	private static final String UNKNOWN_ERR = "common.error.unknown.exception";

	/** The text provider. */
	private final transient TextProvider textProvider = new TextProviderFactory()
			.createInstance(getClass(), this);

	/**
	 * 转换Exception到JSONString.
	 * 
	 * @param attrObj
	 *            源物件
	 * @return Object 目标物件
	 * @see com.jiuyv.common.web.interceptor.expo.web.interceptor.IConverter#convertFromAttrObject(java.lang.Object)
	 */
	public Object convertFromAttrObject(Object attrObj) {

		if (attrObj == null) {
			return null;
		}
		if (attrObj instanceof String) {
			return attrObj;
		}
		ExtData data = new ExtData();
		if (attrObj instanceof BaseException) {
			LOGGER.error("Base Exception ", (Exception) attrObj);
			BaseException be = (BaseException) attrObj;
			Collection errors = be.getErrorClasses();
			if (errors != null) {
				globalErrMsg(errors);
				data = ExtDataUtil.genWithErrors(
						textProvider.getText(be.getMessage()), errors);
			} else {
				data = ExtDataUtil.genWithExceptions(textProvider.getText(be
						.getMessage()));
			}
			return JSONObject.fromObject(data).toString();
		}

		if (attrObj instanceof BussnissException) {
			LOGGER.error("Base Exception ", (Exception) attrObj);
			BussnissException be = (BussnissException) attrObj;
			data = ExtDataUtil.genWithExceptions(textProvider.getText(be
					.getMessage()));
			return JSONObject.fromObject(data).toString();
		}

		if (attrObj instanceof Exception) {
			LOGGER.error("Base Exception ", (Exception) attrObj);
			data.setSuccess(false);
			data.setSyserr("系统异常");
			return JSONObject.fromObject(data).toString();
		}
		if (data == null) {
			data = ExtDataUtil.genWithExceptions(textProvider
					.getText(UNKNOWN_ERR));
		}
		return data;

		// if (attrObj instanceof SizeLimitExceededException){
		// LOGGER.error("SizeLimitExceededException error", (Exception)attrObj);
		// data = ExtDataUtil.genWithExceptions(textProvider
		// .getText(UPLOAD_FILEMAX_ERR));
		// return JSONObject.fromObject(data).toString();
		// }
		// // convert busincess exception
		// if (attrObj instanceof BaseException) {
		// LOGGER.error("Base Exception ", (Exception)attrObj);
		// BaseException be = (BaseException) attrObj;
		// Collection errors = be.getErrorClasses();
		// if ( errors != null ) {
		// globalErrMsg(errors);
		// data = ExtDataUtil.genWithErrors(textProvider
		// .getText(be.getMessage()), errors);
		// } else {
		// data = ExtDataUtil.genWithExceptions(textProvider
		// .getText(be.getMessage()));
		// }
		// return JSONObject.fromObject(data).toString();
		// }
		// if (attrObj instanceof BussnissException) {
		// LOGGER.error("Base Exception ", (Exception)attrObj);
		// BussnissException be = (BussnissException) attrObj;
		//
		// data = ExtDataUtil.genWithExceptions(textProvider
		// .getText(be.getMessage()));
		//
		// return JSONObject.fromObject(data).toString();
		// }
		//
		//
		// // convert system exception
		// if (attrObj instanceof Exception) {
		// LOGGER.error("System unknow error", (Exception)attrObj);
		// Exception be = (Exception) attrObj;
		// data = ExtDataUtil.genWithExceptions(textProvider
		// .getText(be.getMessage()));
		// return JSONObject.fromObject(data).toString();
		// }
		// // data is null
		// if (data == null) {
		// data =
		// ExtDataUtil.genWithExceptions(textProvider.getText(UNKNOWN_ERR));
		// }

	}

	/**
	 * Global err msg.
	 * 
	 * @param errors
	 *            the errors
	 */
	private void globalErrMsg(Collection<ErrorClass> errors) {
		for (Iterator<ErrorClass> iterator = errors.iterator(); iterator
				.hasNext();) {
			ErrorClass error = (ErrorClass) iterator.next();
			String errMsg = textProvider.getText(error.getMsg());
			error.setMsg(errMsg);
		}
	}

	/**
	 * 实现LocaleProvide方法.
	 * 
	 * @return Locale
	 */
	public Locale getLocale() {
		return ActionContext.getContext().getLocale();
	}
}
