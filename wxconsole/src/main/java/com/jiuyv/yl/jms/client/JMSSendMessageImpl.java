package com.jiuyv.yl.jms.client;

import java.io.IOException;

import javax.jms.Message;
import javax.jms.TextMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.yl.console.trans.entity.CouponTransVo;
import com.jiuyv.yl.jms.client.IClientSendMessage;
import com.jiuyv.yl.jms.client.PosPException;
import com.jiuyv.yl.jms.client.UUIDUtil;
import com.jiuyv.yl.jms.client.entity.ISO8583Bean128;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiuyu.posp.protocol.ISO8583Bean128Center;



/**
 * @author dongyu 2013-3-7 Shanghai Huateng Co.
 */
public class JMSSendMessageImpl implements IMessageService {
	private IClientSendMessage jmsSendUtil;
	private String localSystem;
	private String receivePosgate;
	private String receivePosCenter;
	private String receivePosCups;
	private String receivePosCcb;
	private String receivedfsgate;
	
	
	public String getReceivedfsgate() {
		return receivedfsgate;
	}

	public void setReceivedfsgate(String receivedfsgate) {
		this.receivedfsgate = receivedfsgate;
	}

	private ObjectMapper jsonMapper;
	private static final Logger LOG = LoggerFactory
			.getLogger(JMSSendMessageImpl.class);
	public ISO8583Bean128 sendMessage(ISO8583Bean128 sendbean)throws PosPException, IOException{
		ISO8583Bean128 resp = null;
		String txnCd = sendbean.getMessagecode();
	
		String jmsSeq=UUIDUtil.getTimebaseUUID().toString();
		String jsonObj = jsonMapper.writeValueAsString(sendbean);
		
		Message tempmessage= jmsSendUtil.sendMsg(jmsSeq, txnCd,this.localSystem,this.receivePosgate, jsonObj);
		if(tempmessage==null){
			return null;
		}
		TextMessage msg=(TextMessage)tempmessage;		
		String respString = null;
		try {
			respString = msg.getText();
			
		} catch (Exception e) {
			LOG.error("get text msg from return message result error : {}",
					e.getMessage());
	
		}
		
		resp = jsonMapper.readValue(respString,ISO8583Bean128.class);
	

		return resp;
	}

	@Override
	public ISO8583Bean128Center sendMessage(ISO8583Bean128Center sendbean)
			throws PosPException, IOException {
		ISO8583Bean128Center resp = null;
		String txnCd = sendbean.getMessagecode();
	
		String jmsSeq=UUIDUtil.getTimebaseUUID().toString();
		sendbean.setSystemTraceId(jmsSeq);
		String jsonObj = jsonMapper.writeValueAsString(sendbean);
		
		Message tempmessage= jmsSendUtil.sendMsg(jmsSeq, txnCd,this.localSystem,this.receivePosCenter, jsonObj);
		if(tempmessage==null){
			return null;
		}
		TextMessage msg=(TextMessage)tempmessage;		
		String respString = null;
		try {
			respString = msg.getText();
			
		} catch (Exception e) {
			LOG.error("get text msg from return message result error : {}",
					e.getMessage());
	
		}
		
		resp = jsonMapper.readValue(respString,ISO8583Bean128Center.class);
	

		return resp;
	}	
	
	@Override
	public ISO8583Bean128Center sendMessageCups(ISO8583Bean128Center sendbean)
			throws PosPException, IOException {
		ISO8583Bean128Center resp = null;
		String txnCd = sendbean.getMessagecode();
	
		String jmsSeq=UUIDUtil.getTimebaseUUID().toString();
		sendbean.setSystemTraceId(jmsSeq);
		String jsonObj = jsonMapper.writeValueAsString(sendbean);
		
		Message tempmessage= jmsSendUtil.sendMsg(jmsSeq, txnCd,this.localSystem,this.receivePosCups, jsonObj);
		if(tempmessage==null){
			return null;
		}
		TextMessage msg=(TextMessage)tempmessage;		
		String respString = null;
		try {
			respString = msg.getText();
			
		} catch (Exception e) {
			LOG.error("get text msg from return message result error : {}",
					e.getMessage());
	
		}
		
		resp = jsonMapper.readValue(respString,ISO8583Bean128Center.class);
	

		return resp;
	}	
	
