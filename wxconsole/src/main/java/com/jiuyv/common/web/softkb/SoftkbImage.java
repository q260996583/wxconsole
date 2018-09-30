package com.jiuyv.common.web.softkb;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Class SoftkbImage.
 *
 * @author
 * 
 */
public class SoftkbImage extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(SoftkbImage.class);
	
	private static Map<String,String> SHIFT_MAP = new HashMap<String, String>();
	
	public static final String SESSION_CODEMAP = "passwd_codemap";
	
	static {
		SHIFT_MAP.put("0",")");
		SHIFT_MAP.put("1","!");
		SHIFT_MAP.put("2","@");
		SHIFT_MAP.put("3","#");
		SHIFT_MAP.put("4","$");
		SHIFT_MAP.put("5","%");
		SHIFT_MAP.put("6","^");
		SHIFT_MAP.put("7","&");
		SHIFT_MAP.put("8","*");
		SHIFT_MAP.put("9","(");
	}
	
	/**
	 * doGet.
	 *
	 * @param req the req
	 * @param resp the resp
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<String> nlist = new ArrayList<String>();
		List<String> alist = new ArrayList<String>();
		Map<String,String> codeMap = randomCodeMap(nlist, alist);
		LOGGER.info("CodeMap: " + codeMap.toString());
		req.getSession().setAttribute(SESSION_CODEMAP, codeMap);
		BufferedImage img = ImageIO.read(new File(getClass().getResource("softkb_bk2.png").getPath()));
		OutputStream os = resp.getOutputStream();
		drawKeys(img, nlist, alist, os);
		IOUtils.closeQuietly(os);
	}
	
	/**
	 * 获取随机码
	 * @return
	 */
	private static Map<String,String> randomCodeMap(List<String> numberList, List<String> alphabetList){
		String[] numberArr = {"0","1","2","3","4","5","6","7","8","9"};
		// String[] specialArr = {"!","@","#","$","%","^","&","*","(",")"};
		String[] alphabetArr = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		
		for (String number: numberArr ) {
			numberList.add(number);
		}
		for (String letter: alphabetArr) {
			alphabetList.add(letter);
		}
		Collections.shuffle(numberList);
		Collections.shuffle(alphabetList);
		Map<String,String> codeMap = new LinkedHashMap<String, String>();
		for (int i=0; i < numberList.size() ; i++ ) {
			String value = numberList.get(i);
			String shiftValue = SHIFT_MAP.get(value);
			codeMap.put(String.format("n%02d", i), value);
			codeMap.put(String.format("s%02d", i), shiftValue);
		}
		for (int i=0; i < alphabetList.size() ; i++ ) {
			String value = alphabetList.get(i);
			String shiftValue = value.toUpperCase();
			codeMap.put(String.format("a%02d", i), value);
			codeMap.put(String.format("A%02d", i), shiftValue);
		}
		return codeMap;
	}
	
	/**
	 * 在已有图片上画数字
	 * @param img
	 * @param codeMap
	 * @param os
	 */
	private static void drawKeys(BufferedImage img, List<String> numberList, List<String> alphabetList, OutputStream os) {
		Graphics2D gTxt = img.createGraphics();
        Graphics2D gShift = img.createGraphics();
        gTxt.setColor(new Color(32,88,103));
        gTxt.setFont(new Font("Arial", Font.BOLD, 12));
        gShift.setColor(new Color(119,119,119));
        gShift.setFont(new Font("Arial", Font.BOLD, 9));
        
        int startX = 16 ;
        int startY = 32 ;
        int intervalX = 33;
        
        for (int i = 0 ; i < numberList.size(); i++ ) {
        	gTxt.drawString(numberList.get(i), startX + i*intervalX, startY);
        	gShift.drawString(SHIFT_MAP.get(numberList.get(i)), startX + i*intervalX + 8, startY - 12 );
        }
        
        startX = 23;
        startY = 62;
        int intervalY = 33;
        for (int i = 0 ; i < 10; i++ ) {
        	gTxt.drawString(alphabetList.get(i), startX + i*intervalX, startY);
        }
        startX = 40;
        for (int i = 0 ; i < 9; i++ ) {
        	gTxt.drawString(alphabetList.get(i+10), startX + i*intervalX, startY+intervalY*1);
        }
        startX = 88;
        for (int i = 0 ; i < 7; i++ ) {
        	gTxt.drawString(alphabetList.get(i+19), startX + i*intervalX, startY+intervalY*2);
        }
        // Shift Value
        int imgHeight = 146;
        startX = 16 ;
        startY = 32+imgHeight ;
        intervalX = 33;
        
        for (int i = 0 ; i < numberList.size(); i++ ) {
        	gTxt.drawString(SHIFT_MAP.get(numberList.get(i)), startX + i*intervalX, startY);
        	gShift.drawString(numberList.get(i), startX + i*intervalX + 8, startY - 12 );
        }
        
        startX = 23;
        startY = 62+imgHeight;
        for (int i = 0 ; i < 10; i++ ) {
        	gTxt.drawString(alphabetList.get(i).toUpperCase(), startX + i*intervalX, startY);
        }
        startX = 40;
        for (int i = 0 ; i < 9; i++ ) {
        	gTxt.drawString(alphabetList.get(i+10).toUpperCase(), startX + i*intervalX, startY+intervalY*1);
        }
        startX = 88;
        for (int i = 0 ; i < 7; i++ ) {
        	gTxt.drawString(alphabetList.get(i+19).toUpperCase(), startX + i*intervalX, startY+intervalY*2);
        }
        
        try {
        	gTxt.dispose();
        	gShift.dispose();
			ImageIO.write(img, "PNG", os);
		} catch (IOException e) {
			LOGGER.error("Write Image Filed failed.", e);
		}
        
	}
	
	public static void main(String[] args) throws Exception {
		List<String> nlist = new ArrayList<String>();
		List<String> alist = new ArrayList<String>();
		Map<String,String> codeMap = randomCodeMap(nlist, alist);
		System.out.println(nlist);
		System.out.println(alist);
		System.out.println(codeMap);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		BufferedImage img = ImageIO.read(new File("d:/tmp/softkb_bk2.png"));
		FileOutputStream os = new FileOutputStream("d:/tmp/softkb_bk2_"+ sdf.format(new Date()) + ".png");
		drawKeys(img, nlist, alist, os);
		IOUtils.closeQuietly(os);
	}
	
	
	
}
