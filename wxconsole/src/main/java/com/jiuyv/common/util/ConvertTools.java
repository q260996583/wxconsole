package com.jiuyv.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class ConvertTools {

	private ConvertTools() {
	}

	private static String PATH="com.jiuyv.common.type.impl.";
	/**
	 * 把16进制字符串转换成字节数组 @param hex @return
	 */
	public static byte[] hexStringToByte(String hex) {
		int len = (hex.length() / 2);
		byte[] result = new byte[len];
		char[] achar = hex.toCharArray();
		for (int i = 0; i < len; i++) {
			int pos = i * 2;
			result[i] = (byte) (toByte(achar[pos]) << 4 | toByte(achar[pos + 1]));
		}
		return result;
	}

	/**
	 * 
	 * @param c
	 * @return
	 */
	private static byte toByte(char c) {
		byte b = (byte) "0123456789ABCDEF".indexOf(c);
		return b;
	}

	/**
	 * 把字节数组转换成16进制字符串
	 * 
	 * @param bArray
	 * @return
	 */
	public static final String bytesToHexString(byte[] bArray) {
		StringBuffer sb = new StringBuffer(bArray.length);
		String sTemp;
		for (int i = 0; i < bArray.length; i++) {
			sTemp = Integer.toHexString(0xFF & bArray[i]);
			if (sTemp.length() < 2) {
				sb.append(0);
			}
			sb.append(sTemp.toUpperCase());
		}
		return sb.toString();
	}

	/**
	 * 把字节数组转换为对象
	 * 
	 * @param bytes
	 * @return
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	public static final Object bytesToObject(byte[] bytes) throws IOException,
			ClassNotFoundException {
		ByteArrayInputStream in = new ByteArrayInputStream(bytes);
		ObjectInputStream oi = new ObjectInputStream(in);
		Object o = oi.readObject();
		oi.close();
		return o;
	}

	/**
	 * 把可序列化对象转换成字节数组
	 * 
	 * @param s
	 * @return
	 * @throws IOException
	 */
	public static final byte[] objectToBytes(Serializable s) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ObjectOutputStream ot = new ObjectOutputStream(out);
		ot.writeObject(s);
		ot.flush();
		ot.close();
		return out.toByteArray();
	}

	public static final String objectToHexString(Serializable s)
			throws IOException {
		return bytesToHexString(objectToBytes(s));
	}

	public static final Object hexStringToObject(String hex)
			throws IOException, ClassNotFoundException {
		return bytesToObject(hexStringToByte(hex));
	}

	/**
	 * @函数功能: BCD码转为10进制串(阿拉伯数据)
	 * @输入参数: BCD码
	 * @输出结果: 10进制串
	 */
	public static String bcd2Str(byte[] bytes) {
		StringBuffer temp = new StringBuffer(bytes.length * 2);

		for (int i = 0; i < bytes.length; i++) {
			temp.append((byte) ((bytes[i] & 0xf0) >>> 4));
			temp.append((byte) (bytes[i] & 0x0f));
		}
		return temp.toString().substring(0, 1).equalsIgnoreCase("0") ? temp
				.toString().substring(1) : temp.toString();
	}

	/**
	 * @函数功能: 10进制串转为BCD码
	 * @输入参数: 10进制串
	 * @输出结果: BCD码
	 */
	public static byte[] str2Bcd(String asc) {
		int len = asc.length();
		int mod = len % 2;

		if (mod != 0) {
			asc = "0" + asc;
			len = asc.length();
		}

		if (len >= 2) {
			len = len / 2;
		}

		byte bbt[] = new byte[len];
		byte abt[] = asc.getBytes();
		int j, k;

		for (int p = 0; p < asc.length() / 2; p++) {
			if ((abt[2 * p] >= '0') && (abt[2 * p] <= '9')) {
				j = abt[2 * p] - '0';
			} else if ((abt[2 * p] >= 'a') && (abt[2 * p] <= 'z')) {
				j = abt[2 * p] - 'a' + 0x0a;
			} else {
				j = abt[2 * p] - 'A' + 0x0a;
			}

			if ((abt[2 * p + 1] >= '0') && (abt[2 * p + 1] <= '9')) {
				k = abt[2 * p + 1] - '0';
			} else if ((abt[2 * p + 1] >= 'a') && (abt[2 * p + 1] <= 'z')) {
				k = abt[2 * p + 1] - 'a' + 0x0a;
			} else {
				k = abt[2 * p + 1] - 'A' + 0x0a;
			}

			int a = (j << 4) + k;
			byte b = (byte) a;
			bbt[p] = b;
		}
		return bbt;
	}

	public static int bytes2int(byte[] resource) {
		int mask = 0xff;
		int temp = 0;
		int res = 0;
		byte[] b = new byte[] { 0, 0, 0, 0 };
		System.arraycopy(resource, 0, b, 4 - resource.length, resource.length);
		for (int i = 0; i < 4; i++) {
			res <<= 8;
			temp = b[i] & mask;
			res |= temp;
		}
		return res;
	}
	
	/**
	 * 反射方法
	 * 将map转化为bean和将bean转化为map
	 * @author Don Quixote
	 * 2010-11-29 下午05:18:58
	 * Hello,Don Quixote!
	 */
	//忽略属性的大小写问题
	//字段类型也只支持最基本的String，Integer，Long，Float，Double
	public static <T> T ChangeMapToSimpleBean(Map<String, Object> map,T t){
		Set<Entry<String, Object>> entrySet = map.entrySet();  
        for (Entry<String, Object> et : entrySet) {  
	    	 /*
	    	 * 获取map的key和value
	    	 */
	         String key=et.getKey().toLowerCase(); // bean全部转化为小写字段
	         Object value=et.getValue();
	         /**
	          Class<?> cls=t.getClass();
	          Class<?> spcls=cls.getSuperclass();
	          Class<?> spspcls=spcls.getSuperclass();
	      	  Method[] mds=cls.getDeclaredMethods();
	      	  Method[] spmds=spcls.getDeclaredMethods();
	      	  if(spspcls.equals(Object.class)){
	      		  System.out.println("上级为object");
	      	  }
	      	  **/
              List<Method> list= new ArrayList<Method>();
              new ConvertTools().getObjMethodsWithExtends(t.getClass(), list);
          	  for (int i=0;i<list.size();i++) {
	     		  String name=list.get(i).getName();// bean的名称
	     		  if(!name.startsWith("set"))continue;
	     		  if(!changeStrToSetMethodNames(key).equalsIgnoreCase(name))continue;
	     		  try {
				  	  list.get(i).invoke(t, value);
				  } catch (Exception e) {
				  	// TODO Auto-generated catch block
				  	  e.printStackTrace();
				  }
				  break;
          	  }
        }  
	    return  t;
	}
		
		
	/**
	 * 一个公共的用于将简单的bean中的值转化为map的方法。
	 * 简单bean说明：bean中只包含基本对象，并且含有get方法。
	 * 不会对bean中的list，Map，这些对象赋值。
	 * @param <T>
	 * @param t
	 * @return
	 */
	public static <T> Map<String,String> changeSimpleBeanToMap(T t,Map<String,String> paraMap)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		Class cls = t.getClass();
		Field[] fieldlist = cls.getDeclaredFields();
		for(int i=0;i<fieldlist.length;i++){
			Field f=fieldlist[i];
			String name = f.getName();
			Class<?> cs= f.getType();
			try {
				String methodNme = changeStrToGetMethodNames(name);
				Method meth=null;
				Method[] mds=cls.getDeclaredMethods();
				for (int j = 0; j < mds.length; j++) {
					if (mds[j].getName().equals(methodNme)) {
						meth = cls.getMethod(methodNme);
						Object ortcs = meth.invoke(t, null);
						if (ortcs == null) {
							ortcs="";
						}
						String rtcs = ortcs.toString();
						if (paraMap.get(name) != null) {
							Method m = Class.forName(PATH + paraMap.get(name)).getMethod("render", String.class,String.class);
							Map<String,String> newMap = (Map<String,String>) m.invoke(Class.forName( PATH + paraMap.get(name)).newInstance(),name, rtcs.toString());
							/*rtcs = processDataType(rtcs, paraMap.get(name));*/
							map.putAll(newMap);
						}else{
							map.put("$(" + name + ")", rtcs);
						}
					}
				}	
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
	
	private static String changeStrToSetMethodNames(String str){
		if(str==null||str==""||str==" ") return null;
		char firstChar=str.toCharArray()[0];
		String upstr=String.valueOf(firstChar).toUpperCase();
		return "set"+upstr+str.substring(1);
	}
	
	private static String changeStrToGetMethodNames(String str){
		if(str==null||str==""||str==" ") return null;
		char firstChar=str.toCharArray()[0];
		String upstr=String.valueOf(firstChar).toUpperCase();
		return "get"+upstr+str.substring(1);
	}
	
	private void getObjMethodsWithExtends( Class<?> cls,List<Method> list){
		if(cls.equals(Object.class)){
			return;
		}
		Method[] mds=cls.getDeclaredMethods();
		for(int i=0;i<mds.length;i++){
			list.add(mds[i]); 
		}
		getObjMethodsWithExtends(cls.getSuperclass(), list);
	}
		
}
