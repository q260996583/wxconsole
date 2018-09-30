package com.jiuyu.batchServer.bussiness.wxrobot.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.swing.JLabel;

import com.jiuyv.common.web.action.DefaultPageSupportAction;

public class ImageUtil extends DefaultPageSupportAction  {

    private Map softKeyBoardMap = null;
    private final static String FONT_FAMILY = "宋体";
    private final static Integer FONT_SIZE = 60;
    private final static Integer LINE_FONT_NUM = 10;
    private final static Integer LEFT_WEIGTH = 40;
    private final static Integer LEFT_HEIGTH = 160;
    
    public static void main(String[] args) throws IOException {
    	String remoteFileName = new String("对不起，投注已关闭\n，请关注群公告！".getBytes("GBK"), 
    			System.getProperty("sun.jnu.encoding"));
    	String fileEncode = System.getProperty("file.encoding");
    	String text = "对不起，投注已关闭\n，请关注群公告！";
    	File outFile = new File("E:/data/image/"+"xx.test");
    	OutputStreamWriter ow = new OutputStreamWriter( 
    			new FileOutputStream(outFile, true), fileEncode);
    	
    	ow.write(new String(text.getBytes("UTF-8"), fileEncode)); 
    	ow.close();
    	
    	ImageIO.write(drawImage(text), "jpg", 
    			new File("E:/data/image/"+"112.jpg"));
    	System.out.println(System.getProperty("file.encoding"));
	}
    
    public static BufferedImage drawImage(String text) {
    	int imageX = 620;
    	int textHeight = getTextHeight();
    	int lineNum = getContentLine(text);
		int imageY = lineNum * textHeight + LEFT_HEIGTH;
		
        BufferedImage bufferedImage = new BufferedImage(imageX, imageY, BufferedImage.TYPE_3BYTE_BGR);
        Graphics2D graphics2d = bufferedImage.createGraphics();

        graphics2d.setBackground(Color.WHITE);
        graphics2d.clearRect(0, 0, imageX, imageY);
        Font font = new Font(FONT_FAMILY, Font.BOLD, FONT_SIZE);
        graphics2d.setFont(font);
        graphics2d.setColor(Color.BLACK);
        
        String[] childTest = text.split("\n");
    	if(text.length() < LINE_FONT_NUM) {
        	graphics2d.drawString(text, (imageX-getTextWeight(text))/2, imageY/2);
        } else {
        	 int j = 0;
        	 for(String testStr : childTest) {
            	for(int i=0;i<getContentLine(testStr); j++,i++) {
                	int end = i*LINE_FONT_NUM + LINE_FONT_NUM;
                	if(end>testStr.length()) {
                		end = testStr.length();
                	}
                	graphics2d.drawString(testStr.substring(i*LINE_FONT_NUM, end),
                			LEFT_WEIGTH , LEFT_HEIGTH+j*textHeight);
                }
        	 }
        }
        
        graphics2d.dispose();
        bufferedImage.flush();
        return bufferedImage;
    }
    
    private static int getTextWeight(String text) {
    	Font font = new Font(FONT_FAMILY, Font.BOLD, FONT_SIZE);
    	FontMetrics fm = new JLabel().getFontMetrics(font);
    	return fm.stringWidth(text);
    }
    
    private static int getTextHeight() {
    	Font font = new Font(FONT_FAMILY, Font.BOLD, FONT_SIZE);
    	FontMetrics fm = new JLabel().getFontMetrics(font);
    	return fm.getHeight();
    }

    private static int getContentLine(String text) {
    	String[] textSp = text.split("\n");
    	int lineNum = 0;
    	for(String temp : textSp) {
    		if(temp.length()%LINE_FONT_NUM != 0) {
    			lineNum += temp.length()/LINE_FONT_NUM + 1;
    		} else {
    			lineNum += temp.length()/LINE_FONT_NUM;
    		}
    	}
    	return lineNum;
    }
}
