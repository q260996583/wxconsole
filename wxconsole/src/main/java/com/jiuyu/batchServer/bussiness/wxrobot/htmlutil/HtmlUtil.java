package com.jiuyu.batchServer.bussiness.wxrobot.htmlutil;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.MimetypesFileTypeMap;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.util.Cookie;

public class HtmlUtil {
	
	public static byte[] requestByPost2(String uri, String param, Set<Cookie> COOKIESET) {
		HttpURLConnection httpURLConnection = null;
		try {
        	URL url = new URL(uri);
            httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");// 提交模式
            httpURLConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            httpURLConnection.setRequestProperty("Connection", "Keep-Alive");
            // conn.setConnectTimeout(10000);//连接超时 单位毫秒
            // conn.setReadTimeout(2000);//读取超时 单位毫秒
            // 发送POST请求必须设置如下两行
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            if(null != COOKIESET) {
            	Iterator Cookieiter = COOKIESET.iterator();
            	while(Cookieiter.hasNext()) {
            		httpURLConnection.addRequestProperty("Cookie", Cookieiter.next().toString());
            	}
            }
            // 获取URLConnection对象对应的输出流
            OutputStream outs = httpURLConnection.getOutputStream();
            // 发送请求参数
            //printWriter.write(param);//post的参数 xx=xx&yy=yy
            //printWriter.print(param);
            outs.write(param.getBytes("UTF-8"));
            outs.flush();
            // flush输出流的缓冲
            //printWriter.flush();
            String cookie = httpURLConnection.getHeaderField("set-cookie");
            System.out.println("cookie:::::::::::::" + cookie);
            int repCode  = httpURLConnection.getResponseCode();
            System.out.println(repCode);
            //开始获取数据
            byte[] retB = changeInputStream(httpURLConnection.getInputStream());
            httpURLConnection.disconnect();
            return retB;
        } catch (Exception e) {
        	if(null != httpURLConnection) {
        		httpURLConnection.disconnect();
        	}
            e.printStackTrace();
        }
        return null;
	}
	//public static Set<Cookie> COOKIESET = null;
	public static byte[] requestByPost(String uri, String param, Set<Cookie> COOKIESET) {
		HttpURLConnection httpURLConnection = null;
		try {
        	URL url = new URL(uri);
            httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("POST");// 提交模式
            httpURLConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            httpURLConnection.setRequestProperty("Connection", "Keep-Alive");
            // conn.setConnectTimeout(10000);//连接超时 单位毫秒
            // conn.setReadTimeout(2000);//读取超时 单位毫秒
            // 发送POST请求必须设置如下两行
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            if(null != COOKIESET) {
            	Iterator Cookieiter = COOKIESET.iterator();
            	while(Cookieiter.hasNext()) {
            		httpURLConnection.addRequestProperty("Cookie", Cookieiter.next().toString());
            	}
            }
            // 获取URLConnection对象对应的输出流
            PrintWriter printWriter = new PrintWriter(httpURLConnection.getOutputStream());
            // 发送请求参数
            //printWriter.write(param);//post的参数 xx=xx&yy=yy
            printWriter.print(param);
            // flush输出流的缓冲
            printWriter.flush();
            String cookie = httpURLConnection.getHeaderField("set-cookie");
            System.out.println("cookie:::::::::::::" + cookie);
            int repCode  = httpURLConnection.getResponseCode();
            System.out.println(repCode);
            //开始获取数据
            byte[] retB = changeInputStream(httpURLConnection.getInputStream());
            httpURLConnection.disconnect();
            return retB;
        } catch (Exception e) {
        	if(null != httpURLConnection) {
        		httpURLConnection.disconnect();
        	}
            e.printStackTrace();
        }
        return null;
	}
	
	public static byte[] requestByGet(String uri, Set<Cookie> COOKIESET) {
		WebClient client = null;
        try {
        	// 创建浏览器，可以选择IE、FF等等
    		client = new WebClient();
    		client.addRequestHeader("Connection", "Keep-Alive");
    		//htmlunit 对css和javascript的支持不好，所以请关闭之
    		client.getOptions().setJavaScriptEnabled(false);
    		client.getOptions().setCssEnabled(false);
    		client.getCookieManager().setCookiesEnabled(true);
    		 if(null != COOKIESET) {
	    		 Iterator<Cookie> COOKIESETIterator = COOKIESET.iterator();
	    		 while(COOKIESETIterator.hasNext()) {
	    			 client.getCookieManager().addCookie(COOKIESETIterator.next());
	    		 }
	    	 }
    		 System.setProperty("jsse.enableSNIExtension", "false");
    		// 获取某网站页面
    		Page loginPage = client.getPage(uri);
			Set<Cookie> set = client.getCookieManager().getCookies();
			if(!set.isEmpty()){
//				COOKIESET = set;
//				Iterator<String> it = set.iterator();  
				Iterator<Cookie> iterator = set.iterator();
				while (iterator.hasNext()) {  
					Cookie cookie = iterator.next();  
					COOKIESET.add(cookie);
				} 
		    }
    		InputStream inputStream = loginPage.getWebResponse().getContentAsStream();
    		byte[] tempBype = changeInputStream(inputStream);
    		//client.closeAllWindows();
    		client.close();
    		return tempBype;
        } catch (Exception e) {
        	if(null != client) {
        		client.close();
        	}
            e.printStackTrace();
        }
        return null;
	}
	
