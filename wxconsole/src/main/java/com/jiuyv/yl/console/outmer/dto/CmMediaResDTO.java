package com.jiuyv.yl.console.outmer.dto;


public class CmMediaResDTO {
	private String medName;
	private String athType;
    private byte[] medContent;
    public String getMedName() {
        return medName;
    }
    public void setMedName(String medName) {
        this.medName = medName;
    }
    public String getAthType() {
        return athType;
    }
    public void setAthType(String athType) {
        this.athType = athType;
    }
    public byte[] getMedContent() {
        return medContent;
    }
    public void setMedContent(byte[] medContent) {
        this.medContent = medContent;
    }
    
    
}
