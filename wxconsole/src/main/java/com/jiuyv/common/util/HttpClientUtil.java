package com.jiuyv.common.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author zhangy
 *
 */
public class HttpClientUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(HttpClientUtil.class);
	
	private HttpClient httpclient;

	public void setHttpclient(HttpClient httpclient) {
		this.httpclient = httpclient;
	}

	public HttpClientUtil() {

	}

	/**
	 * 测试
	 * 
	 * @return
	 */
	private HttpClient getHttpClient() {
		// 此处运用连接池技术。
		MultiThreadedHttpConnectionManager manager = new MultiThreadedHttpConnectionManager();

		manager.getParams().setMaxTotalConnections(2);
		// 使用连接池技术创建HttpClient对象
		HttpClient client = new HttpClient(manager);
		// 设置超时时间
		client.getHttpConnectionManager().getParams().setConnectionTimeout(30);

		return client;
	}

	/**
	 * 以get方式发送http请求
	 * 
	 * @param url
	 * @return
	 */
	public String sendRequest(String url) {
		GetMethod getMethod = new GetMethod(url);
		try {
			getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
					new DefaultHttpMethodRetryHandler());

			httpclient.executeMethod(getMethod);

			return getMethod.getResponseBodyAsString();
		} catch (Exception e) {
			LOGGER.error("", e);
			return "FAIL";
		} finally {
			getMethod.releaseConnection();
		}
	}

	/**
	 * 发送XML
	 * 
	 * @param url
	 * @param xml
	 * @return
	 */
	public String sendXMLRequest(String url, String xml) throws Exception{
		EntityEnclosingMethod httpMethod = new PostMethod(url);
		try {
			httpMethod.setRequestHeader("content-type",
					"text/xml; charset=UTF-8");
			RequestEntity entity = new StringRequestEntity(xml, "text/xml",
					"UTF-8");
			httpMethod.setRequestEntity(entity);
			httpclient.executeMethod(httpMethod);

			String responseXml = null;
			byte[] resBody = httpMethod.getResponseBody();
			if (null == resBody || 0 == resBody.length)
				responseXml = httpMethod.getResponseBodyAsString();
			else
				responseXml = new String(resBody, "GB2312");

			return responseXml;
		} catch (Exception e) {
			LOGGER.error("", e);
			throw e;
		} finally {
			httpMethod.releaseConnection();
		}
	}

	/**
	 * 验证请求是否是本机发出
	 * 
	 * @param request
	 *            true本机发出 false非本机发出
	 * @return
	 */
	public static boolean isRequestFromSelf(HttpServletRequest request) {
		if (getRemoteIpAddr(request).equals(getLocalIpAddr()))
			return true;
		else
			return false;
	}

	/**
	 * 获取远程客户端IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getRemoteIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("Proxy-Client-IP");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("WL-Proxy-Client-IP");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("HTTP_CLIENT_IP");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			ip = request.getRemoteAddr();

		if ("0:0:0:0:0:0:0:1".equals(ip.trim()))
			ip = "server";

		// 判断请求是否是本机发出,如果是本机发出,那么就获取本机地址
		if ("127.0.0.1".equals(ip) || ip.equalsIgnoreCase("localhost"))
			ip = getLocalIpAddr();

		return ip;
	}

	/**
	 * 获取本机IP地址
	 * 
	 * @return
	 */
	public static String getLocalIpAddr() {
		try {
			Enumeration<?> netInterfaces = NetworkInterface
					.getNetworkInterfaces();
			InetAddress ip = null;
			String ipAddr = null;
			while (netInterfaces.hasMoreElements()) {
				NetworkInterface ni = (NetworkInterface) netInterfaces
						.nextElement();
				ip = (InetAddress) ni.getInetAddresses().nextElement();
				if (!ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
						&& ip.getHostAddress().indexOf(":") == -1) {
					ipAddr = ip.getHostAddress();
					break;
				}
			}
			return ipAddr;
		} catch (SocketException e) {
			LOGGER.error("", e);
			return null;
		} catch (Exception e) {
			LOGGER.error("", e);
			return null;
		}
	}

	/**
	 * 判断某回调地址是否是指定的网关地址
	 * 
	 * @param notifyUrl
	 * @param getwayList
	 * @return true 是网关 false不是网关地址
	 */
	public static boolean isLocalNotifyUrl(String notifyUrl, List<?> getwayList) {
		boolean flag = false;
		for (Object object : getwayList) {
			String getway = (String) object;
			if (notifyUrl.toLowerCase().contains(getway)) {
				flag = true;
				break;
			}
		}
		return flag;
	}

	public static void main(String[] args) {
		HttpClientUtil u = new HttpClientUtil();
		u.getHttpClient();
	}

}
