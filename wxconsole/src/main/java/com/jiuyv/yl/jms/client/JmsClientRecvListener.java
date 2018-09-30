package com.jiuyv.yl.jms.client;

import javax.jms.Message;
import javax.jms.MessageListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.yl.console.orgmngr.util.AES;



/**
 * 积分监听器
 * 
 * @author dongyu 2013-2-4 Shanghai Huateng Co.
 */
public class JmsClientRecvListener implements MessageListener {
	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(JmsClientRecvListener.class);

	/**
	 * client templeate
	 */
	private IClientSendMessage clientrecv;

	public IClientSendMessage getClientrecv() {
		return clientrecv;
	}

	public void setClientrecv(IClientSendMessage c) {
		this.clientrecv =c;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.jms.MessageListener#onMessage(javax.jms.Message)
	 */
	public void onMessage(Message message) {
		try {
			clientrecv.recvmessagefromserver(message);

		} catch (Exception e) {
			LOGGER.error(e.getMessage());

		}

	}
}
