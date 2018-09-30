package com.jiuyv.yl.console.orgmngr.entity;

import java.io.Serializable;

public class TaskVo  implements Serializable{

	private String merName;
	private String taskName;    //任务名称
	private String mid;
	private String expression;  //发送频率
	private String createTime;
	private String updateTime;
	private String taskId;
	private String taskType;    //任务类型
	private String fileType;    //发送频率文件类型
	private String sendMethod;  //发送方式
	private String state;       //发送状态   0正常 1执行中 2执行完毕 3删除状态
	private String rst;         //结果   1成功 0失败
	private String reason;		//失败原因
	private String remark;		//备注
	private String ext1;
	private String userName;    //操作员名称
	private String loginID;     //操作员ID
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getLoginID() {
		return loginID;
	}


	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}


	public String getTaskId() {
		return taskId;
	}


	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}


	public String getTaskType() {
		return taskType;
	}


	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}


	public String getFileType() {
		return fileType;
	}


	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getSendMethod() {
		return sendMethod;
	}


	public void setSendMethod(String sendMethod) {
		this.sendMethod = sendMethod;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getRst() {
		return rst;
	}

	public void setRst(String rst) {
		this.rst = rst;
	}

	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getExt1() {
		return ext1;
	}


	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}


	public TaskVo()
	{

	}


	public String getMerName() {
		return merName;
	}


	public void setMerName(String merName) {
		this.merName = merName;
	}


	public String getTaskName() {
		return taskName;
	}


	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getExpression() {
		return expression;
	}


	public void setExpression(String expression) {
		this.expression = expression;
	}


	public String getCreateTime() {
		return createTime;
	}


	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	public String getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	
	
}
