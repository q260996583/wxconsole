package com.jiuyv.common.web.interceptor.json;

import java.util.Collection;
import java.util.Locale;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.ExtDataUtil;
import com.jiuyv.common.ibatis.vo.ErrorClass;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.interceptor.INotConvert;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.TextProvider;
import com.opensymphony.xwork2.TextProviderFactory;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;

/**
 * @version 0.1
 * @author cowyk The Class DefaultJSONInterceptor.
 */
public class DefaultJSONInterceptor extends AbstractInterceptor implements
		LocaleProvider {

	/**
	 * serial version uid.
	 */
	private static final long serialVersionUID = -7804608261306210274L;

	/** TextProvider 对象，用于取出Struts ResourceBundle中的国际化信息. */
	private final transient TextProvider textProvider = new TextProviderFactory()
			.createInstance(getClass(), this);

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(DefaultJSONInterceptor.class);

	/** The Constant RES_ARG. */
	public static final String RES_ARG = "resData";

	/**
	 * 将返回的request中的resData 转换为JSONString.
	 * 
	 * @param inv
	 *            ActionInvocation Object
	 * @return String Target Result
	 * @throws Exception
	 *             exception
	 * @see com.opensymphony.xwork2.interceptor.
	 * AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	public String intercept(ActionInvocation inv) throws Exception {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("intercept(ActionInvocation) - start");
		}

		    System.out.println("jsonintercept");
		inv.addPreResultListener(new PreResultListener() {
			public void beforeResult(ActionInvocation inv, String arg1) {
				if (LOGGER.isDebugEnabled()) {
					LOGGER
							.debug("beforeResult(ActionInvocation, String) - start");
				}

				// get current ActionContext object
				ActionContext ctx = inv.getInvocationContext();
				// get object in context object
				Object result = ctx.get(RES_ARG);
				// generate the ExtData with the object got from request
				ExtData data = null;
				if (result == null) {
					data = ExtDataUtil.genWithSingleData(result);
				}
				if (result != null && result instanceof ExtData) {
					data = (ExtData) result;
					genLocalErrorMsg(data.getErrors());
					genLocalSysErr(data);
				} 
				// convert ExtData object to JSON String
				String retStr = JSONObject.fromObject(data).toString();
				// convert tree node object to JSON string
				if (result != null && (result instanceof INotConvert || result instanceof String)) {
					retStr = result.toString();
				}
				// replace the Object with the JSON String
				ctx.put(RES_ARG, retStr);

				if (LOGGER.isDebugEnabled()) {
					LOGGER
							.debug("beforeResult(ActionInvocation, String) - end");
				}
			}
		});
		// invoke the action
		String retVal = inv.invoke();

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("intercept(ActionInvocation) - end");
		}
		return retVal;
	}

	/**
	 * 生成本地化的
	 * 
	 * @param errors 错误集合
	 * @return 
	 */
	private void genLocalErrorMsg(Collection<ErrorClass> errors) {
		if (errors == null || errors.size() == 0) {
			return;
		}
		for (ErrorClass error : errors) {
			error.setMsg(textProvider.getText(error.getMsg()));
		}
	}
	
	/**
	 * 生成本地化的错误信息
	 * @param data 返回对象
	 */
	private void genLocalSysErr(ExtData data) {
		if ( data != null && data.getSyserr() !=null ) {
			data.setSyserr(textProvider.getText(data.getSyserr().trim()));
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