	public static byte[] requestByGetSync(String uri) {
		URL url = null;
        try {
            url = new URL(uri);
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("GET");// 提交模式
            // conn.setConnectTimeout(10000);//连接超时 单位毫秒
            // conn.setReadTimeout(2000);//读取超时 单位毫秒
            // 发送POST请求必须设置如下两行
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            //PrintWriter printWriter = new PrintWriter(httpURLConnection.getOutputStream());
            // 发送请求参数
            //printWriter.write(param);//post的参数 xx=xx&yy=yy
            // flush输出流的缓冲
           // printWriter.flush();
            
            int repCode  = httpURLConnection.getResponseCode();
            System.out.println(repCode);
            //开始获取数据
            return changeInputStream(httpURLConnection.getInputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}
	
	public static byte[] changeInputStream(InputStream inputStream) {
		// TODO Auto-generated method stub
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		int len = 0;
		byte[] date = new byte[1024];
		try {
			while ((len = inputStream.read(date)) != -1) {
				outputStream.write(date, 0, len);
			}
			return outputStream.toByteArray();
			//result = new String(outputStream.toByteArray(), encode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				outputStream.close();
				inputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String post(String url, Map<String, String> params) {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		String body = null;

		HttpPost post = postForm(url, params);

		body = invoke(httpclient, post);

		httpclient.getConnectionManager().shutdown();

		return body;
	}

	private static HttpPost postForm(String url, Map<String, String> params) {

		HttpPost httpost = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();

		Set<String> keySet = params.keySet();
		for (String key : keySet) {
			nvps.add(new BasicNameValuePair(key, params.get(key)));
		}

		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return httpost;
	}

	private static String invoke(DefaultHttpClient httpclient,
			HttpUriRequest httpost) {

		HttpResponse response = sendRequest(httpclient, httpost);
		String body = paseResponse(response);

		return body;
	}

	private static HttpResponse sendRequest(DefaultHttpClient httpclient,
			HttpUriRequest httpost) {
		HttpResponse response = null;

		try {
			response = httpclient.execute(httpost);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response;
	}

	private static String paseResponse(HttpResponse response) {
		HttpEntity entity = response.getEntity();

		String charset = EntityUtils.getContentCharSet(entity);

		String body = null;
		try {
			body = EntityUtils.toString(entity);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return body;
	}

	public static String getCookie(String name, Set<Cookie> COOKIESET) {
		String ret = "";
		 if(null != COOKIESET) {
         	Iterator Cookieiter = COOKIESET.iterator();
         	while(Cookieiter.hasNext()) {
         		Cookie cok = (Cookie)Cookieiter.next();
         		if(name.equals(cok.getName())) {
         			return cok.getValue();
         		}
         	}
         }
		 return  ret;
	}
    public static void main(String[] args) {
//		String tulingKey = "056915e71cbe43a880c2f39ad34bf357";
//		String url = "http://www.tuling123.com/openapi/api";
//		TuLingDTO dto = new TuLingDTO();
//		dto.setKey(tulingKey);
//		dto.setUserid("123456");
//		dto.setInfo("你男的女的？");
//		JSONObject json = JSONObject.fromObject(dto);
//		System.out.println(json.toString());
//		byte ret[] = HtmlUtil.requestByPost(url, json.toString());
//		System.out.println(new String(ret));
//    	System.out.println(HtmlUtil.getUploadParam(
//    			"WebKitFormBoundaryAvgRCrlH4maPrMi2", new File("D:\\home\\heheh.jpg"), 
//    			"{'123':'132'}", "99999999"));
//    	System.out.println(HtmlUtil.getRandomCharAndNumr(16));
//    	SimpleDateFormat format =  
//    			 new SimpleDateFormat("EEE MMM dd yyyy hh:mm:ss z",Locale.ENGLISH);
//    	File file = new File("heheh.jpg");
//    	String fileType = new MimetypesFileTypeMap().getContentType(file);
//    	System.out.println(fileType);
	}
    
    /**
	 * 模拟form表单的形式 ，上传文件 以输出流的形式把文件写入到url中，然后用输入流来获取url的响应
	 * 
	 * @param url
	 *            请求地址 form表单url地址
	 * @param filePath
	 *            文件在服务器保存路径
	 * @return String url的响应信息返回值
	 * @throws IOException
	 */
	public static String send(String url, String filePath, String uploadmediarequest, 
			String pass_ticket, Set<Cookie> COOKIESET) throws IOException {

		String result = null;

		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在");
		}

		/**
		 * 第一部分
		 */
		URL urlObj = new URL(url);
		// 连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
		/**
		 * 设置关键值
		 */
		con.setRequestMethod("POST"); // 以Post方式提交表单，默认get方式
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); // post方式不能使用缓存
		// 设置请求头信息
		con.setRequestProperty("Accept-Encoding", "gzip, deflate");
		con.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8");
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");
		con.setRequestProperty("Content-Length", file.length()+"");
		// 设置边界
		String BOUNDARY = "----WebKitFormBoundary"+HtmlUtil.getRandomCharAndNumr(16);
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary="
				+ BOUNDARY);
		con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36");
		// 请求正文信息

		String sb = HtmlUtil.getUploadParam(BOUNDARY, file, uploadmediarequest, pass_ticket, COOKIESET);
		byte[] head = sb.toString().getBytes("utf-8");

		// 获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		// 输出表头
		out.write(head);
		// 文件正文部分
		// 把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();
		// 结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线

		out.write(foot);
		out.flush();
		out.close();
		
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		try {
			// 定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				// System.out.println(line);
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			System.out.println("发送POST请求出现异常！" + e);
			e.printStackTrace();
			throw new IOException("数据读取异常");
		} finally {
			if (reader != null) {
				reader.close();
			}
			if(null != con) {
				con.disconnect();
			}
		}
		System.out.println(result);
		return result;
	}

	private static String getUploadParam(String BOUNDARY, File file, String uploadmediarequest, 
			String pass_ticket, Set<Cookie> COOKIESET) {
		String fileType = new MimetypesFileTypeMap().getContentType(file);
		// 第一部分：
		StringBuilder sb = new StringBuilder();
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"id\"\r\n\r\n");
		sb.append("WU_FILE_0\r\n");
		//param2
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"name\"\r\n\r\n");
		sb.append(file.getName()+"\r\n");
		//param3
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"type\"\r\n\r\n");
		sb.append(fileType+"\r\n");
		//param4
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"lastModifiedDate\"\r\n\r\n");
		sb.append("Tue Dec 27 2016 16:35:28 GMT+0800\r\n");
		//param5
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"size\"\r\n\r\n");
		sb.append(file.length()+"\r\n");
		//param6
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"mediatype\"\r\n\r\n");
		sb.append("pic\r\n");
		//param6
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"uploadmediarequest\"\r\n\r\n");
		sb.append(uploadmediarequest+"\r\n");
		//param7
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"webwx_data_ticket\"\r\n\r\n");
		sb.append(getCookie("webwx_data_ticket", COOKIESET)+"\r\n");
		//param8
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"pass_ticket\"\r\n\r\n");
		sb.append(pass_ticket+"\r\n");
		//param9
		sb.append("--"); // 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"filename\"; filename=\""
				+ file.getName() +"\"\r\n");
		sb.append("Content-Type: "+ fileType +"\r\n\r\n");
		
		return sb.toString();
	}
	
	/** 
	 * 获取随机字母数字组合 
	 *  
	 * @param length 
	 *            字符串长度 
	 * @return 
	 */  
	public static String getRandomCharAndNumr(Integer length) {  
	    String str = "";  
	    Random random = new Random();  
	    for (int i = 0; i < length; i++) {  
	        boolean b = random.nextBoolean();  
	        if (b) { // 字符串  
	            int choice = random.nextBoolean() ? 65 : 97; //取得65大写字母还是97小写字母  
	            str += (char) (choice + random.nextInt(26));// 取得大写字母  
	        } else { // 数字  
	            str += String.valueOf(random.nextInt(10));  
	        }  
	    }  
	    return str;  
	}  
	  
	/** 
	 * 验证随机字母数字组合是否纯数字与纯字母 
	 *  
	 * @param str 
	 * @return true 是 ， false 否 
	 */  
	public static boolean isRandomUsable(String str) {  
	    // String regExp =  
	    // "^[A-Za-z]+(([0-9]+[A-Za-z0-9]+)|([A-Za-z0-9]+[0-9]+))|[0-9]+(([A-Za-z]+[A-Za-z0-9]+)|([A-Za-z0-9]+[A-Za-z]+))$";  
	    String regExp = "^([0-9]+)|([A-Za-z]+)$";  
	    Pattern pat = Pattern.compile(regExp);  
	    Matcher mat = pat.matcher(str);  
	    return mat.matches();  
	}  
}
