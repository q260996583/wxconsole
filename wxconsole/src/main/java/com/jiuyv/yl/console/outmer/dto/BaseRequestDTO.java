/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.dto;


/**
 * 
 * @author Tianhua
 * @version $Id: BaseRequestDTO.java, v 0.1 2017年6月2日 下午1:35:37 Tianhua Exp $
 */

public class BaseRequestDTO {
    private String version;
    private String media;
    private String instId;
    private String mid;
    private String tid;
    private String instOrderId;
    private String requestDate;
    private String requestTime;
    private String signData;
    private String signResult;
    public String getVersion() {
        return version;
    }
    public void setVersion(String version) {
        this.version = version;
    }
    public String getMedia() {
        return media;
    }
    public void setMedia(String media) {
        this.media = media;
    }
    public String getInstId() {
        return instId;
    }
    public void setInstId(String instId) {
        this.instId = instId;
    }
    public String getMid() {
        return mid;
    }
    public void setMid(String mid) {
        this.mid = mid;
    }
    public String getTid() {
        return tid;
    }
    public void setTid(String tid) {
        this.tid = tid;
    }
    public String getInstOrderId() {
        return instOrderId;
    }
    public void setInstOrderId(String instOrderId) {
        this.instOrderId = instOrderId;
    }
    public String getRequestDate() {
        return requestDate;
    }
    public void setRequestDate(String requestDate) {
        this.requestDate = requestDate;
    }
    public String getRequestTime() {
        return requestTime;
    }
    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
    }
    public String getSignData() {
        return signData;
    }
    public void setSignData(String signData) {
        this.signData = signData;
    }
    public String getSignResult() {
        return signResult;
    }
    public void setSignResult(String signResult) {
        this.signResult = signResult;
    }
    
}
