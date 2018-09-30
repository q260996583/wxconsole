package com.jiuyu.batchServer.bussiness.wxrobot.show;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class SwingShowImage extends JFrame {
	private static final long serialVersionUID = 1L;  
    private JLabel label;  
    private Icon icon;  
    
    public SwingShowImage(byte[] imageByte){  
        try{  
            setTitle("测试图片简单显示");  
            setSize(320,320);  
            setDefaultCloseOperation(DISPOSE_ON_CLOSE);  
            label = new JLabel();  
            add(label);  
            setVisible(true);
            //A：网路URL图片  
//	          icon = new ImageIcon(new URL("http://tp1.sinaimg.cn/3223061260/180/5659068018/1"));  
            //B：项目目录下图片  
//	          InputStream is = SwingTestImg.class.getResourceAsStream("twodimensioncode.gif");  
//	          ByteArrayOutputStream baos = new ByteArrayOutputStream();  
//	          byte [] buff = new byte[100];  
//	          int readCount = 0;  
//	          while((readCount = is.read(buff,0,100)) > 0){  
//	              baos.write(buff,0,readCount);  
//	          }  
//	          byte [] inbyte = baos.toByteArray();  
//	          icon =  new ImageIcon(inbyte);  
//	          //C：本地磁盘图片，图片太大，会导致空白显示  
//	          image =  new ImageIcon("D:/1.png").getImage();  
            //D：代码生成的BufferedImage二维码图片  
            int width = 200;  
            int height = 200;  
            ByteArrayInputStream bais = new ByteArrayInputStream(imageByte);
            BufferedImage image = ImageIO.read(bais); 
            icon = new ImageIcon(image);  
        }catch(Exception e){  
            System.out.println("初始化失败"+e.getMessage());  
            e.printStackTrace();  
        }  
        label.setIcon(icon);  
    }   
}
