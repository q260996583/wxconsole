package com.jiuyv.yl.jms.client;

import javax.jms.Message;




public interface IClientSendMessage {


	public void recvmessagefromserver(Message recvmessage);

	void asyncSendMsg( String seq, String txnCd,  String txnSender,String txnReceiveer, String context);
	Message sendMsg( String reqTxnSeq,  String txnCd,String txnSender,String txnReceiveer,  String context);
	}
