package com.jiuyv.yl.console.common.util;


import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

//import com.allcheer.refmobile.constant.SystemConstant; 
import com.google.zxing.common.BitMatrix;


import java.sql.Time;
import java.util.Hashtable;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * Created by fireWorks on 2016/6/29.
 */
public class QRCodeUtil {

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;

    private QRCodeUtil() {
    }

    public static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
            }
        }
        return image;
    }

    public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if (!ImageIO.write(image, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }
    }

    public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if (!ImageIO.write(image, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }

    public static String genQRCode(String text, String desc,String fileName)  throws Exception {
        int width = 220; // 二维码图片宽度
        int height = 220; // 二维码图片高度
        String format = "jpg";// 二维码的图片格式
        String date = TimeUtil.getCurrentDate();
        String time = TimeUtil.getCurrentTime();
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
        // 指定生成二维码
        //String fileName = text.split("=")[1]+date+time;
        File outputFile = new File(desc +fileName +".jpg");
        QRCodeUtil.writeToFile(bitMatrix, format, outputFile);
        return outputFile.getPath();
    }

    public static String genQRCode(String text, String desc)  throws Exception {
        int width = 180; // 二维码图片宽度
        int height = 180; // 二维码图片高度
        String format = "jpg";// 二维码的图片格式
        String date = TimeUtil.getCurrentDate();
        String time = TimeUtil.getCurrentTime();
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
        // 生成二维码
        String fileName = text.split("=")[1]+date+time;
        File outputFile = new File(desc +fileName +".jpg");
        QRCodeUtil.writeToFile(bitMatrix, format, outputFile);
        return outputFile.getPath();
    }
    private static final String CHARSET = "utf-8";
    private static final String FORMAT_NAME = "jpg";
    // 二维码尺寸
    private static final int QRCODE_SIZE = 300;
    // LOGO宽度
    private static final int WIDTH = 80;
    // LOGO高度
    private static final int HEIGHT = 80;

    public static BufferedImage genQRCodeWithLog(String content, String imgPath, String fileName,
    		String destPath, boolean needCompress,Long qrcodeSeq)  throws Exception {
        String date = TimeUtil.getCurrentDate();
        String time = TimeUtil.getCurrentTime();

        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
        hints.put(EncodeHintType.MARGIN, 1);
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content,
                BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
        int width = bitMatrix.getWidth();
        int height = bitMatrix.getHeight()+30;         //wxb  +40底部留白
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < width; y++) {
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000
                        : 0xFFFFFFFF);
            }
            //wxb
            for(int y = width; y < height; y++) {
                image.setRGB(x, y,0xFFFFFFFF);
            }
        }
        if (imgPath != null && !"".equals(imgPath)) {
            insertImage(image,imgPath,content,needCompress);
        }
        
        
        //wxb  得到Graphics2D 对象  
        Graphics2D g2d=(Graphics2D)image.getGraphics();
        //设置颜色和画笔粗细  
        g2d.setColor(Color.BLACK);  
        g2d.setStroke(new BasicStroke(5));  
        g2d.setFont(new Font("Serif", Font.BOLD, 30));
        if(width<height){
        	 g2d.drawString("NO."+qrcodeSeq, 30, 305);
        }
        
        //wxb  存到本地路径
        //mkdirs(destPath);
        //ImageIO.write(image, FORMAT_NAME, new File(destPath+fileName));
        return image;
    }

    public static BufferedImage genQRCodeWithLog2(String content, String imgPath, String fileName,
         String destPath, boolean needCompress,Long qrcodeSeq)  throws Exception {
         String date = TimeUtil.getCurrentDate();
         String time = TimeUtil.getCurrentTime();
    
         Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
         hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
         hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
         hints.put(EncodeHintType.MARGIN, 1);
         BitMatrix bitMatrix = new MultiFormatWriter().encode(content,
                 BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
         int width = bitMatrix.getWidth();
         int height = bitMatrix.getHeight()+30;         //wxb  +40底部留白
         BufferedImage image = new BufferedImage(width, height,
                 BufferedImage.TYPE_INT_RGB);
         for (int x = 0; x < width; x++) {
             for (int y = 0; y < width; y++) {
                 image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000
                         : 0xFFFFFFFF);
             }
             //wxb
             for(int y = width; y < height; y++) {
                 image.setRGB(x, y,0xFFFFFFFF);
             }
         }
         if (imgPath != null && !"".equals(imgPath)) {
             insertImage(image,imgPath,content,needCompress);
         }
         
         
         //wxb  得到Graphics2D 对象  
         Graphics2D g2d=(Graphics2D)image.getGraphics();
         //设置颜色和画笔粗细  
         g2d.setColor(Color.BLACK);  
         g2d.setStroke(new BasicStroke(5));  
         g2d.setFont(new Font("Serif", Font.BOLD, 30));
         if(width<height){
              g2d.drawString("邀请码："+qrcodeSeq, 30, 305);
         }
         
         //wxb  存到本地路径
         //mkdirs(destPath);
         //ImageIO.write(image, FORMAT_NAME, new File(destPath+fileName));
         return image;
     }

    public static void mkdirs(String destPath) {
        File file =new File(destPath);
        //当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
    }


    /**
     * 插入LOGO
     *
     * @param source
     *            二维码图片
     * @param imgPath
     *            LOGO图片地址
     * @param needCompress
     *            是否压缩
     * @throws Exception
     */
    public static BufferedImage insertImage(BufferedImage source, String imgPath,String content,
                                    boolean needCompress) throws Exception {
    	//BufferedImage bufImg = null;
        File file = new File(imgPath);
        if (!file.exists()) {
            System.err.println(""+imgPath+"   该文件不存在！");
            //return;
        }
        Image src = ImageIO.read(new File(imgPath));
        int width = src.getWidth(null);
        int height = src.getHeight(null);
        if (needCompress) { // 压缩LOGO
            if (width > WIDTH) {
                width = WIDTH;
            }
            if (height > HEIGHT) {
                height = HEIGHT;
            }
            Image image = src.getScaledInstance(width, height,
                    Image.SCALE_SMOOTH);
            BufferedImage tag = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = tag.getGraphics();
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图
            g.dispose();
            src = image;
        }
        // 插入LOGO
        Graphics2D graph = source.createGraphics();
        int x = (QRCODE_SIZE - width) / 2;
        int y = (QRCODE_SIZE - height) / 2;
        graph.drawImage(src, x, y, width, height, null);
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);
        graph.setStroke(new BasicStroke(3f));
        graph.draw(shape);
        graph.dispose();
        source.flush();
        return source;
    }


    public static void main(String[] args) throws Exception {
        String text = "http://www.baidu.com"; // 二维码内容
        int width = 300; // 二维码图片宽度
        int height = 300; // 二维码图片高度
        String format = "jpg";// 二维码的图片格式
        String date = TimeUtil.getCurrentDate();
        String time = TimeUtil.getCurrentTime();
        String imagePath = "F:\\QrcodeTest\\logo.jpg";
        String fileName = "merQrcode5.jpg";
        String descFolder = "F:\\QrcodeTest\\";
        String merNo="854100007420428";
        String tidNo="00201339";
        Long lastSeq=1100997775l;

        BufferedImage desc = QRCodeUtil.genQRCodeWithLog(text, imagePath, fileName, descFolder, true,lastSeq);
        System.out.println("成功");
//       String url = QRCodeUtil.genQRCodeWithLog(text,imagePath,true);

//        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
//        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码
//
//        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
//        // 生成二维码
//        String fileName = text.split("=")[1]+date+time;
//        File outputFile = new File("C:\\encodeFile\\"  +fileName +".gif");
//        QRCodeUtil.writeToFile(bitMatrix, format, outputFile);
    }
}
