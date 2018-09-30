package com.jiuyv.common.web.converter;

import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.util.StrutsTypeConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 0.1
 * @author cowyk
 *         <h2>The Class GeneralJSONConverter.</h2>
 *         <p>
 *         普通的JSONString转换类。需要在xwork-conversion.properties或各个独立 的配置文件中加入属性。<br />
 *         如：gemini.Castle=com.jiuyv.expo.web.converter.GeneralJSONConverter
 *         <br/> &lt;类型全名&gt;=&lt;转换器全名&gt;
 *         </p>
 */
public class GeneralJSONConverter extends StrutsTypeConverter {

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(GeneralJSONConverter.class);
	
	/** json config */
	private static final JsonConfig CONFIG = new JsonConfig();
	
	static {
		CONFIG.setJsonPropertyFilter(new PropertyFilter(){
			public boolean apply(Object source, String name, Object value) {
				if ( value != null && value instanceof String && "".equals(String.valueOf(value).trim()) ){
					return true;
				}
				return false;
			}			
		});
	}
	/**
	 * Convert from String. (non-Javadoc)
	 * 
	 * @param context
	 *            context
	 * @param values
	 *            values in parameters
	 * @param toType
	 *            target Class type
	 * @return Object target object
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map,
	 *      java.lang.String[], java.lang.Class)
	 */
	public Object convertFromString(Map context, String[] values, Class toType) {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("convertFromString(Map, String[], Class) - start");
		}
		// toType null check
		if (toType == null) {
			return null;
		}
		// get default value in the first element
		String jsonStr = null;
		if (values == null || values.length < 1) {
			jsonStr = "{}";
		} else {
			jsonStr = values[0];
		}
		// convert String to Object
		JSONObject jsonObj = JSONObject.fromObject(jsonStr, CONFIG);
		Object obj = JSONObject.toBean(jsonObj, toType);

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("convertFromString(Map, String[], Class) - end");
		}
		return obj;
	}

	/**
	 * Convert to String. (non-Javadoc)
	 * 
	 * @param context
	 *            context
	 * @param o
	 *            Object in action
	 * @return String convert from object to string
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map,
	 *      java.lang.Object)
	 */
	public String convertToString(Map context, Object o) {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("convertToString(Map, Object) - start");
		}

		if (o == null) {
			return null;
		}
		String jsonStr = JSONObject.fromObject(o).toString();

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("convertToString(Map, Object) - end");
		}
		return jsonStr;
	}

}
