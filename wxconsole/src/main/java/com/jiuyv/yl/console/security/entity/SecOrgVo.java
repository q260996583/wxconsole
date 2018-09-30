package com.jiuyv.yl.console.security.entity;

import java.util.ArrayList;
import java.util.List;

public class SecOrgVo {
	private String orgCode;
	private String fatherOrgCode;

	private List<SecOrgVo> children = new ArrayList<SecOrgVo>();

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getFatherOrgCode() {
		return fatherOrgCode;
	}

	public void setFatherOrgCode(String fatherOrgCode) {
		this.fatherOrgCode = fatherOrgCode;
	}

	public List<SecOrgVo> getChildren() {
		return children;
	}

	public void setChildren(List<SecOrgVo> children) {
		this.children = children;
	}

}
