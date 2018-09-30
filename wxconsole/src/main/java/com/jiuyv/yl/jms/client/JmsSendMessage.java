package com.jiuyv.yl.jms.client;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import com.jiuyv.yl.jms.client.JmsCode;

public class JmsSendMessage implements IClientSendMessage {

	private JmsTemplate template;
	private JmsTemplate jmsTemplate4async;
	private Destination destination;
	private Destination respDest;

	/** 以报文中通讯流水为主键的一个线程安全hashmap */
	private  ConcurrentHashMap<String, RecvMessageBean> excuterthreadsmap = new ConcurrentHashMap<String, RecvMessageBean>();

	private static final Logger LOG = LoggerFactory
			.getLogger(JmsSendMessage.class);

	/**
	 * 无返回的消息
	 * 
	 * @param txnCd
	 * @param context
	 */
	public void asyncSendMsg( String seq,  String txnCd,
			String txnSender,String txnReceiveer, String context) {
		final String sendsystem=txnSender;
		final String receivesystem=txnReceiveer;
		final String sendContext=context;
		final String sendSeq=seq;
		final String sendtxncd=txnCd;
		jmsTemplate4async.send(destination, new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				Message msg = session.createTextMessage(sendContext);
				msg.setStringProperty(JmsCode.MSG_HEADER_SEQ, sendSeq);
				msg.setStringProperty(JmsCode.MSG_HEADER_TXNCODE, sendtxncd);
				msg.setStringProperty(JmsCode.MSG_HEADER_SENDSYSTEM, sendsystem);
				msg.setStringProperty(JmsCode.MSG_HEADER_RECEIVESYSTEM, receivesystem);
				msg.setBooleanProperty(JmsCode.MSG_HEADER_ASYNC, true);
				return msg;
			}
		});
	}

	/**
	 * 发送信息并获取返回信息
	 * 
	 * @param seq
	 * @param txnCd
	 * @param context
	 * @return
	 */
	public Message sendMsg(String reqTxnSeq,  String txnCd,String txnSender,String txnReceiveer,
			 String context) {
		final String sendsystem=txnSender;
		final String receivesystem=txnReceiveer;
		final String sendContext=context;
		final String sendSeq=reqTxnSeq;
		final String sendtxncd=txnCd;

		RecvMessageBean temprecv = new RecvMessageBean();
		RecvMessageBean exTempRecv = excuterthreadsmap.putIfAbsent(sendSeq,
				temprecv);
		// 如果已存在，就打个警告
		if (exTempRecv != null) {
			LOG.error("{} key duplicated", reqTxnSeq);
		}
		boolean acqureresult = false;
	
		try {
			template.send(destination, new MessageCreator() {
				public Message createMessage(Session session)
						throws JMSException {
					Message msg = session.createTextMessage(sendContext);
					msg.setJMSReplyTo(respDest);
					msg.setStringProperty(JmsCode.MSG_HEADER_SENDID, JmsCode.INST_ID);
					msg.setStringProperty(JmsCode.MSG_HEADER_SEQ, sendSeq);
					msg.setStringProperty(JmsCode.MSG_HEADER_TXNCODE, sendtxncd);
					msg.setStringProperty(JmsCode.MSG_HEADER_SENDSYSTEM, sendsystem);
					msg.setStringProperty(JmsCode.MSG_HEADER_RECEIVESYSTEM, receivesystem);
					msg.setBooleanProperty(JmsCode.MSG_HEADER_ASYNC, false);
					return msg;
				}
			});
			LOG.debug("message sended to {},txnCd_reqTxnSeq_context:{}",
					destination.toString(), txnCd + "_" + reqTxnSeq + "_"
							+ context);

			// 挂在该资源上，等待N秒内有回文
			acqureresult = temprecv.getRecvsemap().tryAcquire(
					template.getReceiveTimeout(), TimeUnit.MILLISECONDS);

		} catch (InterruptedException e) {
			LOG.error("InterruptedException is {}", e.getMessage());

		}
		// 从hashmap里拿到收到的消息
		RecvMessageBean tempresult = excuterthreadsmap.remove(reqTxnSeq);

		if (acqureresult && tempresult != null) {
			Message msg = tempresult.getRecvmsg();
			if (msg != null) {
				LOG.debug(
						"succeed to receive message from {},reqTxnSeq_returnMsg:{}",
						respDest.toString(), reqTxnSeq + "_" + msg);
				return msg;
			} else {
				LOG.error("receive message time out!reqTxnSeq:{}", reqTxnSeq);
				return null;
			}
		}

		LOG.error("receive message time out!reqTxnSeq:{}", reqTxnSeq);
		LOG.error(" map size is [{}]", excuterthreadsmap.size());
		return null;
	}

	/**
	 * @return the template
	 */
	public JmsTemplate getTemplate() {
		return template;
	}

	/**
	 * @param template
	 *            the template to set
	 */
	public void setTemplate(JmsTemplate template) {
		this.template = template;
	}

	/**
	 * @return the destination
	 */
	public Destination getDestination() {
		return destination;
	}

	/**
	 * @param destination
	 *            the destination to set
	 */
	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	/**
	 * @return the respDest
	 */
	public Destination getRespDest() {
		return respDest;
	}

	/**
	 * @param respDest
	 *            the respDest to set
	 */
	public void setRespDest(Destination respDest) {
		this.respDest = respDest;
	}

	public void recvmessagefromserver(Message recvmessage) {
		if (recvmessage == null) {
			LOG.info(" recvmessagefromserver error");
			return;
		}
		/* 得到通讯报文中包号 */

		String key;
		try {
			key = recvmessage.getStringProperty(JmsCode.MSG_HEADER_SEQ);
			RecvMessageBean temprecv = excuterthreadsmap.get(key);

			if (temprecv != null) {
				temprecv.setRecvmsg(recvmessage);
				temprecv.getRecvsemap().release();
			} else {
				LOG.info(" map size is [{}]", excuterthreadsmap.size());
				LOG.info(" recvmessagefromserver key [{}]: is null", key);
			}
		} catch (JMSException e) {

			LOG.error(e.getMessage());
		}
		// 挂在资源上的消息放入，同时唤醒工作线程

	}

	/**
	 * @return the jmsTemplate4async
	 */
	public JmsTemplate getJmsTemplate4async() {
		return jmsTemplate4async;
	}

	/**
	 * @param jmsTemplate4async
	 *            the jmsTemplate4async to set
	 */
	public void setJmsTemplate4async(JmsTemplate jmsTemplate4async) {
		this.jmsTemplate4async = jmsTemplate4async;
	}

	





	
	
}
