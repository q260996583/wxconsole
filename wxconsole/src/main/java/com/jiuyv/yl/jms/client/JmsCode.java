package com.jiuyv.yl.jms.client;

public interface JmsCode {
	/**
	 * 应用ID
	 */
	String INST_ID = UUIDUtil.getTimebaseUUID().toString(); 
	/**
	 * 发送方应用ID
	 */
	String MSG_HEADER_SENDID="senderid";
	
	/**
	 * 发送方流水
	 */
	String MSG_HEADER_SEQ="reqTxnSeq";
	/**
	 * 消息的交易代码
	 */
	String MSG_HEADER_TXNCODE="txnCd";
	/**
	 * 消息的同异步标识
	 */
	String MSG_HEADER_ASYNC="isaSync";
	
	/**
	 * 消息的发送系统
	 */
	String MSG_HEADER_SENDSYSTEM="sendSystem";
	/**
	 * 消息的接收系统
	 */
	String MSG_HEADER_RECEIVESYSTEM="receiveSystem";
	
	
}
