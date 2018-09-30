package com.jiuyv.yl.console.orgmngr.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 *
 * @author Administrator
 *
 */
public class AES {

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(AES.class);
	
	/** AES Key */
	private static final String KEY = "NcmvC8ljk4BgdHgJ";
	
	private static final String ENCODE = "UTF-8";
	
	private static final String FORMAT = "AES";
	
	private static final String FORMATION = "AES/ECB/PKCS5Padding";
	
    // 加密
    public static String encrypt(String sSrc) throws Exception {
        if (KEY == null) {
        	LOGGER.error("Key为空null");
            return null;
        }
        // 判断Key是否为16位
        if (KEY.length() != 16) {
        	LOGGER.error("Key长度不是16位");
            return null;
        }
        byte[] raw = KEY.getBytes(ENCODE);
        SecretKeySpec skeySpec = new SecretKeySpec(raw, FORMAT);
        Cipher cipher = Cipher.getInstance(FORMATION);//"算法/模式/补码方式"
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(sSrc.getBytes(ENCODE));
      //此处使用BASE64做转码功能，同时能起到2次加密的作用。
        String resultStr = new Base64().encodeToString(encrypted);
        if (resultStr != null && resultStr.lastIndexOf("\r\n") != -1) {
			resultStr = resultStr.substring(0, resultStr.lastIndexOf("\r\n"));
		}
        return resultStr;
    }

    // 解密
    public static String decrypt(String sSrc) {
        try {
            // 判断Key是否正确
            if (KEY == null) {
            	LOGGER.error("Key为空null");
                return null;
            }
            // 判断Key是否为16位
            if (KEY.length() != 16) {
            	LOGGER.error("Key长度不是16位");
                return null;
            }
            byte[] raw = KEY.getBytes(ENCODE);
            SecretKeySpec skeySpec = new SecretKeySpec(raw, FORMAT);
            Cipher cipher = Cipher.getInstance(FORMATION);
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            byte[] encrypted = new Base64().decode(sSrc);//先用base64解密
            try {
                byte[] original = cipher.doFinal(encrypted);
                String originalString = new String(original,ENCODE);
                return originalString;
            } catch (Exception e) {
            	LOGGER.error(e.toString());
                return null;
            }
        } catch (Exception ex) {
        	LOGGER.error(ex.toString());
            return null;
        }
    }
    
    public static void main(String[] args) throws Exception {
        /*
         * 此处使用AES-128-ECB加密模式，key需要为16位。
         */
        // 需要加密的字串
        String cSrc = "aaaa1111!";
        System.out.println(cSrc);
        // 加密
        String enString = AES.encrypt(cSrc);
        System.out.println("加密后的字串是：" + enString);
        System.out.println("加密后的字串长度是：" + enString.length());
 
        // 解密
        String DeString = AES.decrypt(enString);
        System.out.println("解密后的字串是：" + DeString);
        System.out.println("加密后的字串长度是：" + DeString.length());
    }

}
