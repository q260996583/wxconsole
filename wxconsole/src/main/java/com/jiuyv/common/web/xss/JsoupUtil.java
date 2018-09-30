package com.jiuyv.common.web.xss;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class JsoupUtil {
	/**
	 * 对用户输入内容进行过滤
	 * @param html
	 * @return
	 */
	public static String filterUserInputContent(String html) {
		if (StringUtils.isBlank(html)){
			return "";
		}
		return Jsoup.clean(html, Whitelist.basic());
	}
}
