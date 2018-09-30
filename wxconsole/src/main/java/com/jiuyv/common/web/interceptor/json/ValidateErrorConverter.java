package com.jiuyv.common.web.interceptor.json;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import net.sf.json.JSONObject;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.interceptor.IConverter;
import com.jiuyv.common.web.interceptor.ext.ErrorMap;
import com.jiuyv.common.ExtDataUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.TextProvider;
import com.opensymphony.xwork2.TextProviderFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ValidateErrorConverter.
 * 
 * @version 0.1
 * @author cowyk
 *         <h2>The Class ValidateErrorConverter.</h2>
 *         <p>
 *         这个类做的是简单的将一个MAP类型的错误信息转换成JSON数据格式。<br />
 *         这个error map 通常由Struts2的框架产生，其中的value已经是 国际化后的字符串。
 *         </p>
 */
public class ValidateErrorConverter implements IConverter, Serializable,
		LocaleProvider {

	/**
	 * SerialVersionUID.
	 */
	private static final long serialVersionUID = -95655507928391470L;

	/** The Constant UNKNOWN_ERR. */
	private static final String UNKNOWN_ERR = "common.error.unknown.errors";

	/** TextProvider 对象，用于取出Struts ResourceBundle中的国际化信息. */
	private final transient TextProvider textProvider = new TextProviderFactory()
			.createInstance(getClass(), this);

	/**
	 * 将Object转换为JSON字符串.
	 * 
	 * @param attrObj
	 *            需要转换的object 对象， 在这里只对java.util.Map类型进行处理
	 * 
	 * @return 通常为一个可以解析的JSONString
	 */
	public Object convertFromAttrObject(Object attrObj) {
		ExtData data = null;

		if (attrObj != null && attrObj instanceof Map) {
			Map errors = (Map) attrObj;
			ErrorMap errMap = new ErrorMap();
			for (Iterator iterator = errors.keySet().iterator(); iterator
					.hasNext();) {
				// get the key such as className.fieldName
				String key = String.valueOf(iterator.next());
				String value = String.valueOf(errors.get(key));
				int tmp = key.indexOf(".");
				if (tmp == -1) {
					tmp = 0;
				} else if (tmp < key.length()) {
					tmp += 1;
				}
				// change the key to fieldName
				errMap.addError(key.substring(tmp), value);
			}
			data = ExtDataUtil.genWithErrors(errMap.getErrorCol());
		}
		// data is null
		if (data == null) {
			data = ExtDataUtil.genWithExceptions(textProvider.getText(UNKNOWN_ERR));
		}
		String jsonStr = JSONObject.fromObject(data).toString();
		return jsonStr;
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
