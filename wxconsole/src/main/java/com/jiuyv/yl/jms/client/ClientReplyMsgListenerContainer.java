package com.jiuyv.yl.jms.client;

import org.springframework.jms.listener.DefaultMessageListenerContainer;

import com.jiuyv.yl.jms.client.JmsCode;




public class ClientReplyMsgListenerContainer extends DefaultMessageListenerContainer {
	private String localSystem;
	/**
	 * 
	 */
	public ClientReplyMsgListenerContainer() {
		super();
	}
	
	public void setMessageSelector(String messageSelector) {
		
		
	}
	

	
	public String getLocalSystem() {
		return localSystem;
	}
	public void setLocalSystem(String localSystem) {
		this.localSystem = localSystem;
		 String selector = JmsCode.MSG_HEADER_SENDID+"= '" + JmsCode.INST_ID + "' AND "+JmsCode.MSG_HEADER_RECEIVESYSTEM+"= '"+localSystem+"'";
			
			//设置过滤器
			if (this.getMessageSelector()==null ||"".equals(this.getMessageSelector())){
				super.setMessageSelector(selector);
			}else{
				super.setMessageSelector(this.getMessageSelector()+" AND "+selector);

			}
	}

	

}
