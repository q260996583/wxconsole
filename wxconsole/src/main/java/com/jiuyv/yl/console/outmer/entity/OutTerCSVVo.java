package com.jiuyv.yl.console.outmer.entity;

/**
 * 导出CSV文件用Vo
 * */
public class OutTerCSVVo {
	
	// 1.导入标识
	// I表示增加，U表示修改，D表示删除
	private String exportFlag;
	
	// 2.外部商户号(银联)
	private String mid;
	
    // 3.收单机构号码
    // 要十位，收单机构代码前加入08
    private String sysOrgCode;
    	
	// 4.终端状态
	private String terStat;
		
	// 5.终端号
	private String tid;
	
	// 6.终端类型
	private String terType;
	
	// 7.业务类型
	private String busiType;
	
	// 8.受理终端绑定电话号码（MIS商户除外） 选填
	private String terPhone;
	
	// 9.受理终端布放地址
	private String terAddr;
	
	// 10.受理终端布放实体店法人名称,选填
	private String terPersonName;
	
	// 受理终端布放实体店营业名称, 选填
	private String terMerName;
	
	// 12.支持业务对应的商户编码, 选填
	private String busiMerNO;
	
	// 13.受理机构代码
	private String orgCode;
	
	// 14.终端序列号
	private String terSerial;
	
	// 15.终端生产企业名称
	private String terMadeFacName;
	
	// 16.终端产品型号
	private String terModel;
	
	// 17.终端布放时间
	private String terDeployTime;
	
	// 18.终端通讯方式
	private String terCommType;
	
	// 19.扫码功能
	private String terScanFunc;
	
	// 20.磁条卡读取功能
	private String terBarCardFunc;
	
	// 21.接触式IC卡读取功能
	private String terContactICFunc;
	
	// 22.非接IC卡读取功能
	private String terNonContactICFunc;
	
	// 23.无卡支付功能
	private String terNoCardPayFunc;
	
	// 24.终端业务功能
	private String terBusiFunc;

	// 商户名称
	private String merName;
	
	private String confTime;
	/**
	 * @return the exportFlag
	 */
	public String getExportFlag() {
		return exportFlag;
	}

	/**
	 * @param exportFlag the exportFlag to set
	 */
	public void setExportFlag(String exportFlag) {
		this.exportFlag = exportFlag;
	}

	/**
	 * @return the mid
	 */
	public String getMid() {
		return mid;
	}

	/**
	 * @param mid the mid to set
	 */
	public void setMid(String mid) {
		this.mid = mid;
	}

	   /**
     * @return the sysOrgCode
     */
    public String getSysOrgCode() {
        return sysOrgCode;
    }

    /**
     * @param sysOrgCode the sysOrgCode to set
     */
    public void setSysOrgCode(String sysOrgCode) {
        this.sysOrgCode = sysOrgCode;
    }


	public String getTerStat() {
		return terStat;
	}


	public void setTerStat(String terStat) {
		this.terStat = terStat;
	}


	public String getTid() {
		return tid;
	}


	public void setTid(String tid) {
		this.tid = tid;
	}


	public String getTerType() {
		return terType;
	}

	public void setTerType(String terType) {
		this.terType = terType;
	}


	public String getBusiType() {
		return busiType;
	}


	public void setBusiType(String busiType) {
		this.busiType = busiType;
	}


	public String getTerPhone() {
		return terPhone;
	}

	public void setTerPhone(String terPhone) {
		this.terPhone = terPhone;
	}


	public String getTerAddr() {
		return terAddr;
	}

	public void setTerAddr(String terAddr) {
		this.terAddr = terAddr;
	}


	public String getTerPersonName() {
		return terPersonName;
	}


	public void setTerPersonName(String terPersonName) {
		this.terPersonName = terPersonName;
	}

	public String getTerMerName() {
		return terMerName;
	}


	public void setTerMerName(String terMerName) {
		this.terMerName = terMerName;
	}


	public String getBusiMerNO() {
		return busiMerNO;
	}


	public void setBusiMerNO(String busiMerNO) {
		this.busiMerNO = busiMerNO;
	}


	public String getOrgCode() {
		return orgCode;
	}

	/**
	 * @param licenseNo the licenseNo to set
	 */
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}


	public String getTerSerial() {
		return terSerial;
	}


	public void setTerSerial(String terSerial) {
		this.terSerial = terSerial;
	}


	public String getTerMadeFacName() {
		return terMadeFacName;
	}


	public void setTerMadeFacName(String terMadeFacName) {
		this.terMadeFacName = terMadeFacName;
	}


	public String getTerModel() {
		return terModel;
	}


	public void setTerModel(String terModel) {
		this.terModel = terModel;
	}


	public String getTerDeployTime() {
		return terDeployTime;
	}


	public void setTerDeployTime(String terDeployTime) {
		this.terDeployTime = terDeployTime;
	}


	public String getTerCommType() {
		return terCommType;
	}


	public void setTerCommType(String terCommType) {
		this.terCommType = terCommType;
	}


	public String getTerScanFunc() {
		return terScanFunc;
	}


	public void setTerScanFunc(String terScanFunc) {
		this.terScanFunc = terScanFunc;
	}


	public String getTerBarCardFunc() {
		return terBarCardFunc;
	}


	public void setTerBarCardFunc(String terBarCardFunc) {
		this.terBarCardFunc = terBarCardFunc;
	}


	public String getTerContactICFunc() {
		return terContactICFunc;
	}


	public void setTerContactICFunc(String terContactICFunc) {
		this.terContactICFunc = terContactICFunc;
	}


	public String getTerNonContactICFunc() {
		return terNonContactICFunc;
	}


	public void setTerNonContactICFunc(String terNonContactICFunc) {
		this.terNonContactICFunc = terNonContactICFunc;
	}

	public String getTerNoCardPayFunc() {
		return terNoCardPayFunc;
	}


	public void setTerNoCardPayFunc(String terNoCardPayFunc) {
		this.terNoCardPayFunc = terNoCardPayFunc;
	}


	public String getTerBusiFunc() {
		return terBusiFunc;
	}

    public void setTerBusiFunc(String terBusiFunc) {
        this.terBusiFunc = terBusiFunc;
    }
    
	public void setMerName(String merName) {
		this.merName = merName;
	}

    public String getMerName() {
        return merName;
    }

    public String getConfTime() {
        return confTime;
    }

    public void setConfTime(String confTime) {
        this.confTime = confTime;
    }
}
