package com.jiuyv.yl.console.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Base64;


public class MD5Util {
	public static String getMD5Str(String sMsg) {
		byte[] msg = sMsg.getBytes();
		MessageDigest messageDigest = null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.reset();
			messageDigest.update(msg);
		} catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {
		}
		byte[] b = messageDigest.digest();
		return new String(Base64.encodeBase64(b));
	}

	public static void main(String[] args) {
		String snr = "000001&854290057220314&00201615&a1872a7652f94b84a21a29bc6639c202&OFF&ON" ;
		String sStr = getMD5Str(snr);
		System.out.println(sStr);
	}
}