	/**
	 * @return the jmsSendUtil
	 */
	public IClientSendMessage getJmsSendUtil() {
		return jmsSendUtil;
	}

	/**
	 * @param jmsSendUtil
	 *            the jmsSendUtil to set
	 */
	public void setJmsSendUtil(IClientSendMessage jmsSendUtil) {
		this.jmsSendUtil = jmsSendUtil;
	}

	/**
	 * @return the jsonMapper
	 */
	public ObjectMapper getJsonMapper() {
		return jsonMapper;
	}

	/**
	 * @param jsonMapper
	 *            the jsonMapper to set
	 */
	public void setJsonMapper(ObjectMapper jsonMapper) {
		this.jsonMapper = jsonMapper;
	}

	public String getLocalSystem() {
		return localSystem;
	}

	public void setLocalSystem(String localSystem) {
		this.localSystem = localSystem;
	}

	public String getReceivePosgate() {
		return receivePosgate;
	}

	public void setReceivePosgate(String receivePosgate) {
		this.receivePosgate = receivePosgate;
	}

	public String getReceivePosCenter() {
		return receivePosCenter;
	}

	public void setReceivePosCenter(String receivePosCenter) {
		this.receivePosCenter = receivePosCenter;
	}

	public String getReceivePosCups() {
		return receivePosCups;
	}

	public void setReceivePosCups(String receivePosCups) {
		this.receivePosCups = receivePosCups;
	}

	public String getReceivePosCcb() {
		return receivePosCcb;
	}

	public void setReceivePosCcb(String receivePosCcb) {
		this.receivePosCcb = receivePosCcb;
	}

	@Override
	public ISO8583Bean128Center sendMessageCcp(ISO8583Bean128Center sendbean)
			throws PosPException, IOException {
		ISO8583Bean128Center resp = null;
		String txnCd = sendbean.getMessagecode();
	
		String jmsSeq=UUIDUtil.getTimebaseUUID().toString();
		sendbean.setSystemTraceId(jmsSeq);
		String jsonObj = jsonMapper.writeValueAsString(sendbean);
		
		Message tempmessage= jmsSendUtil.sendMsg(jmsSeq, txnCd,this.localSystem,this.receivePosCcb, jsonObj);
		if(tempmessage==null){
			return null;
		}
		TextMessage msg=(TextMessage)tempmessage;		
		String respString = null;
		try {
			respString = msg.getText();
			
		} catch (Exception e) {
			LOG.error("get text msg from return message result error : {}",
					e.getMessage());
	
		}
		
		resp = jsonMapper.readValue(respString,ISO8583Bean128Center.class);
	

		return resp;
	}

	@Override
	public CouponTransVo sendMessagedfsgate(CouponTransVo sendbean)
			throws PosPException, IOException {
		CouponTransVo resp = null;
		String txnCd = sendbean.getMsgType();
	
		String jmsSeq=UUIDUtil.getTimebaseUUID().toString();
//		sendbean.setSystemTraceId(jmsSeq);
		String jsonObj = jsonMapper.writeValueAsString(sendbean);
		
		Message tempmessage= jmsSendUtil.sendMsg(jmsSeq, txnCd,this.localSystem,this.receivedfsgate, jsonObj);
		if(tempmessage==null){
			return null;
		}
		TextMessage msg=(TextMessage)tempmessage;		
		String respString = null;
		try {
			respString = msg.getText();
			
		} catch (Exception e) {
			LOG.error("get text msg from return message result error : {}",
					e.getMessage());
	
		}
		
		resp = jsonMapper.readValue(respString,CouponTransVo.class);
	

		return resp;
	}

}
