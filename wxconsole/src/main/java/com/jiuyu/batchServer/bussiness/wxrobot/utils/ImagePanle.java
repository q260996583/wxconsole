package com.jiuyu.batchServer.bussiness.wxrobot.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.JLabel;

import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;

/**
 * 图片显示面板类<br>
 * 颜色渐变效果测试
 * 
 * @author WQL
 * 
 */
public class ImagePanle {
    private static final long serialVersionUID = 1L;
    private final static String FONT_FAMILY = "黑体";
    private final static Integer FONT_SIZE = 35;


    /**
     * 初始化颜色
     * @throws Exception 
     */
    private static BufferedImage painLotteryTen(String[][] text, 
    		String fileName) throws Exception {
    	int textX = 155;
    	int textY = 56;
    	int space = 53;
    	BufferedImage image = ImageIO.read(new FileInputStream(fileName));
    	
    	 Graphics2D graphics2d = image.createGraphics();
 		
         Font font = new Font(FONT_FAMILY, Font.BOLD, FONT_SIZE);
         graphics2d.setFont(font);
         graphics2d.setColor(Color.WHITE);
         Font fontDate = new Font(FONT_FAMILY, Font.BOLD, 22);
         
         int localTextX = textX;
         int localTextY = textY;
         int localSpace = space;
         for(int i=0; i<text.length; i++) {
        	 for(String temStr : text[i]) {
        		 if(temStr.length() > 5) {
        	         graphics2d.setFont(fontDate);
        	         graphics2d.setColor(Color.BLACK);
        	         graphics2d.drawString(temStr, 10, localTextY-8);
        	         graphics2d.setFont(font);
        	         graphics2d.setColor(Color.WHITE);
        	         continue;
        		 } else if(temStr.length() == 1) {
            		 graphics2d.drawString(temStr, localTextX+10, localTextY);
            	 } else {
            		 graphics2d.drawString(temStr, localTextX, localTextY);
            	 }
            	 localTextX += localSpace;
             }
        	 localTextY += localSpace;
        	 localTextX = textX;
         }
         
         graphics2d.dispose();
         image.flush();
         return image;
    }
    
