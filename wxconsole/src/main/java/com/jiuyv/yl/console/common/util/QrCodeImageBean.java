package com.jiuyv.yl.console.common.util;

import java.awt.image.BufferedImage;
import jp.sourceforge.qrcode.data.QRCodeImage;

public class QrCodeImageBean implements QRCodeImage {

    BufferedImage bufImg;  
    
    public QrCodeImageBean(BufferedImage bufImg) {  
        this.bufImg = bufImg;  
    }  
    public int getHeight() {  
        return bufImg.getHeight();  
    }  
    public int getPixel(int x, int y) {  
        return bufImg.getRGB(x, y);  
    }  
    public int getWidth() {  
        return bufImg.getWidth();  
    }  
}