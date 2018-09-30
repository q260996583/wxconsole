package com.jiuyu.batchServer.bussiness.wxrobot.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RadialGradientPaint;
import java.awt.RenderingHints;
import java.awt.geom.Point2D;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
 
public class MyFrame extends JPanel{
    public static void main(String[] args) {
        JFrame f = new JFrame("试试");
         
        MyFrame mf = new MyFrame();
        f.add(mf);
         
        f.setLocationRelativeTo(null);
        f.setSize(200, 200);
         
        f.setVisible(true);
        f.setDefaultCloseOperation(3);
    }
     
    public void paintComponent(Graphics g){
    	int width = 20;
    	int height = 20;
    	int x = 5;
    	int y = 15;
        Graphics2D g2 = (Graphics2D)g;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
//        RadialGradientPaint p = new RadialGradientPaint(
//        		new Point2D.Double(40,100), 
//        		getWidth() / 2.6f,
//                    new float[] { 0.0f, 1.0f },
//                    new Color[] { Color.WHITE, Color.BLUE });
//        RadialGradientPaint p2 = new RadialGradientPaint(
//        		new Point2D.Double(100,80), 
//        		getWidth() / 2.6f,
//                    new float[] { 0.0f, 1.0f },
//                    new Color[] { Color.WHITE, Color.BLUE });
//            g2.setPaint(p);
//            g2.setPaint(p2);
        g2.setColor(Color.red);
            g2.fillOval(0, 0, width, height);
            Font font = new Font("黑体", Font.BOLD, 12);
            g2.setFont(font);
            g2.setColor(Color.WHITE);
            g2.drawString("11", x, y);
    }
    
    private static int getTextWeight(String text) {
    	Font font = new Font("黑体", Font.BOLD, 120);
    	FontMetrics fm = new JLabel().getFontMetrics(font);
    	return fm.stringWidth(text);
    }
    
    private static int getTextHeight() {
    	Font font = new Font("黑体", Font.BOLD, 120);
    	FontMetrics fm = new JLabel().getFontMetrics(font);
    	return fm.getHeight();
    }
}
