/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.dto;



/**
 * 
 * @author Tianhua
 * @version $Id: BaseResponseDTO.java, v 0.1 2017年6月2日 下午1:36:10 Tianhua Exp $
 */

public class BaseResponseDTO {
    private String version;
    private String respCode;
    private String respMessage;
    private String instId;
    private String mid;
    private String tid;
    private String instOrderId;
    private String requestStatus;
    private String status;
    private String respDate;
    private String respTime;
    public String getVersion() {
        return version;
    }
    public void setVersion(String version) {
        this.version = version;
    }
    public String getRespCode() {
        return respCode;
    }
    public void setRespCode(String respCode) {
        this.respCode = respCode;
    }
    public String getRespMessage() {
        return respMessage;
    }
    public void setRespMessage(String respMessage) {
        this.respMessage = respMessage;
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
    public String getRequestStatus() {
        return requestStatus;
    }
    public void setRequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getRespDate() {
        return respDate;
    }
    public void setRespDate(String respDate) {
        this.respDate = respDate;
    }
    public String getRespTime() {
        return respTime;
    }
    public void setRespTime(String respTime) {
        this.respTime = respTime;
    }
    
}
