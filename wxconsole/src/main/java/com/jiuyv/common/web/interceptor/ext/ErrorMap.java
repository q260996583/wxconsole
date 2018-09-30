package com.jiuyv.common.web.interceptor.ext;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.jiuyv.common.ibatis.vo.ErrorClass;

// TODO: Auto-generated Javadoc
/**
 * The Class ErrorMap.
 */
public class ErrorMap extends HashMap<String, ErrorClass> implements
		Map<String, ErrorClass> {

	/**
	 * Adds the error.
	 * 
	 * @param rowNum
	 *            the row num
	 * @param id
	 *            the id
	 * @param msg
	 *            the msg
	 */
	public void addError(int rowNum, String id, String msg) {
		if (id == null) {
			return;
		}
		ErrorClass error = new ErrorClass();
		error.setId(id);
		error.setMsg(msg);
		error.setRowNum(rowNum);
		String key = String.valueOf(id + rowNum);
		ErrorClass tmp = get(key);
		if (tmp == null) {
			put(key, error);
		} else {
			tmp.setMsg(tmp.getMsg() + "," + msg);
		}
	}

	/**
	 * Adds the error.
	 * 
	 * @param id
	 *            the id
	 * @param msg
	 *            the msg
	 */
	public void addError(String id, String msg) {
		addError(-1, id, msg);
	}

	/**
	 * Gets the error col.
	 * 
	 * @return the error col
	 */
	public Collection<ErrorClass> getErrorCol() {
		return values();
	}
}
