package com.jiuyv.yl.console.common.service;

import java.security.MessageDigest;

public class MD5Tools {

	public static String passMD5(String a) throws Exception {
		MessageDigest MD = MessageDigest.getInstance("MD5");
		// ------传入要计算的字符串------
		MD.update(a.getBytes());
		// ------计算消息摘要------
		byte[] passwordMD5Byte = MD.digest();
		// pwd = new String(passwordMD5Byte);
		a = byte2hex(passwordMD5Byte);
		return a;
	}

	public static String byte2hex(byte[] b) {// 字节码转换成16进制字符串
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = java.lang.Integer.toHexString(b[n] & 0XFF);
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
			if (n < b.length - 1)
				hs = hs + "";
		}
		return hs.toUpperCase();
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println(MD5Tools.passMD5("0000"));
	}
}
