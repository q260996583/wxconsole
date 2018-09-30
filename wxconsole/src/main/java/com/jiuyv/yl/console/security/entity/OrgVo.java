package com.jiuyv.yl.console.security.entity;

import java.io.Serializable;


// TODO: Auto-generated Javadoc
/**
 * 机构信息.
 */
public class OrgVo implements Serializable{
    private static final long serialVersionUID = 1L;

   
    private String orgCode;
    
   
    private String orgName;
    
   
    private String father_org_code;
    
   
    private String father_org_name;
    
    private String orgtypecd;
    
    private String status;
    
    private Long orgAt;
    private String orgSigSta;
    private String netIn;
    private String orgStatus;
    private String deletFlag;
    private String province;
    private String city;
    private String reservId;
    private String orgSname;
    private String orgAdd;
    private String orgLinkman;
    private String orgTel;
    private String orgFax;
    private String orgUrl;
    private String chOrgId;
    private String orgKey;
    private String dataKey;
    private String macKey;
    private String miscTx;
    private String luOprid;
    private String luTranscode;
    private String updateTime;
    private String orgId;
    private String phone;
    
    private String parentId;
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrgtypecd() {
        return orgtypecd;
    }

    public void setOrgtypecd(String orgtypecd) {
        this.orgtypecd = orgtypecd;
    }

    /**
     * Gets the org code.
     * 
     * @return the org code
     */
    public String getOrgCode() {
        return orgCode;
    }
    
    /**
     * Sets the org code.
     * 
     * @param orgCode the new org code
     */
    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }
    
    /**
     * Gets the org name.
     * 
     * @return the org name
     */
    public String getOrgName() {
        return orgName;
    }
    
    /**
     * Sets the org name.
     * 
     * @param orgName the new org name
     */
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getFather_org_code() {
        return father_org_code;
    }

    public void setFather_org_code(String father_org_code) {
        this.father_org_code = father_org_code;
    }

    public String getFather_org_name() {
        return father_org_name;
    }

    public void setFather_org_name(String father_org_name) {
        this.father_org_name = father_org_name;
    }

    public Long getOrgAt() {
        return orgAt;
    }

    public void setOrgAt(Long orgAt) {
        this.orgAt = orgAt;
    }

    public String getOrgSigSta() {
        return orgSigSta;
    }

    public void setOrgSigSta(String orgSigSta) {
        this.orgSigSta = orgSigSta;
    }

    public String getNetIn() {
        return netIn;
    }

    public void setNetIn(String netIn) {
        this.netIn = netIn;
    }

    public String getOrgStatus() {
        return orgStatus;
    }

    public void setOrgStatus(String orgStatus) {
        this.orgStatus = orgStatus;
    }

    public String getDeletFlag() {
        return deletFlag;
    }

    public void setDeletFlag(String deletFlag) {
        this.deletFlag = deletFlag;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getReservId() {
        return reservId;
    }

    public void setReservId(String reservId) {
        this.reservId = reservId;
    }

    public String getOrgSname() {
        return orgSname;
    }

    public void setOrgSname(String orgSname) {
        this.orgSname = orgSname;
    }

    public String getOrgAdd() {
        return orgAdd;
    }

    public void setOrgAdd(String orgAdd) {
        this.orgAdd = orgAdd;
    }

    public String getOrgLinkman() {
        return orgLinkman;
    }

    public void setOrgLinkman(String orgLinkman) {
        this.orgLinkman = orgLinkman;
    }

    public String getOrgTel() {
        return orgTel;
    }

    public void setOrgTel(String orgTel) {
        this.orgTel = orgTel;
    }

    public String getOrgFax() {
        return orgFax;
    }

    public void setOrgFax(String orgFax) {
        this.orgFax = orgFax;
    }

    public String getOrgUrl() {
        return orgUrl;
    }

    public void setOrgUrl(String orgUrl) {
        this.orgUrl = orgUrl;
    }

    public String getChOrgId() {
        return chOrgId;
    }

    public void setChOrgId(String chOrgId) {
        this.chOrgId = chOrgId;
    }

    public String getOrgKey() {
        return orgKey;
    }

    public void setOrgKey(String orgKey) {
        this.orgKey = orgKey;
    }

    public String getDataKey() {
        return dataKey;
    }

    public void setDataKey(String dataKey) {
        this.dataKey = dataKey;
    }

    public String getMacKey() {
        return macKey;
    }

    public void setMacKey(String macKey) {
        this.macKey = macKey;
    }

    public String getMiscTx() {
        return miscTx;
    }

    public void setMiscTx(String miscTx) {
        this.miscTx = miscTx;
    }

    public String getLuOprid() {
        return luOprid;
    }

    public void setLuOprid(String luOprid) {
        this.luOprid = luOprid;
    }

    public String getLuTranscode() {
        return luTranscode;
    }

    public void setLuTranscode(String luTranscode) {
        this.luTranscode = luTranscode;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


}
