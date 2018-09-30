/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.entity;

/**
 * 
 * @author wxb
 * @version $Id: QrcMerchantVO.java, v 0.1 2017年6月5日 下午5:13:01 wxb Exp $
 * 小微商户
 */
public class QrcMerchantVo {
    private String id;    //UUID
    private String instId;    //机构号
    private String instMerId;    //机构商户号
    private String addInstMerId;    //进件机构商户号
    private String merName;    //机构商户名称
    private String merShortName;    //
    private String merPhoneNo;    //商户手机号
    private String merAddress;    //商户地址信息
    private String merCardInfo;    //商户银行卡信息
    private String merCardName;    //商户银行卡名字
    private String merCardBank;    //商户银行联行信息
    private String merCardBankName;    //商户银行联行名字
    private String merIdType;    //证件类型
    private String merIdNo;    //证件号
    private String merStatus;    //商户状态
    private String merInfoResv1;    //
    private String merInfoResv2;    //
    private String merInfoResv3;    //
    private String inviteCode;    //邀请码
    private String contactType;    //联系人类型
    private String contactName;    //联系人姓名
    private String merOutName;//商户对外名称
    private String provinceCode;//省
    private String cityCode;//市
    private String areaCode;//地区代码
    private String createDate;//
    private String updateDate;//
    private String wechatPayRate;//微信费率
    private String alipayPayRate;//支付宝费率
    private String addStatus;//进件状态
    private String createAcct;//进件人
    private String auditAcct;//审核人
    private String auditMemo;//审批意见
    private String contactTypeDesc;    //联系人类型描述
    private String merIdTypeDesc;    //证件类型描述
    private String areaCodeDesc;    //地区代码描述
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getInstId() {
        return instId;
    }
    public void setInstId(String instId) {
        this.instId = instId;
    }
    public String getInstMerId() {
        return instMerId;
    }
    public void setInstMerId(String instMerId) {
        this.instMerId = instMerId;
    }
    public String getMerName() {
        return merName;
    }
    public void setMerName(String merName) {
        this.merName = merName;
    }
    public String getMerShortName() {
        return merShortName;
    }
    public void setMerShortName(String merShortName) {
        this.merShortName = merShortName;
    }
    public String getMerPhoneNo() {
        return merPhoneNo;
    }
    public void setMerPhoneNo(String merPhoneNo) {
        this.merPhoneNo = merPhoneNo;
    }
    public String getMerAddress() {
        return merAddress;
    }
    public void setMerAddress(String merAddress) {
        this.merAddress = merAddress;
    }
    public String getMerCardInfo() {
        return merCardInfo;
    }
    public void setMerCardInfo(String merCardInfo) {
        this.merCardInfo = merCardInfo;
    }
    public String getMerCardName() {
        return merCardName;
    }
    public void setMerCardName(String merCardName) {
        this.merCardName = merCardName;
    }
    public String getMerCardBank() {
        return merCardBank;
    }
    public void setMerCardBank(String merCardBank) {
        this.merCardBank = merCardBank;
    }
    public String getMerCardBankName() {
        return merCardBankName;
    }
    public void setMerCardBankName(String merCardBankName) {
        this.merCardBankName = merCardBankName;
    }
    public String getMerIdType() {
        return merIdType;
    }
    public void setMerIdType(String merIdType) {
        this.merIdType = merIdType;
    }
    public String getMerIdNo() {
        return merIdNo;
    }
    public void setMerIdNo(String merIdNo) {
        this.merIdNo = merIdNo;
    }
    public String getMerStatus() {
        return merStatus;
    }
    public void setMerStatus(String merStatus) {
        this.merStatus = merStatus;
    }
    public String getMerInfoResv1() {
        return merInfoResv1;
    }
    public void setMerInfoResv1(String merInfoResv1) {
        this.merInfoResv1 = merInfoResv1;
    }
    public String getMerInfoResv2() {
        return merInfoResv2;
    }
    public void setMerInfoResv2(String merInfoResv2) {
        this.merInfoResv2 = merInfoResv2;
    }
    public String getMerInfoResv3() {
        return merInfoResv3;
    }
    public void setMerInfoResv3(String merInfoResv3) {
        this.merInfoResv3 = merInfoResv3;
    }
    public String getInviteCode() {
        return inviteCode;
    }
    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }
    public String getContactType() {
        return contactType;
    }
    public void setContactType(String contactType) {
        this.contactType = contactType;
    }
    public String getContactName() {
        return contactName;
    }
    public void setContactName(String contactName) {
        this.contactName = contactName;
    }
    public String getMerOutName() {
        return merOutName;
    }
    public void setMerOutName(String merOutName) {
        this.merOutName = merOutName;
    }
    public String getProvinceCode() {
        return provinceCode;
    }
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }
    public String getCityCode() {
        return cityCode;
    }
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
    public String getAreaCode() {
        return areaCode;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public String getUpdateDate() {
        return updateDate;
    }
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    public String getWechatPayRate() {
        return wechatPayRate;
    }
    public void setWechatPayRate(String wechatPayRate) {
        this.wechatPayRate = wechatPayRate;
    }
    public String getAlipayPayRate() {
        return alipayPayRate;
    }
    public void setAlipayPayRate(String alipayPayRate) {
        this.alipayPayRate = alipayPayRate;
    }
    public String getAddStatus() {
        return addStatus;
    }
    public void setAddStatus(String addStatus) {
        this.addStatus = addStatus;
    }
    public String getAddInstMerId() {
        return addInstMerId;
    }
    public void setAddInstMerId(String addInstMerId) {
        this.addInstMerId = addInstMerId;
    }
    public String getCreateAcct() {
        return createAcct;
    }
    public void setCreateAcct(String createAcct) {
        this.createAcct = createAcct;
    }
    public String getAuditAcct() {
        return auditAcct;
    }
    public void setAuditAcct(String auditAcct) {
        this.auditAcct = auditAcct;
    }
    public String getAuditMemo() {
        return auditMemo;
    }
    public void setAuditMemo(String auditMemo) {
        this.auditMemo = auditMemo;
    }
    public String getContactTypeDesc() {
        return contactTypeDesc;
    }
    public void setContactTypeDesc(String contactTypeDesc) {
        this.contactTypeDesc = contactTypeDesc;
    }
    public String getMerIdTypeDesc() {
        return merIdTypeDesc;
    }
    public void setMerIdTypeDesc(String merIdTypeDesc) {
        this.merIdTypeDesc = merIdTypeDesc;
    }
    public String getAreaCodeDesc() {
        return areaCodeDesc;
    }
    public void setAreaCodeDesc(String areaCodeDesc) {
        this.areaCodeDesc = areaCodeDesc;
    }
    
}