    public static void createLottery10Img(List<LotteryInfoVo> lottery, 
    		String oraFileName, String destFileName) throws Exception {
    	System.out.println("#########createLottery10Img");
    	//String fileName = "error.jpg";
    	String[][] param = new String[lottery.size()][6];
    	for(int j=0,i=lottery.size()-1; i>=0; i--,j++) {
    		LotteryInfoVo lotteryInfo =  lottery.get(i);
    		param[j][0] = lotteryInfo.getLotteryId();
    		String[] lotteryResult = lotteryInfo.getLotteryResult().split(",");
    		param[j][1] = lotteryResult[0];
    		param[j][2] = lotteryResult[1];
    		param[j][3] = lotteryResult[2];
    		param[j][4] = lotteryResult[3];
    		param[j][5] = lotteryResult[4];
    	}
    	
    	BufferedImage bimage = ImagePanle.painLotteryTen(param, oraFileName);
        FileOutputStream out = new FileOutputStream(destFileName);
        ImageIO.write(bimage, "JPEG", out);
        out.close();
        System.out.println("#########createLottery10Img#end");
    }
    
    
    
    
    private static BufferedImage painLotteryThree(String[][] text, 
    		String fileName) throws Exception {
    	
    	int textX = 206;
    	int textY = 45;
    	int space = 54;
    	System.out.println("#########painLotteryThree");
//    	InputStream imageIn = 
//    			new FileInputStream(new File(fileName));
//    	com.sun.image.codec.jpeg.JPEGImageDecoder decoder = 
//    			com.sun.image.codec.jpeg.JPEGCodec
//    			.createJPEGDecoder(imageIn);
//    	 BufferedImage image = decoder.decodeAsBufferedImage();
    	BufferedImage image = ImageIO.read(new FileInputStream(fileName));
    	
    	 Graphics2D graphics2d = image.createGraphics();
 		
         Font font = new Font(FONT_FAMILY, Font.BOLD, FONT_SIZE);
         graphics2d.setFont(font);
         graphics2d.setColor(Color.WHITE);
         Font fontDate = new Font(FONT_FAMILY, Font.BOLD, 22);
         
         int localTextX = textX;
         int localTextY = textY;
         int localSpace = space;
         for(int i=0; i<text.length; i++) {
        	 for(String temStr : text[i]) {
        		 if(temStr.length() > 5) {
        	         graphics2d.setFont(fontDate);
        	         graphics2d.setColor(Color.BLACK);
        	         graphics2d.drawString(temStr, 40, localTextY-8);
        	         graphics2d.setFont(font);
        	         graphics2d.setColor(Color.WHITE);
        	         continue;
        		 } else if(temStr.length() == 1) {
            		 graphics2d.drawString(temStr, localTextX+10, localTextY);
            	 } else {
            		 graphics2d.drawString(temStr, localTextX, localTextY);
            	 }
            	 localTextX += localSpace;
             }
        	 localTextY += localSpace;
        	 localTextX = textX;
         }
         
         graphics2d.dispose();
         image.flush();
         System.out.println("#########painLotteryThree#end");
         return image;
    }
    
    
    public static void createLottery03Img(List<LotteryInfoVo> lottery, 
    		String oraFileName, String destFileName) throws Exception {
    	//String fileName = "error.jpg";
    	String[][] param = new String[lottery.size()][4];
    	for(int j=0,i=lottery.size()-1; i>=0; i--,j++) {
    		LotteryInfoVo lotteryInfo =  lottery.get(i);
    		param[j][0] = lotteryInfo.getLotteryId();
    		String[] lotteryResult = lotteryInfo.getLotteryResult().split(",");
    		param[j][1] = lotteryResult[0];
    		param[j][2] = lotteryResult[1];
    		param[j][3] = lotteryResult[2];
    	}
    	
    	BufferedImage bimage = ImagePanle.painLotteryThree(param, oraFileName);
        FileOutputStream out = new FileOutputStream(destFileName);
        ImageIO.write(bimage, "JPEG", out);
        out.close();
    }
    
    /**
     * 主方法
     * @throws Exception 
     * @throws IOException 
     */
    public static void main(String[] args) throws IOException, Exception {
    	String[][] param = {{"201729425", "7","1","13"},
    			{"171021028", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"},
    			{"201729425", "7","1","13"}
    			};
//    	String[][] param = {{"201729425", "7","1","13","23","1"},
//    			{"201729425", "7","1","13","23","2"},
//    			{"201729425", "7","1","13","23","3"},
//    			{"201729425", "7","1","13","23","4"},
//    			{"201729425", "7","1","13","23","5"},
//    			{"201729425", "7","1","13","23","6"},
//    			{"201729425", "7","1","13","23","7"},
//    			{"201729425", "7","1","13","23","8"},
//    			{"201729425", "7","1","13","23","9"},
//    			{"201729425", "7","1","13","23","10"},
//    			{"201729425", "7","1","13","23","11"},
//    			{"201729425", "7","1","13","23","12"},
//    			{"201729425", "7","1","13","23","13"},
//    			{"201729425", "7","1","13","23","14"},
//    			{"201729425", "7","1","13","23","15"},
//    			{"201729425", "7","1","13","23","16"}
//    			};
    	BufferedImage bimage = ImagePanle.painLotteryThree(param, "E:/data/image/public/k320.jpg");
    	 try {
             FileOutputStream out = new FileOutputStream("E:/data/image/public/k3_20r.jpg");
             ImageIO.write(bimage, "JPEG", out);
             out.close();
         } catch (FileNotFoundException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         } catch (IOException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
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
}
